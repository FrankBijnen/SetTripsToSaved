﻿// CodeGear C++Builder
// Copyright (c) 1995, 2022 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'UnitTrip.pas' rev: 35.00 (Windows)

#ifndef UnittripHPP
#define UnittripHPP

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
#include <Vcl.StdCtrls.hpp>

//-- user supplied -----------------------------------------------------------

namespace Unittrip
{
//-- forward type declarations -----------------------------------------------
struct THeaderRec;
//-- type declarations -------------------------------------------------------
enum DECLSPEC_DENUM TProcessOption : unsigned char { CheckOnly, SetToSaved, SetToImported };

#pragma pack(push,1)
struct DECLSPEC_DRECORD THeaderRec
{
public:
	System::StaticArray<char, 4> TripId;
	unsigned FileSize;
	System::Byte HdrLen;
	unsigned Items;
	System::Byte Terminator;
};
#pragma pack(pop)


//-- var, const, procedure ---------------------------------------------------
extern DELPHI_PACKAGE bool __fastcall ProcessTripFile(const System::UnicodeString TripFile, System::Classes::TStrings* TripInfo, TProcessOption ProcessOption);
}	/* namespace Unittrip */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_UNITTRIP)
using namespace Unittrip;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// UnittripHPP
