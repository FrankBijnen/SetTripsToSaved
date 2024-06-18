// CodeGear C++Builder
// Copyright (c) 1995, 2022 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'UFrmSetTripsToSaved.pas' rev: 35.00 (Windows)

#ifndef UfrmsettripstosavedHPP
#define UfrmsettripstosavedHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>
#include <SysInit.hpp>
#include <Winapi.Windows.hpp>
#include <Winapi.Messages.hpp>
#include <System.SysUtils.hpp>
#include <System.Variants.hpp>
#include <System.Classes.hpp>
#include <Vcl.Graphics.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.Dialogs.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.ComCtrls.hpp>
#include <System.ImageList.hpp>
#include <Vcl.ImgList.hpp>
#include <Vcl.Grids.hpp>
#include <Vcl.ValEdit.hpp>
#include <BCHexEditor.hpp>
#include <UnitMtpDevice.hpp>
#include <mtp_helper.hpp>
#include <ListViewSort.hpp>
#include <UnitTrip.hpp>
#include <Vcl.Menus.hpp>

//-- user supplied -----------------------------------------------------------

namespace Ufrmsettripstosaved
{
//-- forward type declarations -----------------------------------------------
class DELPHICLASS TFrmSetTripsToSaved;
//-- type declarations -------------------------------------------------------
enum DECLSPEC_DENUM TDirType : unsigned char { NoDir, Up, Down };

class PASCALIMPLEMENTATION TFrmSetTripsToSaved : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Vcl::Stdctrls::TListBox* LBDevices;
	Vcl::Extctrls::TPanel* PnlTop;
	Vcl::Extctrls::TSplitter* Splitter1;
	Vcl::Stdctrls::TButton* BtnRefresh;
	Vcl::Extctrls::TPanel* PnlParent;
	Vcl::Controls::TImageList* ImageList;
	Vcl::Stdctrls::TEdit* EdTempPath;
	Vcl::Stdctrls::TButton* BtnSetImported;
	Vcl::Stdctrls::TButton* BtnSetSaved;
	Vcl::Stdctrls::TButton* BtnCheck;
	Vcl::Stdctrls::TButton* BtnOpenTripFile;
	Vcl::Dialogs::TOpenDialog* OpenDialog1;
	Vcl::Comctrls::TPageControl* PageControl1;
	Vcl::Comctrls::TTabSheet* TabSheetTrip;
	Vcl::Comctrls::TTabSheet* TabSheetLocations;
	Vcl::Comctrls::TTabSheet* TabSheetAllRoutes;
	Vcl::Valedit::TValueListEditor* VleTripInfo;
	Vcl::Valedit::TValueListEditor* VlemLocations;
	Vcl::Valedit::TValueListEditor* VlemAllRoutes;
	Vcl::Comctrls::TTabSheet* TabSheetFiles;
	Vcl::Comctrls::TListView* LstFiles;
	Vcl::Extctrls::TPanel* HexPanel;
	Vcl::Extctrls::TSplitter* Splitter2;
	Vcl::Extctrls::TPanel* PnlTripName;
	Vcl::Stdctrls::TButton* Button1;
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall FormDestroy(System::TObject* Sender);
	void __fastcall BtnRefreshClick(System::TObject* Sender);
	void __fastcall LBDevicesDblClick(System::TObject* Sender);
	void __fastcall LstFilesDblClick(System::TObject* Sender);
	void __fastcall LstFilesDeletion(System::TObject* Sender, Vcl::Comctrls::TListItem* Item);
	void __fastcall LstFilesColumnClick(System::TObject* Sender, Vcl::Comctrls::TListColumn* Column);
	void __fastcall LstFilesCompare(System::TObject* Sender, Vcl::Comctrls::TListItem* Item1, Vcl::Comctrls::TListItem* Item2, int Data, int &Compare);
	void __fastcall BtnSetTripsClicked(System::TObject* Sender);
	void __fastcall LstFilesSelectItem(System::TObject* Sender, Vcl::Comctrls::TListItem* Item, bool Selected);
	void __fastcall BtnCheckClick(System::TObject* Sender);
	void __fastcall LstFilesItemChecked(System::TObject* Sender, Vcl::Comctrls::TListItem* Item);
	void __fastcall BtnOpenTripFileClick(System::TObject* Sender);
	void __fastcall FormShow(System::TObject* Sender);
	void __fastcall SyncHexEdit(System::TObject* Sender, int ACol, int ARow, bool &CanSelect);
	void __fastcall PageControl1Change(System::TObject* Sender);
	void __fastcall Button1Click(System::TObject* Sender);
	void __fastcall ValueListKeyDown(System::TObject* Sender, System::Word &Key, System::Classes::TShiftState Shift);
	
private:
	System::UnicodeString PrefDevice;
	System::UnicodeString PrefDeviceFolder;
	Unitmtpdevice::TMTP_Device* CurrentDevice;
	System::WideString FSavedParent;
	System::WideString FSavedFolderId;
	System::WideString FCurrentPath;
	System::Classes::TList* DeviceList;
	Listviewsort::TSortSpecification FSortSpecification;
	Bchexeditor::TBCHexEditor* HexEdit;
	void __fastcall SyncHexEditFromPage();
	void __fastcall LoadHex(const System::UnicodeString FileName);
	void __fastcall FreeCustomData(const void * ACustomData);
	void __fastcall FreeDevices();
	void __fastcall SelectDevice(const int Indx);
	TDirType __fastcall GetItemType(Vcl::Comctrls::TListView* const AListview);
	void __fastcall GetDeviceList();
	System::UnicodeString __fastcall GetDevicePath(const System::UnicodeString CompletePath);
	void __fastcall SetCurrentPath(const System::UnicodeString APath);
	void __fastcall ListFiles(const bool UseParent);
	bool __fastcall ProcessFile(const int Indx, Unittrip::TProcessOption ProcessOption);
	void __fastcall ReadSettings();
public:
	/* TCustomForm.Create */ inline __fastcall virtual TFrmSetTripsToSaved(System::Classes::TComponent* AOwner) : Vcl::Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TFrmSetTripsToSaved(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TFrmSetTripsToSaved() { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TFrmSetTripsToSaved(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
#define UpDirString L".."
extern DELPHI_PACKAGE TFrmSetTripsToSaved* FrmSetTripsToSaved;
}	/* namespace Ufrmsettripstosaved */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_UFRMSETTRIPSTOSAVED)
using namespace Ufrmsettripstosaved;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// UfrmsettripstosavedHPP
