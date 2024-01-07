// CodeGear C++Builder
// Copyright (c) 1995, 2022 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'UnitStringUtils.pas' rev: 35.00 (Windows)

#ifndef UnitstringutilsHPP
#define UnitstringutilsHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>
#include <SysInit.hpp>
#include <Winapi.Windows.hpp>
#include <System.SysUtils.hpp>
#include <System.Variants.hpp>
#include <Winapi.ShellAPI.hpp>
#include <System.Win.Registry.hpp>

//-- user supplied -----------------------------------------------------------

namespace Unitstringutils
{
//-- forward type declarations -----------------------------------------------
//-- type declarations -------------------------------------------------------
//-- var, const, procedure ---------------------------------------------------
extern DELPHI_PACKAGE System::UnicodeString __fastcall SenSize(const __int64 S);
extern DELPHI_PACKAGE System::UnicodeString __fastcall Spc(const int Cnt);
extern DELPHI_PACKAGE System::UnicodeString __fastcall NextField(System::UnicodeString &AString, const System::UnicodeString ADelimiter);
extern DELPHI_PACKAGE void __fastcall DebugMsg(const System::Variant *Msg, const int Msg_High);
extern DELPHI_PACKAGE System::UnicodeString __fastcall GetRegistryValue(const HKEY ARootKey, const System::UnicodeString KeyName, const System::UnicodeString Name);
extern DELPHI_PACKAGE void __fastcall SetRegistryValue(const HKEY ARootKey, const System::UnicodeString KeyName, const System::UnicodeString Name, const System::UnicodeString Value);
extern DELPHI_PACKAGE System::UnicodeString __fastcall TempPath();
extern DELPHI_PACKAGE System::UnicodeString __fastcall TempFilename(const System::UnicodeString Prefix);
extern DELPHI_PACKAGE System::UnicodeString __fastcall CreateTempPath(const System::UnicodeString Prefix);
extern DELPHI_PACKAGE bool __fastcall RemovePath(const System::UnicodeString ADir, const System::Word AFlags = (System::Word)(0x614));
}	/* namespace Unitstringutils */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_UNITSTRINGUTILS)
using namespace Unitstringutils;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// UnitstringutilsHPP
