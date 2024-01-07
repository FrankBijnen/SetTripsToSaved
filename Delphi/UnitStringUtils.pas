unit UnitStringUtils;

interface

uses Winapi.Windows, System.Sysutils, System.Variants, Winapi.ShellAPI, System.Win.Registry;

function SenSize(const S: int64): string;
function Spc(const Cnt: integer): string;
function NextField(var AString: string; const ADelimiter: string): string;
procedure DebugMsg(const Msg: array of variant);
function GetRegistryValue(const ARootKey: HKEY; const KeyName, Name: string): string;
procedure SetRegistryValue(const ARootKey: HKEY; const KeyName, Name, Value: string);
function TempPath: string;
function TempFilename(const Prefix: string): string;
function CreateTempPath(const Prefix: string): string;
function RemovePath(const ADir: string; const AFlags: FILEOP_FLAGS = FOF_NO_UI): boolean;

implementation

uses Vcl.Forms;

const LenFileSize = 11;
      B  = ' B';
      Kb = ' Kb';
      Mb = ' Mb';

function SenSize(const S: int64): string;
var H: string;
    I: int64;
begin
  H := Spc(LenFileSize);
  if S < (1000000) then
    result := H + FormatFloat('#,##0', S) + B
  else if S < (1000000000) then
    result := H + FormatFloat('#,##0', S / 1024) + Kb
  else
    result := H + FormatFloat('#,##0', S / (1024 * 1024)) + Mb;
  I := length(result);
  result := copy(result, I - LenFileSize + 1, LenFileSize);
end;

function Spc(const Cnt: integer): string;
begin
  result := StringOfChar(char(' '), Cnt);
end;

function NextField(var AString: string; const ADelimiter: string): string;
var Indx: integer;
begin
  Indx := Pos(ADelimiter, AString);
  if Indx < 1 then
  begin
    result := AString;
    AString := '';
  end
  else
  begin
    result := Copy(AString, 1, Indx - 1);
    Delete(AString, 1, Indx);
  end;
end;

procedure DebugMsg(const Msg: array of variant);
var I: integer;
    FMsg: string;
begin
  Fmsg := Format('%s %s %s', ['MTP_Helper', Paramstr(0), IntToStr(GetCurrentThreadId)]);
  for I := 0 to high(Msg) do
    FMsg := Format('%s,%s', [FMsg, VarToStr(Msg[I])]);
  OutputDebugString(PChar(FMsg));
end;

function GetRegistryValue(const ARootKey: HKEY; const KeyName, Name: string): string;
var Registry: TRegistry;
begin
  Registry := TRegistry.Create(KEY_READ);
  try
    Registry.RootKey := ARootKey;
    // False because we do not want to create it if it doesn't exist
    Registry.OpenKey(KeyName, False);
    Result := Registry.ReadString(Name);
  finally
    Registry.Free;
  end;
end;

procedure SetRegistryValue(const ARootKey: HKEY; const KeyName, Name, Value: string);
var Registry: TRegistry;
begin
  Registry := TRegistry.Create(KEY_WRITE);
  try
    Registry.RootKey := ARootKey;
    Registry.OpenKey(KeyName, True);
    Registry.WriteString(Name, Value);
  finally
    Registry.Free;
  end;
end;

function TempPath: string;
var ADir: array [0 .. MAX_PATH] of char;
begin
  GetTempPath(MAX_PATH, ADir);
  result := StrPas(ADir);
end;

function TempFilename(const Prefix: string): string;
var AName, ADir: array [0 .. MAX_PATH] of char;
begin
  GetTempPath(MAX_PATH, ADir);
  GetTempFilename(ADir, PChar(Prefix), 0, AName);
  result := StrPas(AName);
end;

function CreateTempPath(const Prefix: string): string;
begin
  result := TempFilename(Prefix);
  if FileExists(result) then
    DeleteFile(result);
  MkDir(result);
end;

function RemovePath(const ADir: string; const AFlags: FILEOP_FLAGS = FOF_NO_UI): boolean;
var ShOp: TSHFileOpStruct;
    ShResult: Integer;
begin
  result := false;
  if not(DirectoryExists(ADir)) then
    exit;

  ShOp.Wnd := Application.Handle;
  ShOp.wFunc := FO_DELETE;
  ShOp.pFrom := PChar(ADir + #0);
  ShOp.pTo := nil;
  ShOp.fFlags := AFlags;

  ShResult := SHFileOperation(ShOp);
  if (ShResult <> 0) and
     (ShOp.fAnyOperationsAborted = false) then
    raise Exception.Create(Format('Remove directory failed code %u', [ShResult]));
  result := (ShResult = 0);
end;


end.
