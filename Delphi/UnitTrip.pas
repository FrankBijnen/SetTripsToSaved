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
    Unused: byte; // Maybe items including self? Always LocItems +1
    LocItems: DWORD;
    Terminator: byte;
  end;

  TScnPosn = packed record
    ScnSize: DWORD;
    Val1: DWORD;
    Lat: integer;
    Lon: integer;
  end;

  TVersion = packed record
    Major: DWORD;
    Minor: DWORD;
  end;

  TAllRoutes = packed record
    DbHandles: integer;
    val2: DWORD;
    DbHandlesSize: DWORD;
    val4: DWORD;
    Unused: byte; // Maybe items including self? Always LocItems +1
    Terminator: byte;
  end;

  TUdbHandle = packed record
    KeyLen: dword;
    KeyName: array[0..11] of ansichar;
    ValueLen: dword;
    DataType: byte;
    Unused1: array[0..157] of byte;
    DbHandles: WORD;
    Unused2: array[0..1287] of byte;
  end;

  TSubClass = packed record
    MapSegment: DWORD;
    RoadId: DWORD;
    PointType: byte;
    Direction: byte;
    Reserved2: array[0..5] of byte;
  end;

  TUdbDir = packed record
    SubClass: TSubClass;
    Lat: integer;
    Lon: integer;
    Unused: array[0..5] of DWORD;
    Name: array[0..120] of UCS4Char;
  end;

function ProcessTripFile(const TripFile: string; TripInfo, LocInfo, RouteInfo: TStrings; ProcessOption: TProcessOption): boolean;

implementation

uses System.AnsiStrings, System.DateUtils, System.Character;

const BoolValues: array[False .. True] of string = ('False', 'True');

function Swap32(I: dword): dword;
begin
  PByteArray(@result)[0] := pbytearray(@I)[3];
  PByteArray(@result)[1] := pbytearray(@I)[2];
  PByteArray(@result)[2] := pbytearray(@I)[1];
  PByteArray(@result)[3] := pbytearray(@I)[0];
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
    RouteInfo.AddPair(string(UdbHandle.KeyName), 'Begin',
                      TObject(StartFilePos));
    RouteInfo.AddPair(string(UdbHandle.KeyName), Format('Count: %d', [UdbHandle.DbHandles]),
                      TObject(StartFilePos + (integer(@UdbHandle.DbHandles) - integer(@UdbHandle.KeyLen)) ));
    RouteInfo.AddPair(string(UdbHandle.KeyName), 'End',
                      TObject(StartFilePos + (integer(@UdbHandle.Unused2) - integer(@UdbHandle.KeyLen)) ));
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
                        Format('Type: 0x%.2x, Dir: 0x%.2x %s', [UdbDir.SubClass.PointType, UdbDir.SubClass.Direction, ValueString]),
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
    3,4:
      begin // DWORD integer;
        BlockRead(F, ValueDword, SizeOf(ValueDword), BytesRead);
        if (BytesRead = 0) then
          exit(false);
        ValueDWord := Swap32(ValueDWord);
        Msg := Format('%d', [ValueDWord]);
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
              if (BytesRead = 0) then
                exit(false);
              Msg := Format('0x%.8x, Lat: %.7g, Lon: %.7g',
              [ScnPosn.Val1, // TODO. Looks like unitid, software version etc.
               ScnPosn.Lat / 4294967296 * 360,
               ScnPosn.Lon / 4294967296 * 360]
              );
            end;
          else
          begin
            BlockRead(F, Version, SizeOf(Version), BytesRead);
            if (BytesRead = 0) then
              exit(false);
            Msg := Format('0x%.8x, 0x%.8x', [Version.Major, Version.Minor]);
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
        Msg := Format('List Datatype %d, Length: %d', [datatype, ValueLen]);
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
          StartFilePos := FilePos(F);
          BlockRead(F, AllRoutes, SizeOf(AllRoutes), BytesRead);
          if (BytesRead = 0) then
            exit(false);
          AllRoutes.DbHandles := Swap32(AllRoutes.DbHandles);
          AllRoutes.DbHandlesSize := Swap32(AllRoutes.DbHandlesSize);
          RouteInfo.AddPair('mUdbHandles', Format('Count: %d Size: %d', [AllRoutes.DbHandles, AllRoutes.DbHandlesSize]), TObject(StartFilePos));
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

    ListInfo.AddPair(string(KeyName), Msg, Tobject(StartFilePos));
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
