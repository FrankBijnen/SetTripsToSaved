// CodeGear C++Builder
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
struct TLocationRec;
struct TScnPosn;
struct TVersion;
struct TAllRoutes;
struct TUdbHandle;
struct TSubClass;
struct TUdbDir;
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


#pragma pack(push,1)
struct DECLSPEC_DRECORD TLocationRec
{
public:
	System::StaticArray<char, 4> LocId;
	unsigned LocSize;
	System::Byte Unknown1;
	unsigned LocItems;
	System::Byte Terminator;
};
#pragma pack(pop)


#pragma pack(push,1)
struct DECLSPEC_DRECORD TScnPosn
{
public:
	unsigned ScnSize;
	unsigned Unknown1;
	int Lat;
	int Lon;
};
#pragma pack(pop)


#pragma pack(push,1)
struct DECLSPEC_DRECORD TVersion
{
public:
	unsigned Major;
	unsigned Minor;
};
#pragma pack(pop)


#pragma pack(push,1)
struct DECLSPEC_DRECORD TAllRoutes
{
public:
	int DbHandles;
	unsigned Unknown1;
	unsigned DbHandlesSize;
	System::Byte DataType;
	int HandleId;
	System::Byte Terminator;
};
#pragma pack(pop)


#pragma pack(push,1)
struct DECLSPEC_DRECORD TUdbHandle
{
public:
	unsigned KeyLen;
	System::StaticArray<char, 12> KeyName;
	unsigned ValueLen;
	System::Byte DataType;
	unsigned UdbHandleSize;
	unsigned Unknown2;
	System::StaticArray<System::Byte, 150> Unknown3;
	System::Word DbHandles;
	System::StaticArray<System::Byte, 1288> Unknown4;
};
#pragma pack(pop)


#pragma pack(push,1)
struct DECLSPEC_DRECORD TSubClass
{
public:
	unsigned MapSegment;
	unsigned RoadId;
	System::Byte PointType;
	System::Byte Direction;
	System::StaticArray<System::Byte, 6> Unknown1;
};
#pragma pack(pop)


#pragma pack(push,1)
struct DECLSPEC_DRECORD TUdbDir
{
public:
	TSubClass SubClass;
	int Lat;
	int Lon;
	System::StaticArray<unsigned, 6> Unknown1;
	System::StaticArray<unsigned, 121> Name;
};
#pragma pack(pop)


//-- var, const, procedure ---------------------------------------------------
extern DELPHI_PACKAGE bool __fastcall ProcessTripFile(const System::UnicodeString TripFile, System::Classes::TStrings* TripInfo, System::Classes::TStrings* LocInfo, System::Classes::TStrings* RouteInfo, TProcessOption ProcessOption);
}	/* namespace Unittrip */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_UNITTRIP)
using namespace Unittrip;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// UnittripHPP
