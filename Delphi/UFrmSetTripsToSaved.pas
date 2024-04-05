unit UFrmSetTripsToSaved;
{$DEFINE USE_TRANSFEREXISTING}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.ValEdit,
  BCHexEditor,
  UnitMtpDevice, mtp_helper, ListViewSort, UnitTrip, Vcl.Menus;

const UpDirString  = '..';

type

  TDirType = (NoDir, Up, Down);

  TFrmSetTripsToSaved = class(TForm)
    LBDevices: TListBox;
    PnlTop: TPanel;
    Splitter1: TSplitter;
    BtnRefresh: TButton;
    PnlParent: TPanel;
    ImageList: TImageList;
    EdTempPath: TEdit;
    BtnSetImported: TButton;
    BtnSetSaved: TButton;
    BtnCheck: TButton;
    BtnOpenTripFile: TButton;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    TabSheetTrip: TTabSheet;
    TabSheetLocations: TTabSheet;
    TabSheetAllRoutes: TTabSheet;
    VleTripInfo: TValueListEditor;
    VlemLocations: TValueListEditor;
    VlemAllRoutes: TValueListEditor;
    TabSheetFiles: TTabSheet;
    LstFiles: TListView;
    HexPanel: TPanel;
    Splitter2: TSplitter;
    PnlTripName: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure LBDevicesDblClick(Sender: TObject);
    procedure LstFilesDblClick(Sender: TObject);
    procedure LstFilesDeletion(Sender: TObject; Item: TListItem);
    procedure LstFilesColumnClick(Sender: TObject; Column: TListColumn);
    procedure LstFilesCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure BtnSetTripsClicked(Sender: TObject);
    procedure LstFilesSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure BtnCheckClick(Sender: TObject);
    procedure LstFilesItemChecked(Sender: TObject; Item: TListItem);
    procedure BtnOpenTripFileClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SyncHexEdit(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure PageControl1Change(Sender: TObject);
  private
    { Private declarations }
    PrefDevice: string;
    PrefDeviceFolder: string;

    CurrentDevice: TMTP_Device;
    FSavedParent: WideString;
    FSavedFolderId: WideString;

    FCurrentPath: WideString;
    DeviceList: Tlist;
    FSortSpecification: TSortSpecification;
    HexEdit: TBCHexEditor;
    procedure SyncHexEditFromPage;
    procedure LoadHex(const FileName: string);
    procedure FreeCustomData(const ACustomData: pointer);
    procedure FreeDevices;
    procedure SelectDevice(const Indx: integer);
    function GetItemType(const AListview: TListView): TDirType;

    procedure GetDeviceList;
    function GetDevicePath(const CompletePath: string): string;

    procedure SetCurrentPath(const APath: string);
    procedure ListFiles(const UseParent: boolean);
    function ProcessFile(const Indx: integer; ProcessOption: TProcessOption): boolean;
    procedure ReadSettings;

  public
    { Public declarations }
  end;

var
  FrmSetTripsToSaved: TFrmSetTripsToSaved;

implementation

uses UnitStringUtils;

const RegKey = 'Software\TDBware\SetTripsToSaved';

{$R *.dfm}

procedure TFrmSetTripsToSaved.BtnCheckClick(Sender: TObject);
var AListItem: TListItem;
    CrNormal,CrWait: HCURSOR;
begin
  CrWait := LoadCursor(0,IDC_WAIT);
  CrNormal := SetCursor(CrWait);
  try
    for AListItem in LstFiles.Items do
      ProcessFile(AListItem.Index,  TProcessOption.CheckOnly);
  finally
    SetCursor(CrNormal);
  end;
end;

procedure TFrmSetTripsToSaved.BtnRefreshClick(Sender: TObject);
begin
  GetDeviceList;
end;

procedure TFrmSetTripsToSaved.BtnSetTripsClicked(Sender: TObject);
var AListItem: TListItem;
    CrNormal,CrWait: HCURSOR;
begin
  CrWait := LoadCursor(0,IDC_WAIT);
  CrNormal := SetCursor(CrWait);
  try
    for AListItem in LstFiles.Items do
    begin
      if (AListItem.Selected) then
        ProcessFile(AListItem.Index, TProcessOption(Tbutton(Sender).Tag));
    end;
  finally
    SetCursor(CrNormal);
  end;
end;

procedure TFrmSetTripsToSaved.BtnOpenTripFileClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    HexEdit.LoadFromFile(OpenDialog1.FileName);
    UnitTrip.ProcessTripFile(OpenDialog1.FileName, VleTripinfo.Strings, VlemLocations.Strings, VlemAllRoutes.Strings, TProcessOption.CheckOnly);
    LoadHex(OpenDialog1.FileName);
  end;
end;

procedure TFrmSetTripsToSaved.FormCreate(Sender: TObject);
begin
  HexEdit := TBCHexEditor.Create(Self);
  HexEdit.Parent := HexPanel;
  HexEdit.Align := alClient;
  HexEdit.ReadOnlyView := true;

  InitSortSpec(LstFiles.Columns[0], true, FSortSpecification);
  ReadSettings;
  EdTempPath.Text := CreateTempPath('TRIP');
  GetDeviceList;
end;

procedure TFrmSetTripsToSaved.FormDestroy(Sender: TObject);
begin
  FreeDevices;
  RemovePath(EdTempPath.Text);
end;

procedure TFrmSetTripsToSaved.FormShow(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
end;

procedure TFrmSetTripsToSaved.FreeCustomData(const ACustomData: pointer);
begin
  if (Assigned(ACustomData)) then
    TMTP_Device(ACustomData).Free;
end;

procedure TFrmSetTripsToSaved.FreeDevices;
var Indx: integer;
begin
  if (Assigned(DeviceList)) then
  begin
    for Indx := 0 to DeviceList.Count - 1 do
      FreeCustomData(DeviceList[Indx]);
    FreeAndNil(DeviceList);
  end;
  LBDevices.Items.Clear;
end;

procedure TFrmSetTripsToSaved.GetDeviceList;
var Indx: integer;
begin
  FreeDevices;
  LstFiles.Clear;

  DeviceList := GetDevices;
  for Indx := 0 to DeviceList.Count - 1 do
  begin
    LBDevices.Items.Add(TMTP_Device(DeviceList[Indx]).FriendlyName + ' (' + TMTP_Device(DeviceList[Indx]).Description + ')');

    // Does this device match our registry setting? Select right away
    if (PrefDevice = TMTP_Device(DeviceList[Indx]).FriendlyName) then
    begin
      SelectDevice(Indx);

      // Need to set the folder?
      if (PrefDeviceFolder <> '') then
        SetCurrentPath(PrefDeviceFolder);

      // Get files
      ListFiles(true);

      // Does the current folder match our registry setting? Check right away.
      if (PrefDeviceFolder = GetDevicePath(FCurrentPath)) then
        BtnCheckClick(nil);
    end;
  end;
end;

procedure TFrmSetTripsToSaved.SelectDevice(const Indx: integer);
begin
  CurrentDevice := nil;
  FSavedParent := '';

  if (Indx < 0) or
     (Indx > DeviceList.Count - 1) then
    exit;

  CurrentDevice := DeviceList[Indx];
end;

procedure TFrmSetTripsToSaved.LBDevicesDblClick(Sender: TObject);
begin
  if (LbDevices.ItemIndex > -1) and
     (LbDevices.ItemIndex < LbDevices.Count) then
  begin
    SelectDevice(LbDevices.ItemIndex);
    ListFiles(true);
  end;
end;

function TFrmSetTripsToSaved.GetDevicePath(const CompletePath: string): string;
var P: integer;
begin
  result := CompletePath;
  P := Pos('\', result);
  if (P > 1) then
    result := Copy(result, P + 1, Length(result));
end;

procedure TFrmSetTripsToSaved.SetCurrentPath(const APath: string);
var FriendlyPath: string;
begin
  FSavedParent := GetIdForPath(CurrentDevice.Device, APath, FriendlyPath);
end;

procedure TFrmSetTripsToSaved.SyncHexEdit(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
var SelStart, SelEnd: integer;
begin
  // Default no selection
  HexEdit.SelStart := 0;
  HexEdit.SelEnd := -1;

  // Valid Row?
  if (ARow >= TValueListEditor(Sender).Strings.Count) then
    exit;

  SelStart := Integer(TValueListEditor(Sender).Strings.Objects[ARow -1]);
  if (SelStart < 0) then
    exit;
  if (SelStart >= HexEdit.DataSize) then
    SelStart := HexEdit.DataSize -1;

  SelEnd := Integer(TValueListEditor(Sender).Strings.Objects[ARow]) -1;
  if (SelEnd < SelStart) then
    SelEnd := SelStart;
  if (SelEnd >= HexEdit.DataSize) then
    SelEnd := HexEdit.DataSize -1;

  // Set new selection
  HexEdit.SelStart := SelStart;
  HexEdit.SelEnd := SelEnd;

  // Position selection on top
  if (HexEdit.BytesPerRow > 0) then
    HexEdit.TopRow := SelStart div HexEdit.BytesPerRow;
end;

procedure TFrmSetTripsToSaved.SyncHexEditFromPage;
var CanSelect: boolean;
begin
  case PageControl1.ActivePageIndex of
    1: VleTripInfo.OnSelectCell(VleTripInfo, 1, VleTripInfo.Row, CanSelect);
    2: VlemLocations.OnSelectCell(VlemLocations, 1, VlemLocations.Row, CanSelect);
    3: VlemAllRoutes.OnSelectCell(VlemAllRoutes, 1, VlemAllRoutes.Row, CanSelect);
  end;
end;

procedure TFrmSetTripsToSaved.ListFiles(const UseParent: boolean);
var ABASE_Data: TBASE_Data;
    SParent: Widestring;
begin
  SParent := '';
  if (UseParent) then
    SParent := FSavedParent
  else
  begin
    if (LstFiles.ItemIndex >= 0) then
    begin
      ABASE_Data := TBASE_Data(LstFiles.Items.Item[LstFiles.ItemIndex].Data);
      SParent := ABASE_Data.ObjectId;
    end;
  end;
  FSavedFolderId := SParent;

  LstFiles.Clear;
  if (VleTripInfo.Strings.Count > 0) then
    VleTripInfo.Strings.Clear;
  // LstFile.Items should contain a least a Caption (Filename) and 4 subitems Date, Time, Ext and Size.
  // ReadFilesFromDevice will populate the data.
  // Defined in the Listview on the form.
  FSavedParent := ReadFilesFromDevice(CurrentDevice.Device, LstFiles.Items, SParent, FCurrentPath);
  PnlParent.Caption := FCurrentPath;

  DoListViewSort(LstFiles, LstFiles.Columns[0], true, FSortSpecification);
end;

function TFrmSetTripsToSaved.GetItemType(const AListview: TListView): TDirType;
begin
  result := TDirType.NoDir;   // No directory

  // maybe file is double clicked
  if (AListview.ItemIndex >= 0) and
    (TBASE_Data(AListview.Items.Item[AListview.ItemIndex].Data).IsFolder = false) then
    exit;

  if ((AListview.ItemIndex > -1) and
      (AListview.Items.Item[AListview.ItemIndex].Caption = UpDirString)) then
    result := TDirType.Up     // Need to go up, '..' was chosen
  else
    result := TDirType.Down;  // Need to go down, a directory was chosen.
end;

procedure TFrmSetTripsToSaved.LstFilesColumnClick(Sender: TObject; Column: TListColumn);
begin
  ListViewColumnClick(LstFiles, Column, FSortSpecification);
end;

procedure TFrmSetTripsToSaved.LstFilesCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  ListViewCompare(Item1, Item2, FSortSpecification, Data, Compare);
end;

procedure TFrmSetTripsToSaved.LstFilesDblClick(Sender: TObject);
begin
  case GetItemType(LstFiles) of
    TDirType.Up:
      ListFiles(true);
    TDirType.Down:
      ListFiles(false);
    TDirType.NoDir:;  // no action
  end;
end;

procedure TFrmSetTripsToSaved.LstFilesDeletion(Sender: TObject; Item: TListItem);
begin
  FreeCustomData(Item.Data);
end;

procedure TFrmSetTripsToSaved.LstFilesItemChecked(Sender: TObject; Item: TListItem);
var ProcessOption: TProcessOption;
begin
  if (TListView(Sender).Tag <> 0) then // Only want to set the Checkmark, Dont execute
    exit;
  if (Item.Data = nil) then
    exit;
  if (Item.Checked) then
    ProcessOption := TProcessOption.SetToSaved
  else
    ProcessOption := TProcessOption.SetToImported;
  ProcessFile(Item.Index, ProcessOption);
  if TBASE_Data(Item.Data).IsFolder then
    exit;
  LoadHex(IncludeTrailingPathDelimiter(EdTempPath.Text) + Item.Caption);
end;

procedure TFrmSetTripsToSaved.LstFilesSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
begin
  ProcessFile(Item.Index, TProcessOption.CheckOnly);
  if TBASE_Data(Item.Data).IsFolder then
    exit;
  LoadHex(IncludeTrailingPathDelimiter(EdTempPath.Text) + Item.Caption);
end;

procedure TFrmSetTripsToSaved.LoadHex(const FileName: string);
begin
  HexEdit.LoadFromFile(FileName);
  PnlTripName.Caption := ExtractFileName(FileName) + ' / ' + VleTripInfo.Values['mTripName'];
  SyncHexEditFromPage;
end;

procedure TFrmSetTripsToSaved.PageControl1Change(Sender: TObject);
begin
  SyncHexEditFromPage;
end;

function TFrmSetTripsToSaved.ProcessFile(const Indx: integer; ProcessOption: TProcessOption): boolean;
var NFile: widestring;
    ABASE_Data_File: TBASE_Data;
    LocalFile: string;
    ImportedValue: string;
    PortableDev: IMTPDevice;
begin
  result := false;
  if (Indx >= 0) then
  begin
    // Get Id of File
    ABASE_Data_File := TBASE_Data(LstFiles.Items.Item[Indx].Data);
    if (ABASE_Data_File.IsFolder) then
      exit;

    // Get Name of file
    NFile := LstFiles.Items.Item[Indx].Caption;
    LocalFile := IncludeTrailingPathDelimiter(EdTempPath.Text) + NFile;

    if not ConnectToDevice(CurrentDevice.Device, PortableDev, (ProcessOption = TProcessOption.CheckOnly)) then
      raise exception.Create(Format('Device %s could not be opened.', [CurrentDevice.FriendlyName]));
    try
      // Copy File to Local directory
      result := GetFileFromDevice(PortableDev, ABASE_Data_File.ObjectId, EdTempPath.Text, NFile);
      if not result then
        raise Exception.Create(Format('Copy %s from %s failed', [NFile, CurrentDevice.Device]));

      result := ProcessTripFile(LocalFile, VleTripinfo.Strings, VlemLocations.Strings, VlemAllRoutes.Strings, ProcessOption);

      ImportedValue := VleTripInfo.Strings.Values['mImported'];

      if (ImportedValue <> '') then
      begin
        SetRegistryValue(HKEY_CURRENT_USER, RegKey, 'PrefDevice', CurrentDevice.FriendlyName);
        SetRegistryValue(HKEY_CURRENT_USER, RegKey, 'PrefDeviceFolder', GetDevicePath(FCurrentPath));

        LstFiles.Tag := LstFiles.Tag + 1; // Prevent an action to be executed
        try
          LstFiles.Items[Indx].Checked := (Pos('Value: False', ImportedValue) > 0);
        finally
          LstFiles.Tag := LstFiles.Tag - 1;
        end;
      end;

      if (ProcessOption <> TProcessOption.CheckOnly) and
         (result) then
      begin
{$IFDEF USE_TRANSFEREXISTING}
        result := TransferExistingFileToDevice(PortableDev, LocalFile, FSavedFolderId, LstFiles.Items.Item[Indx]);
        if not result then
          raise Exception.Create(Format('Copy %s to %s failed', [NFile, CurrentDevice.Device]));
{$ELSE}
        // This is a risk.
        // Suppose the delete succeeds, but the transfer fails?

        result := DelFileFromDevice(PortableDev, ABASE_Data_File.ObjectId);
        if not result then
          raise Exception.Create(Format('Delete %s from %s failed', [NFile, CurrentDevice.Device]));

        ABASE_Data_File.ObjectId := TransferNewFileToDevice(PortableDev, LocalFile, FSavedFolderId);
        result := (ABASE_Data_File.ObjectId <> '');
        if not result then
          raise Exception.Create(Format('Copy %s to %s failed', [NFile, CurrentDevice.Device]));

        // Get modified data.
        GetIdForFile(PortableDev, FSavedFolderId, NFile, LstFiles.Items.Item[Indx]);
{$ENDIF}
      end;
    finally
      PortableDev.Close;
    end;
  end;

end;

procedure TFrmSetTripsToSaved.ReadSettings;
begin
  PrefDevice := GetRegistryValue(HKEY_CURRENT_USER, RegKey, 'PrefDevice');
  PrefDeviceFolder := GetRegistryValue(HKEY_CURRENT_USER, RegKey, 'PrefDeviceFolder');
end;

end.

