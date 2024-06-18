object FrmSetTripsToSaved: TFrmSetTripsToSaved
  Left = 0
  Top = 0
  AlphaBlend = True
  Caption = 'Set trips to saved'
  ClientHeight = 653
  ClientWidth = 1297
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 142
    Width = 1297
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitLeft = 8
    ExplicitTop = 157
    ExplicitWidth = 818
  end
  object Splitter2: TSplitter
    Left = 631
    Top = 172
    Width = 5
    Height = 481
    ExplicitLeft = 1
    ExplicitTop = 1
    ExplicitHeight = 464
  end
  object LBDevices: TListBox
    Left = 0
    Top = 60
    Width = 1297
    Height = 82
    Align = alTop
    ItemHeight = 13
    TabOrder = 0
    OnDblClick = LBDevicesDblClick
    ExplicitWidth = 1293
  end
  object PnlTop: TPanel
    Left = 0
    Top = 0
    Width = 1297
    Height = 60
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 1293
    object BtnRefresh: TButton
      Left = 10
      Top = 25
      Width = 143
      Height = 25
      Caption = 'Refresh devices'
      TabOrder = 0
      OnClick = BtnRefreshClick
    end
    object EdTempPath: TEdit
      Left = 1
      Top = 1
      Width = 1295
      Height = 21
      Align = alTop
      ReadOnly = True
      TabOrder = 1
      Text = 'EdTempPath'
      ExplicitWidth = 1291
    end
    object BtnSetImported: TButton
      Tag = 2
      Left = 550
      Top = 25
      Width = 160
      Height = 25
      Caption = 'Set selected trips to imported'
      TabOrder = 2
      OnClick = BtnSetTripsClicked
    end
    object BtnSetSaved: TButton
      Tag = 1
      Left = 380
      Top = 25
      Width = 160
      Height = 25
      Caption = 'Set selected trips to saved'
      TabOrder = 3
      OnClick = BtnSetTripsClicked
    end
    object BtnCheck: TButton
      Left = 210
      Top = 25
      Width = 160
      Height = 25
      Caption = 'Check Trips'
      TabOrder = 4
      OnClick = BtnCheckClick
    end
    object BtnOpenTripFile: TButton
      Left = 723
      Top = 25
      Width = 75
      Height = 25
      Caption = 'Open trip File'
      TabOrder = 5
      OnClick = BtnOpenTripFileClick
    end
    object BtnSaveTripFile: TButton
      Left = 804
      Top = 25
      Width = 75
      Height = 25
      Caption = 'Save Trip File'
      Enabled = False
      TabOrder = 6
      OnClick = BtnSaveTripFileClick
    end
  end
  object PnlParent: TPanel
    AlignWithMargins = True
    Left = 8
    Top = 148
    Width = 1281
    Height = 21
    Margins.Left = 8
    Margins.Right = 8
    Align = alTop
    Alignment = taLeftJustify
    TabOrder = 2
    ExplicitWidth = 1277
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 172
    Width = 631
    Height = 481
    ActivePage = TabSheetFiles
    Align = alLeft
    TabOrder = 3
    OnChange = PageControl1Change
    ExplicitHeight = 480
    object TabSheetFiles: TTabSheet
      Caption = 'FileList'
      ImageIndex = 3
      object LstFiles: TListView
        Left = 0
        Top = 0
        Width = 623
        Height = 453
        Align = alClient
        Checkboxes = True
        Columns = <
          item
            Caption = 'Name'
            Width = 250
          end
          item
            Caption = 'Date'
            Width = 150
          end
          item
            Caption = 'Time'
            Width = 150
          end
          item
            Caption = 'Ext'
          end
          item
            Alignment = taRightJustify
            Caption = 'Size'
            Tag = 1
            Width = 150
          end>
        HideSelection = False
        LargeImages = ImageList
        MultiSelect = True
        ReadOnly = True
        RowSelect = True
        SmallImages = ImageList
        TabOrder = 0
        ViewStyle = vsReport
        OnColumnClick = LstFilesColumnClick
        OnCompare = LstFilesCompare
        OnDblClick = LstFilesDblClick
        OnDeletion = LstFilesDeletion
        OnSelectItem = LstFilesSelectItem
        OnItemChecked = LstFilesItemChecked
      end
    end
    object TabSheetTrip: TTabSheet
      Caption = 'Trip info'
      object VleTripInfo: TValueListEditor
        Left = 0
        Top = 0
        Width = 623
        Height = 453
        Align = alClient
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goAlwaysShowEditor, goThumbTracking]
        TabOrder = 0
        OnKeyDown = ValueListKeyDown
        OnSelectCell = SyncHexEdit
        ColWidths = (
          150
          467)
      end
    end
    object TabSheetLocations: TTabSheet
      Caption = 'mLocations'
      ImageIndex = 1
      object VlemLocations: TValueListEditor
        Left = 0
        Top = 0
        Width = 623
        Height = 453
        Align = alClient
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goAlwaysShowEditor, goThumbTracking]
        TabOrder = 0
        OnKeyDown = ValueListKeyDown
        OnSelectCell = SyncHexEdit
        ColWidths = (
          150
          467)
      end
    end
    object TabSheetAllRoutes: TTabSheet
      Caption = 'mAllRoutes'
      ImageIndex = 2
      object VlemAllRoutes: TValueListEditor
        Left = 0
        Top = 0
        Width = 623
        Height = 453
        Align = alClient
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goAlwaysShowEditor, goThumbTracking]
        TabOrder = 0
        OnKeyDown = ValueListKeyDown
        OnSelectCell = SyncHexEdit
        ColWidths = (
          150
          467)
      end
    end
  end
  object HexPanel: TPanel
    Left = 636
    Top = 172
    Width = 661
    Height = 481
    Align = alClient
    TabOrder = 4
    ExplicitWidth = 657
    ExplicitHeight = 480
    object PnlTripName: TPanel
      Left = 1
      Top = 1
      Width = 659
      Height = 41
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 655
    end
  end
  object ImageList: TImageList
    Left = 72
    Top = 250
    Bitmap = {
      494C010102000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF000000000000000000000000000000000000000000000000000000000000FF
      FF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF000000
      000000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0
      C00000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF000000000000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FF
      FF00C0C0C00000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000E007FFFF00000000
      E007FFFF00000000E007FFFF00000000E007C00F00000000E007800700000000
      E007800300000000E007800100000000E007800100000000E007800F00000000
      E007800F00000000E00F801F00000000E01FC0FF00000000E03FC0FF00000000
      FFFFFFFF00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object OpenDialog1: TOpenDialog
    Left = 976
    Top = 25
  end
end
