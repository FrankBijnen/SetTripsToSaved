unit UnitTrip;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TProcessOption = (CheckOnly, SetToSaved, SetToImported);

  THeaderRec = packed record
    TripId: array [0..3] of AnsiChar;
    FileSize: DWORD;
    HdrLen: byte;
    Items: DWORD;
    Terminator: byte;
  end;

  TLocationRec = packed record
    LocId: array [0..3] of AnsiChar;
    LocSize: DWORD;
    Unknown1: byte; // Maybe items including self? Always LocItems +1
    LocItems: DWORD;
    Terminator: byte;
  end;

  TScnPosn = packed record
    ScnSize: DWORD;
    Unknown1: DWORD;
    Lat: integer;
    Lon: integer;
  end;

  TVersion = packed record
    Major: DWORD;
    Minor: DWORD;
  end;

  TAllRoutes = packed record
    DbHandles: integer;
    Unknown1: DWORD;
    DbHandlesSize: DWORD;
    DataType: byte;
    HandleId: integer;
    Terminator: byte;
  end;

  TUdbHandle = packed record
    KeyLen: dword;
    KeyName: array[0..11] of ansichar;
    ValueLen: dword;
    DataType: byte;
    UdbHandleSize: dword;
    Unknown2: dword;  // Only value seen: 0538feff
    Unknown3: array[0..149] of byte;
    DbHandles: WORD;
    Unknown4: array[0..1287] of byte;
  end;

  TSubClass = packed record
    MapSegment: DWORD;
    RoadId: DWORD;
    PointType: byte;
    Direction: byte;
    Unknown1: array[0..5] of byte;
  end;

  TUdbDir = packed record
    SubClass: TSubClass;
    Lat: integer;
    Lon: integer;
    Unknown1: array[0..5] of DWORD; // Unknown1[0] = 69045951
    Name: array[0..120] of UCS4Char;
  end;

function ProcessTripFile(const TripFile: string; TripInfo, LocInfo, RouteInfo: TStrings; ProcessOption: TProcessOption): boolean;

implementation

uses System.AnsiStrings, System.DateUtils, System.Character;

const BoolValues: array[False .. True] of string = ('False', 'True');

type
  T4Bytes = array[0..3] of byte;

function Swap32(I: T4Bytes): T4Bytes; overload;
begin
  result[0] := I[3];
  result[1] := I[2];
  result[2] := I[1];
  result[3] := I[0];
end;

function Swap32(I: integer): integer; overload;
begin
  result := integer(Swap32(T4BYtes(I)));
end;

function Swap32(I: DWORD): DWORD; overload;
begin
  result := DWORD(Swap32(T4BYtes(I)));
end;

function Swap32(I: single): single; overload;
begin
  result := Single(Swap32(T4BYtes(I)));
end;

function ProcessTripFile(const TripFile: string; TripInfo, LocInfo, RouteInfo: TStrings; ProcessOption: TProcessOption): boolean;
var HeaderRec: TheaderRec;
    ImportedUpd: boolean;
    F: file;

  // Get the size and #items of the locations. (Via/Shaping points)
  procedure GetLocationCount(var LocCnt: Dword);
  var
    BytesRead: integer;
    StartFilePos: int64;
  begin
    StartFilePos := FilePos(F);
    LocCnt := 0;
    BlockRead(F, LocCnt, SizeOf(LocCnt), BytesRead);
    LocCnt := Swap32(LocCnt);
    LocInfo.AddPair('Location count', Format('%d', [LocCnt]), TObject(StartFilePos));

  end;

  // Get the size and #items of the locations. (Via/Shaping points)
  procedure ProcessLocation(var LocSize, LocItems: Dword);
  var
    LCTN: TLocationRec;
    BytesRead: integer;
  begin
    LocSize := 0;
    LocItems := 0;

    // Should be LCTN
    FillChar(LCTN, SizeOf(LCTN), 0);
    BlockRead(F, LCTN, SizeOf(LCTN), BytesRead);
    if (BytesRead = 0) or
       (System.AnsiStrings.StrPas(LCTN.LocId) <> 'LCTN') then
      exit;

    LocSize   := Swap32(LCTN.LocSize) + SizeOf(LCTN.LocId) + Sizeof(LCTN.LocSize);
    LocItems  := Swap32(LCTN.LocItems);
  end;

  function ProcessRoute(Last: boolean): boolean;
  var
    UdbHandle: TUdbHandle;
    UdbIndx: integer;
    UdbDir: TUdbDir;
    ValueString: string;
    StartFilePos: int64;
    BytesRead: integer;
    Indx: integer;
  begin
    StartFilePos := FilePos(F);
    BlockRead(f, UdbHandle, Sizeof(UdbHandle), BytesRead);
    if (BytesRead = 0) then
      exit(false);
    UdbHandle.KeyLen := Swap32(UdbHandle.KeyLen);
    if (UdbHandle.KeyName <> 'mUdbDataHndl') then
      exit(false);
    UdbHandle.ValueLen := Swap32(UdbHandle.ValueLen);
    UdbHandle.UdbHandleSize := Swap32(UdbHandle.UdbHandleSize);

    RouteInfo.AddPair(string(UdbHandle.KeyName), Format('Begin: Size: %d Datatype: %d', [UdbHandle.ValueLen, UdbHandle.DataType]),
                      TObject(StartFilePos));
    RouteInfo.AddPair(string(UdbHandle.KeyName), Format('Size: %d, Unknown2: 0x%.8x, Unknown3: %d bytes',
                      [UdbHandle.UdbHandleSize, UdbHandle.Unknown2, SizeOf(UdbHandle.Unknown3)]),
                      TObject(StartFilePos + (integer(@UdbHandle.UdbHandleSize) - integer(@UdbHandle.KeyLen)) ));
    RouteInfo.AddPair(string(UdbHandle.KeyName), Format('Count: %d',
                      [UdbHandle.DbHandles]),
                      TObject(StartFilePos + (integer(@UdbHandle.DbHandles) - integer(@UdbHandle.KeyLen)) ));
    RouteInfo.AddPair(string(UdbHandle.KeyName), Format('End: Unknown4: %d bytes', [SizeOf(UdbHandle.Unknown4)]),
                      TObject(StartFilePos + (integer(@UdbHandle.Unknown4) - integer(@UdbHandle.KeyLen))));
    for UdbIndx := 1 to UdbHandle.DbHandles do
    begin
      StartFilePos := FilePos(F);
      BlockRead(f, UdbDir, Sizeof(UdbDir), BytesRead);
      UdbDir.SubClass.MapSegment := Swap32(UdbDir.SubClass.MapSegment);
      UdbDir.SubClass.RoadId := Swap32(UdbDir.SubClass.RoadId);

      if (BytesRead = 0) then
        exit(false);
      ValueString := '';
      for Indx := 0 to High(UdbDir.Name) do
      begin
        if (UdbDir.Name[Indx] < 20) then
          break;
        ValueString := ValueString + char(UdbDir.Name[Indx]);
      end;
      RouteInfo.AddPair(Format('Lat: %.7g, Lon: %.7g Mapseg: 0x%.8x Road: 0x%.8x' ,
                              [UdbDir.Lat / 4294967296 * 360,
                               UdbDir.Lon / 4294967296 * 360,
                               UdbDir.SubClass.MapSegment,
                               UdbDir.SubClass.RoadId]
                              ),
                        Format('Type: 0x%.2x, Dir: 0x%.2x Unknown: 0x%.8x 0x%.8x 0x%.8x 0x%.8x 0x%.8x 0x%.8x Name: %s',
                               [UdbDir.SubClass.PointType, UdbDir.SubClass.Direction,
                               UdbDir.Unknown1[0],
                               UdbDir.Unknown1[1],
                               UdbDir.Unknown1[2],
                               UdbDir.Unknown1[3],
                               UdbDir.Unknown1[4],
                               UdbDir.Unknown1[3],
                               ValueString]),
                        TObject(StartFilePos));
    end;
// last one ends with 09
// others have 13 bytes more
    StartFilePos := FilePos(F);
    if (Last) then
      Seek(F, StartFilePos + 1)
    else
      Seek(F, StartFilePos + 14);

    RouteInfo.AddPair(string(UdbHandle.KeyName), 'Terminator', TObject(StartFilePos));
    result := true;
  end;

  function ProcessList(ListInfo: TStrings; ProcessOption: TProcessOption): boolean;
  var
      Indx: integer;
      LocIndx: integer;
      KeyLen: DWORD;
      KeyName: PAnsiChar;
      ValueLen: Dword;

      DataType: byte;
      BytesRead: integer;
      ValueBool: boolean;
      NewValueBool: boolean;
      ValueByte: byte;
      ValueDword: DWORD;
      ValueSingle: Single;
      ValueEpoch: int64;
      ValueString: string;
      PCharLen: smallint;
      PCharDword: DWORD;
      Terminator: byte;
      StartFilePos: int64;
      SaveFilePos: int64;
      Msg: string;
      LocCnt: Dword;
      LocItems: Dword;
      LocBytes: Dword;
      LocFilePos: int64;
      ScnPosn: TScnPosn;
      Version: TVersion;
      AllRoutes: TAllRoutes;

begin
    StartFilePos := FilePos(F);
    BlockRead(F, KeyLen, SizeOf(KeyLen), BytesRead);
    if (BytesRead = 0) then
      exit(false);
    KeyLen := Swap32(KeyLen);

    KeyName := AnsiStrAlloc(KeyLen +1);
    FillChar(KeyName^, KeyLen+1, 0);
    BlockRead(F, KeyName^, KeyLen, BytesRead);
    if (BytesRead = 0) then
      exit(false);

    BlockRead(F, ValueLen, SizeOf(ValueLen), BytesRead);
    if (BytesRead = 0) then
      exit(false);
    ValueLen := Swap32(ValueLen);

    BlockRead(F, DataType, SizeOf(DataType), BytesRead);
    if (BytesRead = 0) then
      exit(false);

    SaveFilePos := FilePos(F);

    case DataType of
    1:
      begin // Byte integer;
        BlockRead(F, ValueByte, SizeOf(ValueByte), BytesRead);
        if (BytesRead = 0) then
         exit(false);
        Msg := Format('%d', [ValueByte]);
      end;
    3:
      begin // DWORD integer;
        BlockRead(F, ValueDword, SizeOf(ValueDword), BytesRead);
        if (BytesRead = 0) then
          exit(false);
        ValueDWord := Swap32(ValueDWord);
        if (System.AnsiStrings.StrPas(KeyName) = 'mArrival') then
        begin
          if (ValueDword = 0) then
            Msg := 'N/A'
          else
          begin
            ValueEpoch := ValueDword + DateTimeToUnix(EncodeDateTime(1989,12,31,0,0,0,0)); // Starts from 1989/12/31
            Msg := Format('%s', [DateTimeToStr(UnixToDateTime(ValueEpoch, false))]);
          end;
        end
        else
          Msg := Format('%d', [ValueDWord]);
      end;
    4:
      begin // DWORD Single;
        BlockRead(F, ValueSingle, SizeOf(ValueSingle), BytesRead);
        if (BytesRead = 0) then
          exit(false);
        ValueSingle := Swap32(ValueSingle);
        Msg := Format('%f', [ValueSingle]);
      end;
    7:
       begin // Bool
        BlockRead(F, ValueBool, SizeOf(ValueBool), BytesRead);
        if (BytesRead = 0) then
          exit(false);
        if (System.AnsiStrings.StrPas(KeyName) = 'mImported') then
        begin
          NewValueBool := ValueBool;
          case ProcessOption of
            TProcessOption.SetToSaved:
              NewValueBool := false;
            TProcessOption.SetToImported:
              NewValueBool := true;
          end;
          if (ValueBool <> NewValueBool) then
          begin
            Seek(F, SaveFilePos);
            BlockWrite(F, NewValueBool, SizeOf(NewValueBool));
            ValueBool := NewValueBool;
            ImportedUpd := true;
          end;
        end;
        Msg := Format('%s', [BoolValues[ValueBool]]);
      end;
    8:
      begin
        case (Valuelen) of
          SizeOf(ScnPosn) + Sizeof(Terminator):
            begin
              BlockRead(F, ScnPosn, SizeOf(ScnPosn), BytesRead);
              ScnPosn.ScnSize := Swap32(ScnPosn.ScnSize);
              ScnPosn.Unknown1 := Swap32(ScnPosn.Unknown1);
              if (BytesRead = 0) then
                exit(false);
              Msg := Format('ScnSize: %d, Unknown1: 0x%.2x, Lat: %.7g, Lon: %.7g',
              [ScnPosn.ScnSize,
               ScnPosn.Unknown1, // TODO. Looks like unitid, software version etc.
               ScnPosn.Lat / 4294967296 * 360,
               ScnPosn.Lon / 4294967296 * 360]
              );
            end;
          SizeOf(Version) + Sizeof(Terminator):
            begin
              BlockRead(F, Version, SizeOf(Version), BytesRead);
              if (BytesRead = 0) then
                exit(false);
              Msg := Format('0x%.8x, 0x%.8x', [Version.Major, Version.Minor]);
            end;
          else
          begin
            Msg := Format('Length: %d', [Valuelen]);
          end;
        end;
      end;
    14:
      begin // String
        // TODO: Convert from UTF32
        BlockRead(F, PCharLen, SizeOf(PCharLen), BytesRead);
        if (BytesRead = 0) then
          exit(false);
        PCharLen := (Swap(PCharLen) div 4) -1;
        ValueString := '';
        for Indx := 0 to PcharLen do
        begin
          BlockRead(F, PCharDword, SizeOf(PCharDword), BytesRead);
          if (BytesRead = 0) then
            break;
          ValueString := ValueString + char(PCharDword);
        end;
        Msg := Format('%s', [ValueString]);
      end;
    128:
      begin // List
        Msg := 'List';
        if (System.AnsiStrings.StrPas(KeyName) = 'mLocations') then
        begin
          // Get Location count
          GetLocationCount(LocCnt);

          // Get info of each location
          for LocIndx := 1 to LocCnt do
          begin
            LocInfo.AddPair('----LCTN----', Format('%d', [LocIndx]), TObject(FilePos(F)));
            LocFilePos := FilePos(F);
            ProcessLocation(LocBytes, LocItems);
            for Indx := 1 to LocItems do
              ProcessList(LocInfo, ProcessOption);
            Seek(F, LocFilePos + LocBytes); // Position to next location. We are 1 byte off. Missing terminator #9 ?
          end;
          LocInfo.AddPair('***END OF mLocations***','', TObject(FilePos(F)));
        end;
        if (System.AnsiStrings.StrPas(KeyName) = 'mAllRoutes') then
        begin
          BlockRead(F, AllRoutes, SizeOf(AllRoutes), BytesRead);
          if (BytesRead = 0) then
            exit(false);

          AllRoutes.DbHandles := Swap32(AllRoutes.DbHandles);
          AllRoutes.DbHandlesSize := Swap32(AllRoutes.DbHandlesSize);
          AllRoutes.HandleId := Swap32(AllRoutes.HandleId);

          RouteInfo.AddPair('mUdbHandles',
                            Format('Count: %d Unknown1: 0x%.8x, Size: %d, DataType: %d, HandleId: %d',
                            [AllRoutes.DbHandles, AllRoutes.Unknown1, AllRoutes.DbHandlesSize, AllRoutes.DataType, AllRoutes.HandleId]),
                            TObject(SaveFilePos));

          LocFilePos := FilePos(F);
          for Indx := 1 to AllRoutes.DbHandles do
            ProcessRoute(Indx = AllRoutes.DbHandles);

          RouteInfo.AddPair('***END OF mAllRoutes***','', TObject(FilePos(F)));
          Seek(F, LocFilePos + AllRoutes.DbHandlesSize);
        end;
      end;
    else
      begin
        Msg := Format('Datatype %d, Length: %d', [datatype, ValueLen]);
      end;
    end;

    ListInfo.AddPair(string(KeyName), Format('Length: %d, Type: %d, Value: %s', [Valuelen, DataType, Msg]), Tobject(StartFilePos));
    System.AnsiStrings.StrDispose(KeyName);

    BlockRead(F, Terminator, SizeOf(Terminator), BytesRead);
    if (BytesRead = 0) then
      exit(false);

  //Failsafe, if we have missed some data
    Seek(F, SaveFilePos + ValueLen);
    result := true;
  end;

begin
  ImportedUpd := false;
  TripInfo.BeginUpdate;
  TripInfo.Clear;
  LocInfo.BeginUpdate;
  LocInfo.Clear;
  RouteInfo.BeginUpdate;
  RouteInfo.Clear;

  FileMode := fmOpenReadWrite;
  AssignFile(F, TripFile);
  Reset(F, 1);
  try
    BlockRead(F, HeaderRec, SizeOf(HeaderRec));
    if (System.AnsiStrings.StrPas(HeaderRec.TripId) <> 'TRPL') then
      exit(false);
    with HeaderRec do
    begin
      FileSize := Swap32(FileSize);
      TripInfo.AddPair('***BEGIN OF HEADER***','',
                       TObject(0));
      TripInfo.AddPair('FileSize', Format('%d',[FileSize]),
                       TObject(SizeOf(TripId)));
      TripInfo.AddPair('HeaderLength', Format('%d',[HdrLen]),
                       TObject(SizeOf(TripId) + SizeOf(FileSize)));
      HeaderRec.Items := Swap32(Items);
      TripInfo.AddPair('Total Items', Format('%d',[Items]),
                       TObject(SizeOf(TripId) + SizeOf(FileSize) + SizeOf(HdrLen)));
      TripInfo.AddPair('***END OF HEADER***','',
                       TObject(SizeOf(TripId) + SizeOf(FileSize) + SizeOf(HdrLen) + SizeOf(Items)));
    end;

    while ProcessList(TripInfo, ProcessOption) do;
    TripInfo.AddPair('***END OF TRIP***','', TObject(FilePos(F)));
    result := ImportedUpd;

  finally
    CloseFile(F);
    TripInfo.EndUpdate;
    LocInfo.EndUpdate;
    RouteInfo.EndUpdate;
  end;
end;


end.
