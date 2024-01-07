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

function ProcessTripFile(const TripFile: string; TripInfo: TStrings; ProcessOption: TProcessOption): boolean;

implementation

uses System.AnsiStrings;

function Swap32(I: dword): dword;
begin
  PByteArray(@result)[0] := pbytearray(@I)[3];
  PByteArray(@result)[1] := pbytearray(@I)[2];
  PByteArray(@result)[2] := pbytearray(@I)[1];
  PByteArray(@result)[3] := pbytearray(@I)[0];
end;

function ProcessTripFile(const TripFile: string; TripInfo: TStrings; ProcessOption: TProcessOption): boolean;
var HeaderRec: TheaderRec;
    Indx: integer;
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
    SaveFilePos: int64;
    Msg: string;
    F: file;

const BoolValues: array[False .. True] of string = ('False', 'True');

begin
  result := false;
  TripInfo.BeginUpdate;
  TripInfo.Clear;

  FileMode := fmOpenReadWrite;
  AssignFile(F, TripFile);
  Reset(F, 1);
  try
    BlockRead(F, HeaderRec, SizeOf(HeaderRec));
    if (System.AnsiStrings.StrPas(HeaderRec.TripId) <> 'TRPL') then
      exit;
    HeaderRec.FileSize := Swap32(HeaderRec.FileSize);
    TripInfo.AddPair('FileSize', Format('%d',[HeaderRec.FileSize]));
    TripInfo.AddPair('HeaderLength', Format('%d',[HeaderRec.HdrLen])); // Silly, the size of the record is always 10 + 4(TRPL)
    HeaderRec.Items := Swap32(HeaderRec.Items);
    TripInfo.AddPair('Total Items', Format('%d',[HeaderRec.Items]));

    while (true) do
    begin
      BlockRead(F, KeyLen, SizeOf(KeyLen), BytesRead);
      if (BytesRead = 0) then
        break;
      KeyLen := Swap32(KeyLen);

      KeyName := AnsiStrAlloc(KeyLen +1);
      FillChar(KeyName^, KeyLen+1, 0);
      BlockRead(F, KeyName^, KeyLen, BytesRead);
      if (BytesRead = 0) then
        break;

      BlockRead(F, ValueLen, SizeOf(ValueLen), BytesRead);
      if (BytesRead = 0) then
        break;
      ValueLen := Swap32(ValueLen);

      BlockRead(F, DataType, SizeOf(DataType), BytesRead);
      if (BytesRead = 0) then
        break;

      SaveFilePos := FilePos(F);

      case DataType of
         1: begin // Byte integer;
              BlockRead(F, ValueByte, SizeOf(ValueByte), BytesRead);
              if (BytesRead = 0) then
                break;
              Msg := Format('%d', [ValueByte]);
            end;
         3,4:begin // DWORD integer;
              BlockRead(F, ValueDword, SizeOf(ValueDword), BytesRead);
              if (BytesRead = 0) then
                break;
              ValueDWord := Swap32(ValueDWord);
              Msg := Format('%d', [ValueDWord]);
            end;
         7: begin // Bool
              BlockRead(F, ValueBool, SizeOf(ValueBool), BytesRead);
              if (BytesRead = 0) then
                break;
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
                  result := true;
                end;
              end;
              Msg := Format('%s', [BoolValues[ValueBool]]);
            end;
         14:begin // String
              // TODO: Convert from UTF32
              BlockRead(F, PCharLen, SizeOf(PCharLen), BytesRead);
              if (BytesRead = 0) then
                break;
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
         else
            begin
              Msg := Format('Datatype %d, Length: %d', [datatype, ValueLen]);
            end;
      end;
      TripInfo.AddPair(string(KeyName), Msg);
      System.AnsiStrings.StrDispose(KeyName);

      BlockRead(F, Terminator, SizeOf(Terminator), BytesRead);
      if (BytesRead = 0) then
        break;

  //Failsafe, if we have missed some data
      Seek(F, SaveFilePos + ValueLen);
    end;
  finally
    CloseFile(F);
    TripInfo.EndUpdate;
  end;
end;


end.
