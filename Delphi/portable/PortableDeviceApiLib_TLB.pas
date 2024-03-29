unit PortableDeviceApiLib_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 98336 $
// File generated on 4/5/2023 11:50:37 AM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Windows\SysWOW64\PortableDeviceApi.dll (1)
// LIBID: {1F001332-1A57-4934-BE31-AFFC99F4EE0A}
// LCID: 0
// Helpfile: 
// HelpString: PortableDeviceApi 1.0 Type Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// SYS_KIND: SYS_WIN32
// Errors:
//   Hint: Symbol 'type' renamed to 'type_'
//   Hint: Parameter 'Property' of IPortableDeviceServiceCapabilities.GetFormatPropertyAttributes changed to 'Property_'
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  PortableDeviceApiLibMajorVersion = 1;
  PortableDeviceApiLibMinorVersion = 0;

  LIBID_PortableDeviceApiLib: TGUID = '{1F001332-1A57-4934-BE31-AFFC99F4EE0A}';

  IID_IPortableDevice: TGUID = '{625E2DF8-6392-4CF0-9AD1-3CFA5F17775C}';
  CLASS_PortableDevice: TGUID = '{728A21C5-3D9E-48D7-9810-864848F0F404}';
  IID_IPortableDeviceValues: TGUID = '{6848F6F2-3155-4F86-B6F5-263EEEAB3143}';
  IID_ISequentialStream: TGUID = '{0C733A30-2A1C-11CE-ADE5-00AA0044773D}';
  IID_IStream: TGUID = '{0000000C-0000-0000-C000-000000000046}';
  IID_IStorage: TGUID = '{0000000B-0000-0000-C000-000000000046}';
  IID_IEnumSTATSTG: TGUID = '{0000000D-0000-0000-C000-000000000046}';
  IID_IRecordInfo: TGUID = '{0000002F-0000-0000-C000-000000000046}';
  IID_ITypeInfo: TGUID = '{00020401-0000-0000-C000-000000000046}';
  IID_ITypeComp: TGUID = '{00020403-0000-0000-C000-000000000046}';
  IID_ITypeLib: TGUID = '{00020402-0000-0000-C000-000000000046}';
  IID_IPortableDevicePropVariantCollection: TGUID = '{89B2E422-4F1B-4316-BCEF-A44AFEA83EB3}';
  IID_IPortableDeviceKeyCollection: TGUID = '{DADA2357-E0AD-492E-98DB-DD61C53BA353}';
  IID_IPortableDeviceValuesCollection: TGUID = '{6E3F2D79-4E07-48C4-8208-D8C2E5AF4A99}';
  IID_IPropertyStore: TGUID = '{886D8EEB-8CF2-4446-8D02-CDBA1DBDCF99}';
  IID_IPortableDeviceContent: TGUID = '{6A96ED84-7C73-4480-9938-BF5AF477D426}';
  IID_IEnumPortableDeviceObjectIDs: TGUID = '{10ECE955-CF41-4728-BFA0-41EEDF1BBF19}';
  IID_IPortableDeviceProperties: TGUID = '{7F6D695C-03DF-4439-A809-59266BEEE3A6}';
  IID_IPortableDeviceResources: TGUID = '{FD8878AC-D841-4D17-891C-E6829CDB6934}';
  IID_IPortableDeviceCapabilities: TGUID = '{2C8C6DBF-E3DC-4061-BECC-8542E810D126}';
  IID_IPortableDeviceEventCallback: TGUID = '{A8792A31-F385-493C-A893-40F64EB45F6E}';
  IID_IPortableDeviceManager: TGUID = '{A1567595-4C2F-4574-A6FA-ECEF917B9A40}';
  CLASS_PortableDeviceManager: TGUID = '{0AF10CEC-2ECD-4B92-9581-34F6AE0637F3}';
  IID_IPortableDeviceService: TGUID = '{D3BD3A44-D7B5-40A9-98B7-2FA4D01DEC08}';
  CLASS_PortableDeviceService: TGUID = '{EF5DB4C2-9312-422C-9152-411CD9C4DD84}';
  IID_IPortableDeviceServiceCapabilities: TGUID = '{24DBD89D-413E-43E0-BD5B-197F3C56C886}';
  IID_IPortableDeviceContent2: TGUID = '{9B4ADD96-F6BF-4034-8708-ECA72BF10554}';
  IID_IPortableDeviceServiceMethods: TGUID = '{E20333C9-FD34-412D-A381-CC6F2D820DF7}';
  IID_IPortableDeviceServiceMethodCallback: TGUID = '{C424233C-AFCE-4828-A756-7ED7A2350083}';
  IID_IPortableDeviceDispatchFactory: TGUID = '{5E1EAFC3-E3D7-4132-96FA-759C0F9D1E0F}';
  CLASS_PortableDeviceDispatchFactory: TGUID = '{43232233-8338-4658-AE01-0B4AE830B6B0}';
  CLASS_PortableDeviceFTM: TGUID = '{F7C0039A-4762-488A-B4B3-760EF9A1BA9B}';
  CLASS_PortableDeviceServiceFTM: TGUID = '{1649B154-C794-497A-9B03-F3F0121302F3}';
  IID_IPortableDeviceWebControl: TGUID = '{94FC7953-5CA1-483A-8AEE-DF52E7747D00}';
  CLASS_PortableDeviceWebControl: TGUID = '{186DD02C-2DEC-41B5-A7D4-B59056FADE51}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum tagTYPEKIND
type
  tagTYPEKIND = TOleEnum;
const
  TKIND_ENUM = $00000000;
  TKIND_RECORD = $00000001;
  TKIND_MODULE = $00000002;
  TKIND_INTERFACE = $00000003;
  TKIND_DISPATCH = $00000004;
  TKIND_COCLASS = $00000005;
  TKIND_ALIAS = $00000006;
  TKIND_UNION = $00000007;
  TKIND_MAX = $00000008;

// Constants for enum tagDESCKIND
type
  tagDESCKIND = TOleEnum;
const
  DESCKIND_NONE = $00000000;
  DESCKIND_FUNCDESC = $00000001;
  DESCKIND_VARDESC = $00000002;
  DESCKIND_TYPECOMP = $00000003;
  DESCKIND_IMPLICITAPPOBJ = $00000004;
  DESCKIND_MAX = $00000005;

// Constants for enum tagFUNCKIND
type
  tagFUNCKIND = TOleEnum;
const
  FUNC_VIRTUAL = $00000000;
  FUNC_PUREVIRTUAL = $00000001;
  FUNC_NONVIRTUAL = $00000002;
  FUNC_STATIC = $00000003;
  FUNC_DISPATCH = $00000004;

// Constants for enum tagINVOKEKIND
type
  tagINVOKEKIND = TOleEnum;
const
  INVOKE_FUNC = $00000001;
  INVOKE_PROPERTYGET = $00000002;
  INVOKE_PROPERTYPUT = $00000004;
  INVOKE_PROPERTYPUTREF = $00000008;

// Constants for enum tagCALLCONV
type
  tagCALLCONV = TOleEnum;
const
  CC_FASTCALL = $00000000;
  CC_CDECL = $00000001;
  CC_MSCPASCAL = $00000002;
  CC_PASCAL = $00000002;
  CC_MACPASCAL = $00000003;
  CC_STDCALL = $00000004;
  CC_FPFASTCALL = $00000005;
  CC_SYSCALL = $00000006;
  CC_MPWCDECL = $00000007;
  CC_MPWPASCAL = $00000008;
  CC_MAX = $00000009;

// Constants for enum tagVARKIND
type
  tagVARKIND = TOleEnum;
const
  VAR_PERINSTANCE = $00000000;
  VAR_STATIC = $00000001;
  VAR_CONST = $00000002;
  VAR_DISPATCH = $00000003;

// Constants for enum tagSYSKIND
type
  tagSYSKIND = TOleEnum;
const
  SYS_WIN16 = $00000000;
  SYS_WIN32 = $00000001;
  SYS_MAC = $00000002;
  SYS_WIN64 = $00000003;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IPortableDevice = interface;
  IPortableDeviceValues = interface;
  ISequentialStream = interface;
  IStream = interface;
  IStorage = interface;
  IEnumSTATSTG = interface;
  IRecordInfo = interface;
  ITypeInfo = interface;
  ITypeComp = interface;
  ITypeLib = interface;
  IPortableDevicePropVariantCollection = interface;
  IPortableDeviceKeyCollection = interface;
  IPortableDeviceValuesCollection = interface;
  IPropertyStore = interface;
  IPortableDeviceContent = interface;
  IEnumPortableDeviceObjectIDs = interface;
  IPortableDeviceProperties = interface;
  IPortableDeviceResources = interface;
  IPortableDeviceCapabilities = interface;
  IPortableDeviceEventCallback = interface;
  IPortableDeviceManager = interface;
  IPortableDeviceService = interface;
  IPortableDeviceServiceCapabilities = interface;
  IPortableDeviceContent2 = interface;
  IPortableDeviceServiceMethods = interface;
  IPortableDeviceServiceMethodCallback = interface;
  IPortableDeviceDispatchFactory = interface;
  IPortableDeviceWebControl = interface;
  IPortableDeviceWebControlDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  PortableDevice = IPortableDevice;
  PortableDeviceManager = IPortableDeviceManager;
  PortableDeviceService = IPortableDeviceService;
  PortableDeviceDispatchFactory = IPortableDeviceDispatchFactory;
  PortableDeviceFTM = IPortableDevice;
  PortableDeviceServiceFTM = IPortableDeviceService;
  PortableDeviceWebControl = IPortableDeviceWebControl;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  wirePSAFEARRAY = ^PUserType5; 
  wireSNB = ^tagRemSNB; 
  PUserType6 = ^_FLAGGED_WORD_BLOB; {*}
  PUserType7 = ^_wireVARIANT; {*}
  PUserType14 = ^_wireBRECORD; {*}
  PUserType5 = ^_wireSAFEARRAY; {*}
  PPUserType1 = ^PUserType5; {*}
  PUserType11 = ^tagTYPEDESC; {*}
  PUserType12 = ^tagARRAYDESC; {*}
  PUserType2 = ^tag_inner_PROPVARIANT; {*}
  PUINT1 = ^LongWord; {*}
  PUserType1 = ^_tagpropertykey; {*}
  PUserType3 = ^TGUID; {*}
  PByte1 = ^Byte; {*}
  PUserType4 = ^_FILETIME; {*}
  POleVariant1 = ^OleVariant; {*}
  PUserType8 = ^tagTYPEATTR; {*}
  PUserType9 = ^tagFUNCDESC; {*}
  PUserType10 = ^tagVARDESC; {*}
  PUserType13 = ^tagTLIBATTR; {*}

  _tagpropertykey = record
    fmtid: TGUID;
    pid: LongWord;
  end;

{$ALIGN 8}
  _LARGE_INTEGER = record
    QuadPart: Int64;
  end;

  _ULARGE_INTEGER = record
    QuadPart: Largeuint;
  end;

{$ALIGN 4}
  _FILETIME = record
    dwLowDateTime: LongWord;
    dwHighDateTime: LongWord;
  end;

  tagCLIPDATA = record
    cbSize: LongWord;
    ulClipFmt: Integer;
    pClipData: ^Byte;
  end;

  tagBSTRBLOB = record
    cbSize: LongWord;
    pData: ^Byte;
  end;

  tagBLOB = record
    cbSize: LongWord;
    pBlobData: ^Byte;
  end;

  tagVersionedStream = record
    guidVersion: TGUID;
    pStream: IStream;
  end;


{$ALIGN 8}
  tagSTATSTG = record
    pwcsName: PWideChar;
    type_: LongWord;
    cbSize: _ULARGE_INTEGER;
    mtime: _FILETIME;
    ctime: _FILETIME;
    atime: _FILETIME;
    grfMode: LongWord;
    grfLocksSupported: LongWord;
    clsid: TGUID;
    grfStateBits: LongWord;
    reserved: LongWord;
  end;


{$ALIGN 4}
  tagRemSNB = record
    ulCntStr: LongWord;
    ulCntChar: LongWord;
    rgString: ^Word;
  end;

  tagCAC = record
    cElems: LongWord;
    pElems: ^Shortint;
  end;

  tagCAUB = record
    cElems: LongWord;
    pElems: ^Byte;
  end;


  _wireSAFEARR_BSTR = record
    Size: LongWord;
    aBstr: ^PUserType6;
  end;

  _wireSAFEARR_UNKNOWN = record
    Size: LongWord;
    apUnknown: ^IUnknown;
  end;

  _wireSAFEARR_DISPATCH = record
    Size: LongWord;
    apDispatch: ^IDispatch;
  end;

  _FLAGGED_WORD_BLOB = record
    fFlags: LongWord;
    clSize: LongWord;
    asData: ^Word;
  end;


  _wireSAFEARR_VARIANT = record
    Size: LongWord;
    aVariant: ^PUserType7;
  end;


  _wireBRECORD = record
    fFlags: LongWord;
    clSize: LongWord;
    pRecInfo: IRecordInfo;
    pRecord: ^Byte;
  end;


  __MIDL_IOleAutomationTypes_0005 = record
    case Integer of
      0: (lptdesc: PUserType11);
      1: (lpadesc: PUserType12);
      2: (hreftype: LongWord);
  end;

  tagTYPEDESC = record
    DUMMYUNIONNAME: __MIDL_IOleAutomationTypes_0005;
    vt: Word;
  end;

  tagSAFEARRAYBOUND = record
    cElements: LongWord;
    lLbound: Integer;
  end;

  ULONG_PTR = LongWord; 

  tagIDLDESC = record
    dwReserved: ULONG_PTR;
    wIDLFlags: Word;
  end;

  DWORD = LongWord; 

{$ALIGN 8}
  tagPARAMDESCEX = record
    cBytes: LongWord;
    varDefaultValue: OleVariant;
  end;

{$ALIGN 4}
  tagPARAMDESC = record
    pparamdescex: ^tagPARAMDESCEX;
    wParamFlags: Word;
  end;

  tagELEMDESC = record
    tdesc: tagTYPEDESC;
    paramdesc: tagPARAMDESC;
  end;

  tagFUNCDESC = record
    memid: Integer;
    lprgscode: ^SCODE;
    lprgelemdescParam: ^tagELEMDESC;
    funckind: tagFUNCKIND;
    invkind: tagINVOKEKIND;
    callconv: tagCALLCONV;
    cParams: Smallint;
    cParamsOpt: Smallint;
    oVft: Smallint;
    cScodes: Smallint;
    elemdescFunc: tagELEMDESC;
    wFuncFlags: Word;
  end;

  __MIDL_IOleAutomationTypes_0006 = record
    case Integer of
      0: (oInst: LongWord);
      1: (lpvarValue: ^OleVariant);
  end;

  tagVARDESC = record
    memid: Integer;
    lpstrSchema: PWideChar;
    DUMMYUNIONNAME: __MIDL_IOleAutomationTypes_0006;
    elemdescVar: tagELEMDESC;
    wVarFlags: Word;
    varkind: tagVARKIND;
  end;

  tagTLIBATTR = record
    guid: TGUID;
    lcid: LongWord;
    syskind: tagSYSKIND;
    wMajorVerNum: Word;
    wMinorVerNum: Word;
    wLibFlags: Word;
  end;

  _wireSAFEARR_BRECORD = record
    Size: LongWord;
    aRecord: ^PUserType14;
  end;

  _wireSAFEARR_HAVEIID = record
    Size: LongWord;
    apUnknown: ^IUnknown;
    iid: TGUID;
  end;

  _BYTE_SIZEDARR = record
    clSize: LongWord;
    pData: ^Byte;
  end;

  _SHORT_SIZEDARR = record
    clSize: LongWord;
    pData: ^Word;
  end;

  _LONG_SIZEDARR = record
    clSize: LongWord;
    pData: ^LongWord;
  end;

  _HYPER_SIZEDARR = record
    clSize: LongWord;
    pData: ^Int64;
  end;

  tagCAI = record
    cElems: LongWord;
    pElems: ^Smallint;
  end;

  tagCAUI = record
    cElems: LongWord;
    pElems: ^Word;
  end;

  tagCAL = record
    cElems: LongWord;
    pElems: ^Integer;
  end;

  tagCAUL = record
    cElems: LongWord;
    pElems: ^LongWord;
  end;

  tagCAH = record
    cElems: LongWord;
    pElems: ^_LARGE_INTEGER;
  end;

  tagCAUH = record
    cElems: LongWord;
    pElems: ^_ULARGE_INTEGER;
  end;

  tagCAFLT = record
    cElems: LongWord;
    pElems: ^Single;
  end;

  tagCADBL = record
    cElems: LongWord;
    pElems: ^Double;
  end;

  tagCABOOL = record
    cElems: LongWord;
    pElems: ^WordBool;
  end;

  tagCASCODE = record
    cElems: LongWord;
    pElems: ^SCODE;
  end;

  tagCACY = record
    cElems: LongWord;
    pElems: ^Currency;
  end;

  tagCADATE = record
    cElems: LongWord;
    pElems: ^TDateTime;
  end;

  tagCAFILETIME = record
    cElems: LongWord;
    pElems: ^_FILETIME;
  end;

  tagCACLSID = record
    cElems: LongWord;
    pElems: ^TGUID;
  end;

  tagCACLIPDATA = record
    cElems: LongWord;
    pElems: ^tagCLIPDATA;
  end;

  tagCABSTR = record
    cElems: LongWord;
    pElems: ^WideString;
  end;

  tagCABSTRBLOB = record
    cElems: LongWord;
    pElems: ^tagBSTRBLOB;
  end;

  tagCALPSTR = record
    cElems: LongWord;
    pElems: ^PAnsiChar;
  end;

  tagCALPWSTR = record
    cElems: LongWord;
    pElems: ^PWideChar;
  end;


  tagCAPROPVARIANT = record
    cElems: LongWord;
    pElems: PUserType2;
  end;

{$ALIGN 8}
  __MIDL___MIDL_itf_PortableDeviceApi_0001_0000_0001 = record
    case Integer of
      0: (cVal: Shortint);
      1: (bVal: Byte);
      2: (iVal: Smallint);
      3: (uiVal: Word);
      4: (lVal: Integer);
      5: (ulVal: LongWord);
      6: (intVal: SYSINT);
      7: (uintVal: SYSUINT);
      8: (hVal: _LARGE_INTEGER);
      9: (uhVal: _ULARGE_INTEGER);
      10: (fltVal: Single);
      11: (dblVal: Double);
      12: (boolVal: WordBool);
      13: (bool: WordBool);
      14: (scode: SCODE);
      15: (cyVal: Currency);
      16: (date: TDateTime);
      17: (filetime: _FILETIME);
      18: (puuid: ^TGUID);
      19: (pClipData: ^tagCLIPDATA);
      20: (bstrVal: {NOT_UNION(WideString)}Pointer);
      21: (bstrblobVal: tagBSTRBLOB);
      22: (blob: tagBLOB);
      23: (pszVal: PAnsiChar);
      24: (pwszVal: PWideChar);
      25: (punkVal: {NOT_UNION(IUnknown)}Pointer);
      26: (pdispVal: {NOT_UNION(IDispatch)}Pointer);
      27: (pStream: {NOT_UNION(IStream)}Pointer);
      28: (pStorage: {NOT_UNION(IStorage)}Pointer);
      29: (pVersionedStream: ^tagVersionedStream);
      30: (parray: wirePSAFEARRAY);
      31: (cac: tagCAC);
      32: (caub: tagCAUB);
      33: (cai: tagCAI);
      34: (caui: tagCAUI);
      35: (cal: tagCAL);
      36: (caul: tagCAUL);
      37: (cah: tagCAH);
      38: (cauh: tagCAUH);
      39: (caflt: tagCAFLT);
      40: (cadbl: tagCADBL);
      41: (cabool: tagCABOOL);
      42: (cascode: tagCASCODE);
      43: (cacy: tagCACY);
      44: (cadate: tagCADATE);
      45: (cafiletime: tagCAFILETIME);
      46: (cauuid: tagCACLSID);
      47: (caclipdata: tagCACLIPDATA);
      48: (cabstr: tagCABSTR);
      49: (cabstrblob: tagCABSTRBLOB);
      50: (calpstr: tagCALPSTR);
      51: (calpwstr: tagCALPWSTR);
      52: (capropvar: tagCAPROPVARIANT);
      53: (pcVal: ^Shortint);
      54: (pbVal: ^Byte);
      55: (piVal: ^Smallint);
      56: (puiVal: ^Word);
      57: (plVal: ^Integer);
      58: (pulVal: ^LongWord);
      59: (pintVal: ^SYSINT);
      60: (puintVal: ^SYSUINT);
      61: (pfltVal: ^Single);
      62: (pdblVal: ^Double);
      63: (pboolVal: ^WordBool);
      64: (pdecVal: ^TDecimal);
      65: (pscode: ^SCODE);
      66: (pcyVal: ^Currency);
      67: (pdate: ^TDateTime);
      68: (pbstrVal: ^WideString);
      69: (ppunkVal: {NOT_UNION(^IUnknown)}Pointer);
      70: (ppdispVal: {NOT_UNION(^IDispatch)}Pointer);
      71: (pparray: ^wirePSAFEARRAY);
      72: (pvarVal: PUserType2);
  end;


  tag_inner_PROPVARIANT = record
    vt: Word;
    wReserved1: Byte;
    wReserved2: Byte;
    wReserved3: LongWord;
    __MIDL____MIDL_itf_PortableDeviceApi_0001_00000001: __MIDL___MIDL_itf_PortableDeviceApi_0001_0000_0001;
  end;


  __MIDL_IOleAutomationTypes_0004 = record
    case Integer of
      0: (llVal: Int64);
      1: (lVal: Integer);
      2: (bVal: Byte);
      3: (iVal: Smallint);
      4: (fltVal: Single);
      5: (dblVal: Double);
      6: (boolVal: WordBool);
      7: (scode: SCODE);
      8: (cyVal: Currency);
      9: (date: TDateTime);
      10: (bstrVal: ^_FLAGGED_WORD_BLOB);
      11: (punkVal: {NOT_UNION(IUnknown)}Pointer);
      12: (pdispVal: {NOT_UNION(IDispatch)}Pointer);
      13: (parray: ^PUserType5);
      14: (brecVal: ^_wireBRECORD);
      15: (pbVal: ^Byte);
      16: (piVal: ^Smallint);
      17: (plVal: ^Integer);
      18: (pllVal: ^Int64);
      19: (pfltVal: ^Single);
      20: (pdblVal: ^Double);
      21: (pboolVal: ^WordBool);
      22: (pscode: ^SCODE);
      23: (pcyVal: ^Currency);
      24: (pdate: ^TDateTime);
      25: (pbstrVal: ^PUserType6);
      26: (ppunkVal: {NOT_UNION(^IUnknown)}Pointer);
      27: (ppdispVal: {NOT_UNION(^IDispatch)}Pointer);
      28: (pparray: ^PPUserType1);
      29: (pvarVal: ^PUserType7);
      30: (cVal: Shortint);
      31: (uiVal: Word);
      32: (ulVal: LongWord);
      33: (ullVal: Largeuint);
      34: (intVal: SYSINT);
      35: (uintVal: SYSUINT);
      36: (decVal: TDecimal);
      37: (pdecVal: ^TDecimal);
      38: (pcVal: ^Shortint);
      39: (puiVal: ^Word);
      40: (pulVal: ^LongWord);
      41: (pullVal: ^Largeuint);
      42: (pintVal: ^SYSINT);
      43: (puintVal: ^SYSUINT);
  end;

{$ALIGN 4}
  __MIDL_IOleAutomationTypes_0001 = record
    case Integer of
      0: (BstrStr: _wireSAFEARR_BSTR);
      1: (UnknownStr: _wireSAFEARR_UNKNOWN);
      2: (DispatchStr: _wireSAFEARR_DISPATCH);
      3: (VariantStr: _wireSAFEARR_VARIANT);
      4: (RecordStr: _wireSAFEARR_BRECORD);
      5: (HaveIidStr: _wireSAFEARR_HAVEIID);
      6: (ByteStr: _BYTE_SIZEDARR);
      7: (WordStr: _SHORT_SIZEDARR);
      8: (LongStr: _LONG_SIZEDARR);
      9: (HyperStr: _HYPER_SIZEDARR);
  end;

  _wireSAFEARRAY_UNION = record
    sfType: LongWord;
    u: __MIDL_IOleAutomationTypes_0001;
  end;

{$ALIGN 8}
  _wireVARIANT = record
    clSize: LongWord;
    rpcReserved: LongWord;
    vt: Word;
    wReserved1: Word;
    wReserved2: Word;
    wReserved3: Word;
    DUMMYUNIONNAME: __MIDL_IOleAutomationTypes_0004;
  end;


{$ALIGN 4}
  tagTYPEATTR = record
    guid: TGUID;
    lcid: LongWord;
    dwReserved: LongWord;
    memidConstructor: Integer;
    memidDestructor: Integer;
    lpstrSchema: PWideChar;
    cbSizeInstance: LongWord;
    typekind: tagTYPEKIND;
    cFuncs: Word;
    cVars: Word;
    cImplTypes: Word;
    cbSizeVft: Word;
    cbAlignment: Word;
    wTypeFlags: Word;
    wMajorVerNum: Word;
    wMinorVerNum: Word;
    tdescAlias: tagTYPEDESC;
    idldescType: tagIDLDESC;
  end;

  tagARRAYDESC = record
    tdescElem: tagTYPEDESC;
    cDims: Word;
    rgbounds: ^tagSAFEARRAYBOUND;
  end;


  _wireSAFEARRAY = record
    cDims: Word;
    fFeatures: Word;
    cbElements: LongWord;
    cLocks: LongWord;
    uArrayStructs: _wireSAFEARRAY_UNION;
    rgsabound: ^tagSAFEARRAYBOUND;
  end;


// *********************************************************************//
// Interface: IPortableDevice
// Flags:     (0)
// GUID:      {625E2DF8-6392-4CF0-9AD1-3CFA5F17775C}
// *********************************************************************//
  IPortableDevice = interface(IUnknown)
    ['{625E2DF8-6392-4CF0-9AD1-3CFA5F17775C}']
    function Open(pszPnPDeviceID: PWideChar; const pClientInfo: IPortableDeviceValues): HResult; stdcall;
    function SendCommand(dwFlags: LongWord; const pParameters: IPortableDeviceValues; 
                         out ppResults: IPortableDeviceValues): HResult; stdcall;
    function Content(out ppContent: IPortableDeviceContent): HResult; stdcall;
    function Capabilities(out ppCapabilities: IPortableDeviceCapabilities): HResult; stdcall;
    function Cancel: HResult; stdcall;
    function Close: HResult; stdcall;
    function Advise(dwFlags: LongWord; const pCallback: IPortableDeviceEventCallback; 
                    const pParameters: IPortableDeviceValues; out ppszCookie: PWideChar): HResult; stdcall;
    function Unadvise(pszCookie: PWideChar): HResult; stdcall;
    function GetPnPDeviceID(out ppszPnPDeviceID: PWideChar): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IPortableDeviceValues
// Flags:     (0)
// GUID:      {6848F6F2-3155-4F86-B6F5-263EEEAB3143}
// *********************************************************************//
  IPortableDeviceValues = interface(IUnknown)
    ['{6848F6F2-3155-4F86-B6F5-263EEEAB3143}']
    function GetCount(var pcelt: LongWord): HResult; stdcall;
    function GetAt(index: LongWord; var pKey: _tagpropertykey; var pValue: tag_inner_PROPVARIANT): HResult; stdcall;
    function SetValue(var key: _tagpropertykey; var pValue: tag_inner_PROPVARIANT): HResult; stdcall;
    function GetValue(var key: _tagpropertykey; out pValue: tag_inner_PROPVARIANT): HResult; stdcall;
    function SetStringValue(var key: _tagpropertykey; Value: PWideChar): HResult; stdcall;
    function GetStringValue(var key: _tagpropertykey; out pValue: PWideChar): HResult; stdcall;
    function SetUnsignedIntegerValue(var key: _tagpropertykey; Value: LongWord): HResult; stdcall;
    function GetUnsignedIntegerValue(var key: _tagpropertykey; out pValue: LongWord): HResult; stdcall;
    function SetSignedIntegerValue(var key: _tagpropertykey; Value: Integer): HResult; stdcall;
    function GetSignedIntegerValue(var key: _tagpropertykey; out pValue: Integer): HResult; stdcall;
    function SetUnsignedLargeIntegerValue(var key: _tagpropertykey; Value: Largeuint): HResult; stdcall;
    function GetUnsignedLargeIntegerValue(var key: _tagpropertykey; out pValue: Largeuint): HResult; stdcall;
    function SetSignedLargeIntegerValue(var key: _tagpropertykey; Value: Int64): HResult; stdcall;
    function GetSignedLargeIntegerValue(var key: _tagpropertykey; out pValue: Int64): HResult; stdcall;
    function SetFloatValue(var key: _tagpropertykey; Value: Single): HResult; stdcall;
    function GetFloatValue(var key: _tagpropertykey; out pValue: Single): HResult; stdcall;
    function SetErrorValue(var key: _tagpropertykey; Value: HResult): HResult; stdcall;
    function GetErrorValue(var key: _tagpropertykey; out pValue: HResult): HResult; stdcall;
    function SetKeyValue(var key: _tagpropertykey; var Value: _tagpropertykey): HResult; stdcall;
    function GetKeyValue(var key: _tagpropertykey; out pValue: _tagpropertykey): HResult; stdcall;
    function SetBoolValue(var key: _tagpropertykey; Value: Integer): HResult; stdcall;
    function GetBoolValue(var key: _tagpropertykey; out pValue: Integer): HResult; stdcall;
    function SetIUnknownValue(var key: _tagpropertykey; const pValue: IUnknown): HResult; stdcall;
    function GetIUnknownValue(var key: _tagpropertykey; out ppValue: IUnknown): HResult; stdcall;
    function SetGuidValue(var key: _tagpropertykey; var Value: TGUID): HResult; stdcall;
    function GetGuidValue(var key: _tagpropertykey; out pValue: TGUID): HResult; stdcall;
    function SetBufferValue(var key: _tagpropertykey; var pValue: Byte; cbValue: LongWord): HResult; stdcall;
    function GetBufferValue(var key: _tagpropertykey; out ppValue: PByte1; out pcbValue: LongWord): HResult; stdcall;
    function SetIPortableDeviceValuesValue(var key: _tagpropertykey; 
                                           const pValue: IPortableDeviceValues): HResult; stdcall;
    function GetIPortableDeviceValuesValue(var key: _tagpropertykey; 
                                           out ppValue: IPortableDeviceValues): HResult; stdcall;
    function SetIPortableDevicePropVariantCollectionValue(var key: _tagpropertykey; 
                                                          const pValue: IPortableDevicePropVariantCollection): HResult; stdcall;
    function GetIPortableDevicePropVariantCollectionValue(var key: _tagpropertykey; 
                                                          out ppValue: IPortableDevicePropVariantCollection): HResult; stdcall;
    function SetIPortableDeviceKeyCollectionValue(var key: _tagpropertykey; 
                                                  const pValue: IPortableDeviceKeyCollection): HResult; stdcall;
    function GetIPortableDeviceKeyCollectionValue(var key: _tagpropertykey; 
                                                  out ppValue: IPortableDeviceKeyCollection): HResult; stdcall;
    function SetIPortableDeviceValuesCollectionValue(var key: _tagpropertykey; 
                                                     const pValue: IPortableDeviceValuesCollection): HResult; stdcall;
    function GetIPortableDeviceValuesCollectionValue(var key: _tagpropertykey; 
                                                     out ppValue: IPortableDeviceValuesCollection): HResult; stdcall;
    function RemoveValue(var key: _tagpropertykey): HResult; stdcall;
    function CopyValuesFromPropertyStore(const pStore: IPropertyStore): HResult; stdcall;
    function CopyValuesToPropertyStore(const pStore: IPropertyStore): HResult; stdcall;
    function Clear: HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ISequentialStream
// Flags:     (0)
// GUID:      {0C733A30-2A1C-11CE-ADE5-00AA0044773D}
// *********************************************************************//
  ISequentialStream = interface(IUnknown)
    ['{0C733A30-2A1C-11CE-ADE5-00AA0044773D}']
    function RemoteRead(out pv: Byte; cb: LongWord; out pcbRead: LongWord): HResult; stdcall;
    function RemoteWrite(var pv: Byte; cb: LongWord; out pcbWritten: LongWord): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IStream
// Flags:     (0)
// GUID:      {0000000C-0000-0000-C000-000000000046}
// *********************************************************************//
  IStream = interface(ISequentialStream)
    ['{0000000C-0000-0000-C000-000000000046}']
    function RemoteSeek(dlibMove: _LARGE_INTEGER; dwOrigin: LongWord; 
                        out plibNewPosition: _ULARGE_INTEGER): HResult; stdcall;
    function SetSize(libNewSize: _ULARGE_INTEGER): HResult; stdcall;
    function RemoteCopyTo(const pstm: IStream; cb: _ULARGE_INTEGER; out pcbRead: _ULARGE_INTEGER; 
                          out pcbWritten: _ULARGE_INTEGER): HResult; stdcall;
    function Commit(grfCommitFlags: LongWord): HResult; stdcall;
    function Revert: HResult; stdcall;
    function LockRegion(libOffset: _ULARGE_INTEGER; cb: _ULARGE_INTEGER; dwLockType: LongWord): HResult; stdcall;
    function UnlockRegion(libOffset: _ULARGE_INTEGER; cb: _ULARGE_INTEGER; dwLockType: LongWord): HResult; stdcall;
    function Stat(out pstatstg: tagSTATSTG; grfStatFlag: LongWord): HResult; stdcall;
    function Clone(out ppstm: IStream): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IStorage
// Flags:     (0)
// GUID:      {0000000B-0000-0000-C000-000000000046}
// *********************************************************************//
  IStorage = interface(IUnknown)
    ['{0000000B-0000-0000-C000-000000000046}']
    function CreateStream(pwcsName: PWideChar; grfMode: LongWord; reserved1: LongWord; 
                          reserved2: LongWord; out ppstm: IStream): HResult; stdcall;
    function RemoteOpenStream(pwcsName: PWideChar; cbReserved1: LongWord; var reserved1: Byte; 
                              grfMode: LongWord; reserved2: LongWord; out ppstm: IStream): HResult; stdcall;
    function CreateStorage(pwcsName: PWideChar; grfMode: LongWord; reserved1: LongWord; 
                           reserved2: LongWord; out ppstg: IStorage): HResult; stdcall;
    function OpenStorage(pwcsName: PWideChar; const pstgPriority: IStorage; grfMode: LongWord; 
                         var snbExclude: tagRemSNB; reserved: LongWord; out ppstg: IStorage): HResult; stdcall;
    function RemoteCopyTo(ciidExclude: LongWord; var rgiidExclude: TGUID; 
                          var snbExclude: tagRemSNB; const pstgDest: IStorage): HResult; stdcall;
    function MoveElementTo(pwcsName: PWideChar; const pstgDest: IStorage; pwcsNewName: PWideChar; 
                           grfFlags: LongWord): HResult; stdcall;
    function Commit(grfCommitFlags: LongWord): HResult; stdcall;
    function Revert: HResult; stdcall;
    function RemoteEnumElements(reserved1: LongWord; cbReserved2: LongWord; var reserved2: Byte; 
                                reserved3: LongWord; out ppenum: IEnumSTATSTG): HResult; stdcall;
    function DestroyElement(pwcsName: PWideChar): HResult; stdcall;
    function RenameElement(pwcsOldName: PWideChar; pwcsNewName: PWideChar): HResult; stdcall;
    function SetElementTimes(pwcsName: PWideChar; var pctime: _FILETIME; var patime: _FILETIME; 
                             var pmtime: _FILETIME): HResult; stdcall;
    function SetClass(var clsid: TGUID): HResult; stdcall;
    function SetStateBits(grfStateBits: LongWord; grfMask: LongWord): HResult; stdcall;
    function Stat(out pstatstg: tagSTATSTG; grfStatFlag: LongWord): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IEnumSTATSTG
// Flags:     (0)
// GUID:      {0000000D-0000-0000-C000-000000000046}
// *********************************************************************//
  IEnumSTATSTG = interface(IUnknown)
    ['{0000000D-0000-0000-C000-000000000046}']
    function RemoteNext(celt: LongWord; out rgelt: tagSTATSTG; out pceltFetched: LongWord): HResult; stdcall;
    function Skip(celt: LongWord): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Clone(out ppenum: IEnumSTATSTG): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IRecordInfo
// Flags:     (0)
// GUID:      {0000002F-0000-0000-C000-000000000046}
// *********************************************************************//
  IRecordInfo = interface(IUnknown)
    ['{0000002F-0000-0000-C000-000000000046}']
    function RecordInit(pvNew: Pointer): HResult; stdcall;
    function RecordClear(pvExisting: Pointer): HResult; stdcall;
    function RecordCopy(pvExisting: Pointer; pvNew: Pointer): HResult; stdcall;
    function GetGuid(out pguid: TGUID): HResult; stdcall;
    function GetName(out pbstrName: WideString): HResult; stdcall;
    function GetSize(out pcbSize: LongWord): HResult; stdcall;
    function GetTypeInfo(out ppTypeInfo: ITypeInfo): HResult; stdcall;
    function GetField(pvData: Pointer; szFieldName: PWideChar; out pvarField: OleVariant): HResult; stdcall;
    function GetFieldNoCopy(pvData: Pointer; szFieldName: PWideChar; out pvarField: OleVariant; 
                            out ppvDataCArray: Pointer): HResult; stdcall;
    function PutField(wFlags: LongWord; pvData: Pointer; szFieldName: PWideChar; 
                      const pvarField: OleVariant): HResult; stdcall;
    function PutFieldNoCopy(wFlags: LongWord; pvData: Pointer; szFieldName: PWideChar; 
                            const pvarField: OleVariant): HResult; stdcall;
    function GetFieldNames(var pcNames: LongWord; out rgBstrNames: WideString): HResult; stdcall;
    function IsMatchingType(const pRecordInfo: IRecordInfo): Integer; stdcall;
    function RecordCreate: Pointer; stdcall;
    function RecordCreateCopy(pvSource: Pointer; out ppvDest: Pointer): HResult; stdcall;
    function RecordDestroy(pvRecord: Pointer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITypeInfo
// Flags:     (0)
// GUID:      {00020401-0000-0000-C000-000000000046}
// *********************************************************************//
  ITypeInfo = interface(IUnknown)
    ['{00020401-0000-0000-C000-000000000046}']
    function RemoteGetTypeAttr(out ppTypeAttr: PUserType8; out pDummy: DWORD): HResult; stdcall;
    function GetTypeComp(out ppTComp: ITypeComp): HResult; stdcall;
    function RemoteGetFuncDesc(index: SYSUINT; out ppFuncDesc: PUserType9; out pDummy: DWORD): HResult; stdcall;
    function RemoteGetVarDesc(index: SYSUINT; out ppVarDesc: PUserType10; out pDummy: DWORD): HResult; stdcall;
    function RemoteGetNames(memid: Integer; out rgBstrNames: WideString; cMaxNames: SYSUINT; 
                            out pcNames: SYSUINT): HResult; stdcall;
    function GetRefTypeOfImplType(index: SYSUINT; out pRefType: LongWord): HResult; stdcall;
    function GetImplTypeFlags(index: SYSUINT; out pImplTypeFlags: SYSINT): HResult; stdcall;
    function LocalGetIDsOfNames: HResult; stdcall;
    function LocalInvoke: HResult; stdcall;
    function RemoteGetDocumentation(memid: Integer; refPtrFlags: LongWord; 
                                    out pbstrName: WideString; out pBstrDocString: WideString; 
                                    out pdwHelpContext: LongWord; out pBstrHelpFile: WideString): HResult; stdcall;
    function RemoteGetDllEntry(memid: Integer; invkind: tagINVOKEKIND; refPtrFlags: LongWord; 
                               out pBstrDllName: WideString; out pbstrName: WideString; 
                               out pwOrdinal: Word): HResult; stdcall;
    function GetRefTypeInfo(hreftype: LongWord; out ppTInfo: ITypeInfo): HResult; stdcall;
    function LocalAddressOfMember: HResult; stdcall;
    function RemoteCreateInstance(var riid: TGUID; out ppvObj: IUnknown): HResult; stdcall;
    function GetMops(memid: Integer; out pBstrMops: WideString): HResult; stdcall;
    function RemoteGetContainingTypeLib(out ppTLib: ITypeLib; out pIndex: SYSUINT): HResult; stdcall;
    function LocalReleaseTypeAttr: HResult; stdcall;
    function LocalReleaseFuncDesc: HResult; stdcall;
    function LocalReleaseVarDesc: HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITypeComp
// Flags:     (0)
// GUID:      {00020403-0000-0000-C000-000000000046}
// *********************************************************************//
  ITypeComp = interface(IUnknown)
    ['{00020403-0000-0000-C000-000000000046}']
    function RemoteBind(szName: PWideChar; lHashVal: LongWord; wFlags: Word; 
                        out ppTInfo: ITypeInfo; out pDescKind: tagDESCKIND; 
                        out ppFuncDesc: PUserType9; out ppVarDesc: PUserType10; 
                        out ppTypeComp: ITypeComp; out pDummy: DWORD): HResult; stdcall;
    function RemoteBindType(szName: PWideChar; lHashVal: LongWord; out ppTInfo: ITypeInfo): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITypeLib
// Flags:     (0)
// GUID:      {00020402-0000-0000-C000-000000000046}
// *********************************************************************//
  ITypeLib = interface(IUnknown)
    ['{00020402-0000-0000-C000-000000000046}']
    function RemoteGetTypeInfoCount(out pcTInfo: SYSUINT): HResult; stdcall;
    function GetTypeInfo(index: SYSUINT; out ppTInfo: ITypeInfo): HResult; stdcall;
    function GetTypeInfoType(index: SYSUINT; out pTKind: tagTYPEKIND): HResult; stdcall;
    function GetTypeInfoOfGuid(var guid: TGUID; out ppTInfo: ITypeInfo): HResult; stdcall;
    function RemoteGetLibAttr(out ppTLibAttr: PUserType13; out pDummy: DWORD): HResult; stdcall;
    function GetTypeComp(out ppTComp: ITypeComp): HResult; stdcall;
    function RemoteGetDocumentation(index: SYSINT; refPtrFlags: LongWord; 
                                    out pbstrName: WideString; out pBstrDocString: WideString; 
                                    out pdwHelpContext: LongWord; out pBstrHelpFile: WideString): HResult; stdcall;
    function RemoteIsName(szNameBuf: PWideChar; lHashVal: LongWord; out pfName: Integer; 
                          out pBstrLibName: WideString): HResult; stdcall;
    function RemoteFindName(szNameBuf: PWideChar; lHashVal: LongWord; out ppTInfo: ITypeInfo; 
                            out rgMemId: Integer; var pcFound: Word; out pBstrLibName: WideString): HResult; stdcall;
    function LocalReleaseTLibAttr: HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IPortableDevicePropVariantCollection
// Flags:     (0)
// GUID:      {89B2E422-4F1B-4316-BCEF-A44AFEA83EB3}
// *********************************************************************//
  IPortableDevicePropVariantCollection = interface(IUnknown)
    ['{89B2E422-4F1B-4316-BCEF-A44AFEA83EB3}']
    function GetCount(var pcElems: LongWord): HResult; stdcall;
    function GetAt(dwIndex: LongWord; var pValue: tag_inner_PROPVARIANT): HResult; stdcall;
    function Add(var pValue: tag_inner_PROPVARIANT): HResult; stdcall;
    function GetType(out pvt: Word): HResult; stdcall;
    function ChangeType(vt: Word): HResult; stdcall;
    function Clear: HResult; stdcall;
    function RemoveAt(dwIndex: LongWord): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IPortableDeviceKeyCollection
// Flags:     (0)
// GUID:      {DADA2357-E0AD-492E-98DB-DD61C53BA353}
// *********************************************************************//
  IPortableDeviceKeyCollection = interface(IUnknown)
    ['{DADA2357-E0AD-492E-98DB-DD61C53BA353}']
    function GetCount(var pcElems: LongWord): HResult; stdcall;
    function GetAt(dwIndex: LongWord; var pKey: _tagpropertykey): HResult; stdcall;
    function Add(var key: _tagpropertykey): HResult; stdcall;
    function Clear: HResult; stdcall;
    function RemoveAt(dwIndex: LongWord): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IPortableDeviceValuesCollection
// Flags:     (0)
// GUID:      {6E3F2D79-4E07-48C4-8208-D8C2E5AF4A99}
// *********************************************************************//
  IPortableDeviceValuesCollection = interface(IUnknown)
    ['{6E3F2D79-4E07-48C4-8208-D8C2E5AF4A99}']
    function GetCount(var pcElems: LongWord): HResult; stdcall;
    function GetAt(dwIndex: LongWord; out ppValues: IPortableDeviceValues): HResult; stdcall;
    function Add(const pValues: IPortableDeviceValues): HResult; stdcall;
    function Clear: HResult; stdcall;
    function RemoveAt(dwIndex: LongWord): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IPropertyStore
// Flags:     (0)
// GUID:      {886D8EEB-8CF2-4446-8D02-CDBA1DBDCF99}
// *********************************************************************//
  IPropertyStore = interface(IUnknown)
    ['{886D8EEB-8CF2-4446-8D02-CDBA1DBDCF99}']
    function GetCount(out cProps: LongWord): HResult; stdcall;
    function GetAt(iProp: LongWord; out pKey: _tagpropertykey): HResult; stdcall;
    function GetValue(var key: _tagpropertykey; out pv: tag_inner_PROPVARIANT): HResult; stdcall;
    function SetValue(var key: _tagpropertykey; var propvar: tag_inner_PROPVARIANT): HResult; stdcall;
    function Commit: HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IPortableDeviceContent
// Flags:     (0)
// GUID:      {6A96ED84-7C73-4480-9938-BF5AF477D426}
// *********************************************************************//
  IPortableDeviceContent = interface(IUnknown)
    ['{6A96ED84-7C73-4480-9938-BF5AF477D426}']
    function EnumObjects(dwFlags: LongWord; pszParentObjectID: PWideChar; 
                         const pFilter: IPortableDeviceValues; 
                         out ppenum: IEnumPortableDeviceObjectIDs): HResult; stdcall;
    function Properties(out ppProperties: IPortableDeviceProperties): HResult; stdcall;
    function Transfer(out ppResources: IPortableDeviceResources): HResult; stdcall;
    function CreateObjectWithPropertiesOnly(const pValues: IPortableDeviceValues; 
                                            var ppszObjectID: PWideChar): HResult; stdcall;
    function CreateObjectWithPropertiesAndData(const pValues: IPortableDeviceValues; 
                                               out ppData: IStream; 
                                               var pdwOptimalWriteBufferSize: LongWord; 
                                               var ppszCookie: PWideChar): HResult; stdcall;
    function Delete(dwOptions: LongWord; const pObjectIDs: IPortableDevicePropVariantCollection; 
                    var ppResults: IPortableDevicePropVariantCollection): HResult; stdcall;
    function GetObjectIDsFromPersistentUniqueIDs(const pPersistentUniqueIDs: IPortableDevicePropVariantCollection; 
                                                 out ppObjectIDs: IPortableDevicePropVariantCollection): HResult; stdcall;
    function Cancel: HResult; stdcall;
    function Move(const pObjectIDs: IPortableDevicePropVariantCollection; 
                  pszDestinationFolderObjectID: PWideChar; 
                  var ppResults: IPortableDevicePropVariantCollection): HResult; stdcall;
    function Copy(const pObjectIDs: IPortableDevicePropVariantCollection; 
                  pszDestinationFolderObjectID: PWideChar; 
                  var ppResults: IPortableDevicePropVariantCollection): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IEnumPortableDeviceObjectIDs
// Flags:     (0)
// GUID:      {10ECE955-CF41-4728-BFA0-41EEDF1BBF19}
// *********************************************************************//
  IEnumPortableDeviceObjectIDs = interface(IUnknown)
    ['{10ECE955-CF41-4728-BFA0-41EEDF1BBF19}']
    function Next(cObjects: LongWord; out pObjIDs: PWideChar; var pcFetched: LongWord): HResult; stdcall;
    function Skip(cObjects: LongWord): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Clone(out ppenum: IEnumPortableDeviceObjectIDs): HResult; stdcall;
    function Cancel: HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IPortableDeviceProperties
// Flags:     (0)
// GUID:      {7F6D695C-03DF-4439-A809-59266BEEE3A6}
// *********************************************************************//
  IPortableDeviceProperties = interface(IUnknown)
    ['{7F6D695C-03DF-4439-A809-59266BEEE3A6}']
    function GetSupportedProperties(pszObjectID: PWideChar; out ppKeys: IPortableDeviceKeyCollection): HResult; stdcall;
    function GetPropertyAttributes(pszObjectID: PWideChar; var key: _tagpropertykey; 
                                   out ppAttributes: IPortableDeviceValues): HResult; stdcall;
    function GetValues(pszObjectID: PWideChar; const pKeys: IPortableDeviceKeyCollection; 
                       out ppValues: IPortableDeviceValues): HResult; stdcall;
    function SetValues(pszObjectID: PWideChar; const pValues: IPortableDeviceValues; 
                       out ppResults: IPortableDeviceValues): HResult; stdcall;
    function Delete(pszObjectID: PWideChar; const pKeys: IPortableDeviceKeyCollection): HResult; stdcall;
    function Cancel: HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IPortableDeviceResources
// Flags:     (0)
// GUID:      {FD8878AC-D841-4D17-891C-E6829CDB6934}
// *********************************************************************//
  IPortableDeviceResources = interface(IUnknown)
    ['{FD8878AC-D841-4D17-891C-E6829CDB6934}']
    function GetSupportedResources(pszObjectID: PWideChar; out ppKeys: IPortableDeviceKeyCollection): HResult; stdcall;
    function GetResourceAttributes(pszObjectID: PWideChar; var key: _tagpropertykey; 
                                   out ppResourceAttributes: IPortableDeviceValues): HResult; stdcall;
    function GetStream(pszObjectID: PWideChar; var key: _tagpropertykey; dwMode: LongWord; 
                       var pdwOptimalBufferSize: LongWord; out ppStream: IStream): HResult; stdcall;
    function Delete(pszObjectID: PWideChar; const pKeys: IPortableDeviceKeyCollection): HResult; stdcall;
    function Cancel: HResult; stdcall;
    function CreateResource(const pResourceAttributes: IPortableDeviceValues; out ppData: IStream; 
                            var pdwOptimalWriteBufferSize: LongWord; var ppszCookie: PWideChar): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IPortableDeviceCapabilities
// Flags:     (0)
// GUID:      {2C8C6DBF-E3DC-4061-BECC-8542E810D126}
// *********************************************************************//
  IPortableDeviceCapabilities = interface(IUnknown)
    ['{2C8C6DBF-E3DC-4061-BECC-8542E810D126}']
    function GetSupportedCommands(out ppCommands: IPortableDeviceKeyCollection): HResult; stdcall;
    function GetCommandOptions(var Command: _tagpropertykey; out ppOptions: IPortableDeviceValues): HResult; stdcall;
    function GetFunctionalCategories(out ppCategories: IPortableDevicePropVariantCollection): HResult; stdcall;
    function GetFunctionalObjects(var Category: TGUID; 
                                  out ppObjectIDs: IPortableDevicePropVariantCollection): HResult; stdcall;
    function GetSupportedContentTypes(var Category: TGUID; 
                                      out ppContentTypes: IPortableDevicePropVariantCollection): HResult; stdcall;
    function GetSupportedFormats(var ContentType: TGUID; 
                                 out ppFormats: IPortableDevicePropVariantCollection): HResult; stdcall;
    function GetSupportedFormatProperties(var Format: TGUID; 
                                          out ppKeys: IPortableDeviceKeyCollection): HResult; stdcall;
    function GetFixedPropertyAttributes(var Format: TGUID; var key: _tagpropertykey; 
                                        out ppAttributes: IPortableDeviceValues): HResult; stdcall;
    function Cancel: HResult; stdcall;
    function GetSupportedEvents(out ppEvents: IPortableDevicePropVariantCollection): HResult; stdcall;
    function GetEventOptions(var Event: TGUID; out ppOptions: IPortableDeviceValues): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IPortableDeviceEventCallback
// Flags:     (0)
// GUID:      {A8792A31-F385-493C-A893-40F64EB45F6E}
// *********************************************************************//
  IPortableDeviceEventCallback = interface(IUnknown)
    ['{A8792A31-F385-493C-A893-40F64EB45F6E}']
    function OnEvent(const pEventParameters: IPortableDeviceValues): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IPortableDeviceManager
// Flags:     (0)
// GUID:      {A1567595-4C2F-4574-A6FA-ECEF917B9A40}
// *********************************************************************//
  IPortableDeviceManager = interface(IUnknown)
    ['{A1567595-4C2F-4574-A6FA-ECEF917B9A40}']
    function GetDevices(var pPnPDeviceIDs: PWideChar; var pcPnPDeviceIDs: LongWord): HResult; stdcall;
    function RefreshDeviceList: HResult; stdcall;
    function GetDeviceFriendlyName(pszPnPDeviceID: PWideChar; var pDeviceFriendlyName: Word; 
                                   var pcchDeviceFriendlyName: LongWord): HResult; stdcall;
    function GetDeviceDescription(pszPnPDeviceID: PWideChar; var pDeviceDescription: Word; 
                                  var pcchDeviceDescription: LongWord): HResult; stdcall;
    function GetDeviceManufacturer(pszPnPDeviceID: PWideChar; var pDeviceManufacturer: Word; 
                                   var pcchDeviceManufacturer: LongWord): HResult; stdcall;
    function GetDeviceProperty(pszPnPDeviceID: PWideChar; pszDevicePropertyName: PWideChar; 
                               var pData: Byte; var pcbData: LongWord; var pdwType: LongWord): HResult; stdcall;
    function GetPrivateDevices(var pPnPDeviceIDs: PWideChar; var pcPnPDeviceIDs: LongWord): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IPortableDeviceService
// Flags:     (0)
// GUID:      {D3BD3A44-D7B5-40A9-98B7-2FA4D01DEC08}
// *********************************************************************//
  IPortableDeviceService = interface(IUnknown)
    ['{D3BD3A44-D7B5-40A9-98B7-2FA4D01DEC08}']
    function Open(pszPnPServiceID: PWideChar; const pClientInfo: IPortableDeviceValues): HResult; stdcall;
    function Capabilities(out ppCapabilities: IPortableDeviceServiceCapabilities): HResult; stdcall;
    function Content(out ppContent: IPortableDeviceContent2): HResult; stdcall;
    function Methods(out ppMethods: IPortableDeviceServiceMethods): HResult; stdcall;
    function Cancel: HResult; stdcall;
    function Close: HResult; stdcall;
    function GetServiceObjectID(out ppszServiceObjectID: PWideChar): HResult; stdcall;
    function GetPnPServiceID(out ppszPnPServiceID: PWideChar): HResult; stdcall;
    function Advise(dwFlags: LongWord; const pCallback: IPortableDeviceEventCallback; 
                    const pParameters: IPortableDeviceValues; out ppszCookie: PWideChar): HResult; stdcall;
    function Unadvise(pszCookie: PWideChar): HResult; stdcall;
    function SendCommand(dwFlags: LongWord; const pParameters: IPortableDeviceValues; 
                         out ppResults: IPortableDeviceValues): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IPortableDeviceServiceCapabilities
// Flags:     (0)
// GUID:      {24DBD89D-413E-43E0-BD5B-197F3C56C886}
// *********************************************************************//
  IPortableDeviceServiceCapabilities = interface(IUnknown)
    ['{24DBD89D-413E-43E0-BD5B-197F3C56C886}']
    function GetSupportedMethods(out ppMethods: IPortableDevicePropVariantCollection): HResult; stdcall;
    function GetSupportedMethodsByFormat(var Format: TGUID; 
                                         out ppMethods: IPortableDevicePropVariantCollection): HResult; stdcall;
    function GetMethodAttributes(var Method: TGUID; out ppAttributes: IPortableDeviceValues): HResult; stdcall;
    function GetMethodParameterAttributes(var Method: TGUID; var Parameter: _tagpropertykey; 
                                          out ppAttributes: IPortableDeviceValues): HResult; stdcall;
    function GetSupportedFormats(out ppFormats: IPortableDevicePropVariantCollection): HResult; stdcall;
    function GetFormatAttributes(var Format: TGUID; out ppAttributes: IPortableDeviceValues): HResult; stdcall;
    function GetSupportedFormatProperties(var Format: TGUID; 
                                          out ppKeys: IPortableDeviceKeyCollection): HResult; stdcall;
    function GetFormatPropertyAttributes(var Format: TGUID; var Property_: _tagpropertykey; 
                                         out ppAttributes: IPortableDeviceValues): HResult; stdcall;
    function GetSupportedEvents(out ppEvents: IPortableDevicePropVariantCollection): HResult; stdcall;
    function GetEventAttributes(var Event: TGUID; out ppAttributes: IPortableDeviceValues): HResult; stdcall;
    function GetEventParameterAttributes(var Event: TGUID; var Parameter: _tagpropertykey; 
                                         out ppAttributes: IPortableDeviceValues): HResult; stdcall;
    function GetInheritedServices(dwInheritanceType: LongWord; 
                                  out ppServices: IPortableDevicePropVariantCollection): HResult; stdcall;
    function GetFormatRenderingProfiles(var Format: TGUID; 
                                        out ppRenderingProfiles: IPortableDeviceValuesCollection): HResult; stdcall;
    function GetSupportedCommands(out ppCommands: IPortableDeviceKeyCollection): HResult; stdcall;
    function GetCommandOptions(var Command: _tagpropertykey; out ppOptions: IPortableDeviceValues): HResult; stdcall;
    function Cancel: HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IPortableDeviceContent2
// Flags:     (0)
// GUID:      {9B4ADD96-F6BF-4034-8708-ECA72BF10554}
// *********************************************************************//
  IPortableDeviceContent2 = interface(IPortableDeviceContent)
    ['{9B4ADD96-F6BF-4034-8708-ECA72BF10554}']
    function UpdateObjectWithPropertiesAndData(pszObjectID: PWideChar; 
                                               const pProperties: IPortableDeviceValues; 
                                               out ppData: IStream; 
                                               var pdwOptimalWriteBufferSize: LongWord): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IPortableDeviceServiceMethods
// Flags:     (0)
// GUID:      {E20333C9-FD34-412D-A381-CC6F2D820DF7}
// *********************************************************************//
  IPortableDeviceServiceMethods = interface(IUnknown)
    ['{E20333C9-FD34-412D-A381-CC6F2D820DF7}']
    function Invoke(var Method: TGUID; const pParameters: IPortableDeviceValues; 
                    var ppResults: IPortableDeviceValues): HResult; stdcall;
    function InvokeAsync(var Method: TGUID; const pParameters: IPortableDeviceValues; 
                         const pCallback: IPortableDeviceServiceMethodCallback): HResult; stdcall;
    function Cancel(const pCallback: IPortableDeviceServiceMethodCallback): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IPortableDeviceServiceMethodCallback
// Flags:     (0)
// GUID:      {C424233C-AFCE-4828-A756-7ED7A2350083}
// *********************************************************************//
  IPortableDeviceServiceMethodCallback = interface(IUnknown)
    ['{C424233C-AFCE-4828-A756-7ED7A2350083}']
    function OnComplete(hrStatus: HResult; const pResults: IPortableDeviceValues): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IPortableDeviceDispatchFactory
// Flags:     (0)
// GUID:      {5E1EAFC3-E3D7-4132-96FA-759C0F9D1E0F}
// *********************************************************************//
  IPortableDeviceDispatchFactory = interface(IUnknown)
    ['{5E1EAFC3-E3D7-4132-96FA-759C0F9D1E0F}']
    function GetDeviceDispatch(pszPnPDeviceID: PWideChar; out ppDeviceDispatch: IDispatch): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IPortableDeviceWebControl
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {94FC7953-5CA1-483A-8AEE-DF52E7747D00}
// *********************************************************************//
  IPortableDeviceWebControl = interface(IDispatch)
    ['{94FC7953-5CA1-483A-8AEE-DF52E7747D00}']
    function GetDeviceFromId(const deviceId: WideString): IDispatch; safecall;
    procedure GetDeviceFromIdAsync(const deviceId: WideString; const pCompletionHandler: IDispatch; 
                                   const pErrorHandler: IDispatch); safecall;
  end;

// *********************************************************************//
// DispIntf:  IPortableDeviceWebControlDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {94FC7953-5CA1-483A-8AEE-DF52E7747D00}
// *********************************************************************//
  IPortableDeviceWebControlDisp = dispinterface
    ['{94FC7953-5CA1-483A-8AEE-DF52E7747D00}']
    function GetDeviceFromId(const deviceId: WideString): IDispatch; dispid 1;
    procedure GetDeviceFromIdAsync(const deviceId: WideString; const pCompletionHandler: IDispatch; 
                                   const pErrorHandler: IDispatch); dispid 2;
  end;

// *********************************************************************//
// The Class CoPortableDevice provides a Create and CreateRemote method to          
// create instances of the default interface IPortableDevice exposed by              
// the CoClass PortableDevice. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPortableDevice = class
    class function Create: IPortableDevice;
    class function CreateRemote(const MachineName: string): IPortableDevice;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TPortableDevice
// Help String      : PortableDevice Class
// Default Interface: IPortableDevice
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TPortableDeviceProperties= class;
{$ENDIF}
  TPortableDevice = class(TOleServer)
  private
    FIntf: IPortableDevice;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TPortableDeviceProperties;
    function GetServerProperties: TPortableDeviceProperties;
{$ENDIF}
    function GetDefaultInterface: IPortableDevice;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IPortableDevice);
    procedure Disconnect; override;
    function Open(pszPnPDeviceID: PWideChar; const pClientInfo: IPortableDeviceValues): HResult;
    function SendCommand(dwFlags: LongWord; const pParameters: IPortableDeviceValues; 
                         out ppResults: IPortableDeviceValues): HResult;
    function Content(out ppContent: IPortableDeviceContent): HResult;
    function Capabilities(out ppCapabilities: IPortableDeviceCapabilities): HResult;
    function Cancel: HResult;
    function Close: HResult;
    function Advise(dwFlags: LongWord; const pCallback: IPortableDeviceEventCallback; 
                    const pParameters: IPortableDeviceValues; out ppszCookie: PWideChar): HResult;
    function Unadvise(pszCookie: PWideChar): HResult;
    function GetPnPDeviceID(out ppszPnPDeviceID: PWideChar): HResult;
    property DefaultInterface: IPortableDevice read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TPortableDeviceProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TPortableDevice
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TPortableDeviceProperties = class(TPersistent)
  private
    FServer:    TPortableDevice;
    function    GetDefaultInterface: IPortableDevice;
    constructor Create(AServer: TPortableDevice);
  protected
  public
    property DefaultInterface: IPortableDevice read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoPortableDeviceManager provides a Create and CreateRemote method to          
// create instances of the default interface IPortableDeviceManager exposed by              
// the CoClass PortableDeviceManager. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPortableDeviceManager = class
    class function Create: IPortableDeviceManager;
    class function CreateRemote(const MachineName: string): IPortableDeviceManager;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TPortableDeviceManager
// Help String      : PortableDeviceManager Class
// Default Interface: IPortableDeviceManager
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TPortableDeviceManagerProperties= class;
{$ENDIF}
  TPortableDeviceManager = class(TOleServer)
  private
    FIntf: IPortableDeviceManager;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TPortableDeviceManagerProperties;
    function GetServerProperties: TPortableDeviceManagerProperties;
{$ENDIF}
    function GetDefaultInterface: IPortableDeviceManager;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IPortableDeviceManager);
    procedure Disconnect; override;
    function GetDevices(var pPnPDeviceIDs: PWideChar; var pcPnPDeviceIDs: LongWord): HResult;
    function RefreshDeviceList: HResult;
    function GetDeviceFriendlyName(pszPnPDeviceID: PWideChar; var pDeviceFriendlyName: Word; 
                                   var pcchDeviceFriendlyName: LongWord): HResult;
    function GetDeviceDescription(pszPnPDeviceID: PWideChar; var pDeviceDescription: Word; 
                                  var pcchDeviceDescription: LongWord): HResult;
    function GetDeviceManufacturer(pszPnPDeviceID: PWideChar; var pDeviceManufacturer: Word; 
                                   var pcchDeviceManufacturer: LongWord): HResult;
    function GetDeviceProperty(pszPnPDeviceID: PWideChar; pszDevicePropertyName: PWideChar; 
                               var pData: Byte; var pcbData: LongWord; var pdwType: LongWord): HResult;
    function GetPrivateDevices(var pPnPDeviceIDs: PWideChar; var pcPnPDeviceIDs: LongWord): HResult;
    property DefaultInterface: IPortableDeviceManager read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TPortableDeviceManagerProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TPortableDeviceManager
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TPortableDeviceManagerProperties = class(TPersistent)
  private
    FServer:    TPortableDeviceManager;
    function    GetDefaultInterface: IPortableDeviceManager;
    constructor Create(AServer: TPortableDeviceManager);
  protected
  public
    property DefaultInterface: IPortableDeviceManager read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoPortableDeviceService provides a Create and CreateRemote method to          
// create instances of the default interface IPortableDeviceService exposed by              
// the CoClass PortableDeviceService. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPortableDeviceService = class
    class function Create: IPortableDeviceService;
    class function CreateRemote(const MachineName: string): IPortableDeviceService;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TPortableDeviceService
// Help String      : PortableDeviceService Class
// Default Interface: IPortableDeviceService
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TPortableDeviceServiceProperties= class;
{$ENDIF}
  TPortableDeviceService = class(TOleServer)
  private
    FIntf: IPortableDeviceService;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TPortableDeviceServiceProperties;
    function GetServerProperties: TPortableDeviceServiceProperties;
{$ENDIF}
    function GetDefaultInterface: IPortableDeviceService;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IPortableDeviceService);
    procedure Disconnect; override;
    function Open(pszPnPServiceID: PWideChar; const pClientInfo: IPortableDeviceValues): HResult;
    function Capabilities(out ppCapabilities: IPortableDeviceServiceCapabilities): HResult;
    function Content(out ppContent: IPortableDeviceContent2): HResult;
    function Methods(out ppMethods: IPortableDeviceServiceMethods): HResult;
    function Cancel: HResult;
    function Close: HResult;
    function GetServiceObjectID(out ppszServiceObjectID: PWideChar): HResult;
    function GetPnPServiceID(out ppszPnPServiceID: PWideChar): HResult;
    function Advise(dwFlags: LongWord; const pCallback: IPortableDeviceEventCallback; 
                    const pParameters: IPortableDeviceValues; out ppszCookie: PWideChar): HResult;
    function Unadvise(pszCookie: PWideChar): HResult;
    function SendCommand(dwFlags: LongWord; const pParameters: IPortableDeviceValues; 
                         out ppResults: IPortableDeviceValues): HResult;
    property DefaultInterface: IPortableDeviceService read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TPortableDeviceServiceProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TPortableDeviceService
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TPortableDeviceServiceProperties = class(TPersistent)
  private
    FServer:    TPortableDeviceService;
    function    GetDefaultInterface: IPortableDeviceService;
    constructor Create(AServer: TPortableDeviceService);
  protected
  public
    property DefaultInterface: IPortableDeviceService read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoPortableDeviceDispatchFactory provides a Create and CreateRemote method to          
// create instances of the default interface IPortableDeviceDispatchFactory exposed by              
// the CoClass PortableDeviceDispatchFactory. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPortableDeviceDispatchFactory = class
    class function Create: IPortableDeviceDispatchFactory;
    class function CreateRemote(const MachineName: string): IPortableDeviceDispatchFactory;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TPortableDeviceDispatchFactory
// Help String      : PortableDeviceDispatchFactory Class
// Default Interface: IPortableDeviceDispatchFactory
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TPortableDeviceDispatchFactoryProperties= class;
{$ENDIF}
  TPortableDeviceDispatchFactory = class(TOleServer)
  private
    FIntf: IPortableDeviceDispatchFactory;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TPortableDeviceDispatchFactoryProperties;
    function GetServerProperties: TPortableDeviceDispatchFactoryProperties;
{$ENDIF}
    function GetDefaultInterface: IPortableDeviceDispatchFactory;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IPortableDeviceDispatchFactory);
    procedure Disconnect; override;
    function GetDeviceDispatch(pszPnPDeviceID: PWideChar; out ppDeviceDispatch: IDispatch): HResult;
    property DefaultInterface: IPortableDeviceDispatchFactory read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TPortableDeviceDispatchFactoryProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TPortableDeviceDispatchFactory
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TPortableDeviceDispatchFactoryProperties = class(TPersistent)
  private
    FServer:    TPortableDeviceDispatchFactory;
    function    GetDefaultInterface: IPortableDeviceDispatchFactory;
    constructor Create(AServer: TPortableDeviceDispatchFactory);
  protected
  public
    property DefaultInterface: IPortableDeviceDispatchFactory read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoPortableDeviceFTM provides a Create and CreateRemote method to          
// create instances of the default interface IPortableDevice exposed by              
// the CoClass PortableDeviceFTM. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPortableDeviceFTM = class
    class function Create: IPortableDevice;
    class function CreateRemote(const MachineName: string): IPortableDevice;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TPortableDeviceFTM
// Help String      : PortableDeviceFTM Class
// Default Interface: IPortableDevice
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TPortableDeviceFTMProperties= class;
{$ENDIF}
  TPortableDeviceFTM = class(TOleServer)
  private
    FIntf: IPortableDevice;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TPortableDeviceFTMProperties;
    function GetServerProperties: TPortableDeviceFTMProperties;
{$ENDIF}
    function GetDefaultInterface: IPortableDevice;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IPortableDevice);
    procedure Disconnect; override;
    function Open(pszPnPDeviceID: PWideChar; const pClientInfo: IPortableDeviceValues): HResult;
    function SendCommand(dwFlags: LongWord; const pParameters: IPortableDeviceValues; 
                         out ppResults: IPortableDeviceValues): HResult;
    function Content(out ppContent: IPortableDeviceContent): HResult;
    function Capabilities(out ppCapabilities: IPortableDeviceCapabilities): HResult;
    function Cancel: HResult;
    function Close: HResult;
    function Advise(dwFlags: LongWord; const pCallback: IPortableDeviceEventCallback; 
                    const pParameters: IPortableDeviceValues; out ppszCookie: PWideChar): HResult;
    function Unadvise(pszCookie: PWideChar): HResult;
    function GetPnPDeviceID(out ppszPnPDeviceID: PWideChar): HResult;
    property DefaultInterface: IPortableDevice read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TPortableDeviceFTMProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TPortableDeviceFTM
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TPortableDeviceFTMProperties = class(TPersistent)
  private
    FServer:    TPortableDeviceFTM;
    function    GetDefaultInterface: IPortableDevice;
    constructor Create(AServer: TPortableDeviceFTM);
  protected
  public
    property DefaultInterface: IPortableDevice read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoPortableDeviceServiceFTM provides a Create and CreateRemote method to          
// create instances of the default interface IPortableDeviceService exposed by              
// the CoClass PortableDeviceServiceFTM. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPortableDeviceServiceFTM = class
    class function Create: IPortableDeviceService;
    class function CreateRemote(const MachineName: string): IPortableDeviceService;
  end;

// *********************************************************************//
// The Class CoPortableDeviceWebControl provides a Create and CreateRemote method to          
// create instances of the default interface IPortableDeviceWebControl exposed by              
// the CoClass PortableDeviceWebControl. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPortableDeviceWebControl = class
    class function Create: IPortableDeviceWebControl;
    class function CreateRemote(const MachineName: string): IPortableDeviceWebControl;
  end;
// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TPortableDeviceServiceFTM
// Help String      : PortableDeviceServiceFTM Class
// Default Interface: IPortableDeviceService
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TPortableDeviceServiceFTMProperties= class;
{$ENDIF}
  TPortableDeviceServiceFTM = class(TOleServer)
  private
    FIntf: IPortableDeviceService;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TPortableDeviceServiceFTMProperties;
    function GetServerProperties: TPortableDeviceServiceFTMProperties;
{$ENDIF}
    function GetDefaultInterface: IPortableDeviceService;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IPortableDeviceService);
    procedure Disconnect; override;
    function Open(pszPnPServiceID: PWideChar; const pClientInfo: IPortableDeviceValues): HResult;
    function Capabilities(out ppCapabilities: IPortableDeviceServiceCapabilities): HResult;
    function Content(out ppContent: IPortableDeviceContent2): HResult;
    function Methods(out ppMethods: IPortableDeviceServiceMethods): HResult;
    function Cancel: HResult;
    function Close: HResult;
    function GetServiceObjectID(out ppszServiceObjectID: PWideChar): HResult;
    function GetPnPServiceID(out ppszPnPServiceID: PWideChar): HResult;
    function Advise(dwFlags: LongWord; const pCallback: IPortableDeviceEventCallback; 
                    const pParameters: IPortableDeviceValues; out ppszCookie: PWideChar): HResult;
    function Unadvise(pszCookie: PWideChar): HResult;
    function SendCommand(dwFlags: LongWord; const pParameters: IPortableDeviceValues; 
                         out ppResults: IPortableDeviceValues): HResult;
    property DefaultInterface: IPortableDeviceService read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TPortableDeviceServiceFTMProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TPortableDeviceServiceFTM
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TPortableDeviceServiceFTMProperties = class(TPersistent)
  private
    FServer:    TPortableDeviceServiceFTM;
    function    GetDefaultInterface: IPortableDeviceService;
    constructor Create(AServer: TPortableDeviceServiceFTM);
  protected
  public
    property DefaultInterface: IPortableDeviceService read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = '(none)';

  dtlOcxPage = '(none)';

implementation

uses System.Win.ComObj;

class function CoPortableDevice.Create: IPortableDevice;
begin
  Result := CreateComObject(CLASS_PortableDevice) as IPortableDevice;
end;

class function CoPortableDevice.CreateRemote(const MachineName: string): IPortableDevice;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_PortableDevice) as IPortableDevice;
end;

procedure TPortableDevice.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{728A21C5-3D9E-48D7-9810-864848F0F404}';
    IntfIID:   '{625E2DF8-6392-4CF0-9AD1-3CFA5F17775C}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TPortableDevice.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IPortableDevice;
  end;
end;

procedure TPortableDevice.ConnectTo(svrIntf: IPortableDevice);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TPortableDevice.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TPortableDevice.GetDefaultInterface: IPortableDevice;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TPortableDevice.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TPortableDeviceProperties.Create(Self);
{$ENDIF}
end;

destructor TPortableDevice.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TPortableDevice.GetServerProperties: TPortableDeviceProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TPortableDevice.Open(pszPnPDeviceID: PWideChar; const pClientInfo: IPortableDeviceValues): HResult;
begin
  Result := DefaultInterface.Open(pszPnPDeviceID, pClientInfo);
end;

function TPortableDevice.SendCommand(dwFlags: LongWord; const pParameters: IPortableDeviceValues; 
                                     out ppResults: IPortableDeviceValues): HResult;
begin
  Result := DefaultInterface.SendCommand(dwFlags, pParameters, ppResults);
end;

function TPortableDevice.Content(out ppContent: IPortableDeviceContent): HResult;
begin
  Result := DefaultInterface.Content(ppContent);
end;

function TPortableDevice.Capabilities(out ppCapabilities: IPortableDeviceCapabilities): HResult;
begin
  Result := DefaultInterface.Capabilities(ppCapabilities);
end;

function TPortableDevice.Cancel: HResult;
begin
  Result := DefaultInterface.Cancel;
end;

function TPortableDevice.Close: HResult;
begin
  Result := DefaultInterface.Close;
end;

function TPortableDevice.Advise(dwFlags: LongWord; const pCallback: IPortableDeviceEventCallback; 
                                const pParameters: IPortableDeviceValues; out ppszCookie: PWideChar): HResult;
begin
  Result := DefaultInterface.Advise(dwFlags, pCallback, pParameters, ppszCookie);
end;

function TPortableDevice.Unadvise(pszCookie: PWideChar): HResult;
begin
  Result := DefaultInterface.Unadvise(pszCookie);
end;

function TPortableDevice.GetPnPDeviceID(out ppszPnPDeviceID: PWideChar): HResult;
begin
  Result := DefaultInterface.GetPnPDeviceID(ppszPnPDeviceID);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TPortableDeviceProperties.Create(AServer: TPortableDevice);
begin
  inherited Create;
  FServer := AServer;
end;

function TPortableDeviceProperties.GetDefaultInterface: IPortableDevice;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoPortableDeviceManager.Create: IPortableDeviceManager;
begin
  Result := CreateComObject(CLASS_PortableDeviceManager) as IPortableDeviceManager;
end;

class function CoPortableDeviceManager.CreateRemote(const MachineName: string): IPortableDeviceManager;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_PortableDeviceManager) as IPortableDeviceManager;
end;

procedure TPortableDeviceManager.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{0AF10CEC-2ECD-4B92-9581-34F6AE0637F3}';
    IntfIID:   '{A1567595-4C2F-4574-A6FA-ECEF917B9A40}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TPortableDeviceManager.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IPortableDeviceManager;
  end;
end;

procedure TPortableDeviceManager.ConnectTo(svrIntf: IPortableDeviceManager);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TPortableDeviceManager.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TPortableDeviceManager.GetDefaultInterface: IPortableDeviceManager;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TPortableDeviceManager.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TPortableDeviceManagerProperties.Create(Self);
{$ENDIF}
end;

destructor TPortableDeviceManager.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TPortableDeviceManager.GetServerProperties: TPortableDeviceManagerProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TPortableDeviceManager.GetDevices(var pPnPDeviceIDs: PWideChar; 
                                           var pcPnPDeviceIDs: LongWord): HResult;
begin
  Result := DefaultInterface.GetDevices(pPnPDeviceIDs, pcPnPDeviceIDs);
end;

function TPortableDeviceManager.RefreshDeviceList: HResult;
begin
  Result := DefaultInterface.RefreshDeviceList;
end;

function TPortableDeviceManager.GetDeviceFriendlyName(pszPnPDeviceID: PWideChar; 
                                                      var pDeviceFriendlyName: Word; 
                                                      var pcchDeviceFriendlyName: LongWord): HResult;
begin
  Result := DefaultInterface.GetDeviceFriendlyName(pszPnPDeviceID, pDeviceFriendlyName, 
                                                   pcchDeviceFriendlyName);
end;

function TPortableDeviceManager.GetDeviceDescription(pszPnPDeviceID: PWideChar; 
                                                     var pDeviceDescription: Word; 
                                                     var pcchDeviceDescription: LongWord): HResult;
begin
  Result := DefaultInterface.GetDeviceDescription(pszPnPDeviceID, pDeviceDescription, 
                                                  pcchDeviceDescription);
end;

function TPortableDeviceManager.GetDeviceManufacturer(pszPnPDeviceID: PWideChar; 
                                                      var pDeviceManufacturer: Word; 
                                                      var pcchDeviceManufacturer: LongWord): HResult;
begin
  Result := DefaultInterface.GetDeviceManufacturer(pszPnPDeviceID, pDeviceManufacturer, 
                                                   pcchDeviceManufacturer);
end;

function TPortableDeviceManager.GetDeviceProperty(pszPnPDeviceID: PWideChar; 
                                                  pszDevicePropertyName: PWideChar; 
                                                  var pData: Byte; var pcbData: LongWord; 
                                                  var pdwType: LongWord): HResult;
begin
  Result := DefaultInterface.GetDeviceProperty(pszPnPDeviceID, pszDevicePropertyName, pData, 
                                               pcbData, pdwType);
end;

function TPortableDeviceManager.GetPrivateDevices(var pPnPDeviceIDs: PWideChar; 
                                                  var pcPnPDeviceIDs: LongWord): HResult;
begin
  Result := DefaultInterface.GetPrivateDevices(pPnPDeviceIDs, pcPnPDeviceIDs);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TPortableDeviceManagerProperties.Create(AServer: TPortableDeviceManager);
begin
  inherited Create;
  FServer := AServer;
end;

function TPortableDeviceManagerProperties.GetDefaultInterface: IPortableDeviceManager;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoPortableDeviceService.Create: IPortableDeviceService;
begin
  Result := CreateComObject(CLASS_PortableDeviceService) as IPortableDeviceService;
end;

class function CoPortableDeviceService.CreateRemote(const MachineName: string): IPortableDeviceService;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_PortableDeviceService) as IPortableDeviceService;
end;

procedure TPortableDeviceService.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{EF5DB4C2-9312-422C-9152-411CD9C4DD84}';
    IntfIID:   '{D3BD3A44-D7B5-40A9-98B7-2FA4D01DEC08}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TPortableDeviceService.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IPortableDeviceService;
  end;
end;

procedure TPortableDeviceService.ConnectTo(svrIntf: IPortableDeviceService);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TPortableDeviceService.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TPortableDeviceService.GetDefaultInterface: IPortableDeviceService;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TPortableDeviceService.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TPortableDeviceServiceProperties.Create(Self);
{$ENDIF}
end;

destructor TPortableDeviceService.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TPortableDeviceService.GetServerProperties: TPortableDeviceServiceProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TPortableDeviceService.Open(pszPnPServiceID: PWideChar; 
                                     const pClientInfo: IPortableDeviceValues): HResult;
begin
  Result := DefaultInterface.Open(pszPnPServiceID, pClientInfo);
end;

function TPortableDeviceService.Capabilities(out ppCapabilities: IPortableDeviceServiceCapabilities): HResult;
begin
  Result := DefaultInterface.Capabilities(ppCapabilities);
end;

function TPortableDeviceService.Content(out ppContent: IPortableDeviceContent2): HResult;
begin
  Result := DefaultInterface.Content(ppContent);
end;

function TPortableDeviceService.Methods(out ppMethods: IPortableDeviceServiceMethods): HResult;
begin
  Result := DefaultInterface.Methods(ppMethods);
end;

function TPortableDeviceService.Cancel: HResult;
begin
  Result := DefaultInterface.Cancel;
end;

function TPortableDeviceService.Close: HResult;
begin
  Result := DefaultInterface.Close;
end;

function TPortableDeviceService.GetServiceObjectID(out ppszServiceObjectID: PWideChar): HResult;
begin
  Result := DefaultInterface.GetServiceObjectID(ppszServiceObjectID);
end;

function TPortableDeviceService.GetPnPServiceID(out ppszPnPServiceID: PWideChar): HResult;
begin
  Result := DefaultInterface.GetPnPServiceID(ppszPnPServiceID);
end;

function TPortableDeviceService.Advise(dwFlags: LongWord; 
                                       const pCallback: IPortableDeviceEventCallback; 
                                       const pParameters: IPortableDeviceValues; 
                                       out ppszCookie: PWideChar): HResult;
begin
  Result := DefaultInterface.Advise(dwFlags, pCallback, pParameters, ppszCookie);
end;

function TPortableDeviceService.Unadvise(pszCookie: PWideChar): HResult;
begin
  Result := DefaultInterface.Unadvise(pszCookie);
end;

function TPortableDeviceService.SendCommand(dwFlags: LongWord; 
                                            const pParameters: IPortableDeviceValues; 
                                            out ppResults: IPortableDeviceValues): HResult;
begin
  Result := DefaultInterface.SendCommand(dwFlags, pParameters, ppResults);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TPortableDeviceServiceProperties.Create(AServer: TPortableDeviceService);
begin
  inherited Create;
  FServer := AServer;
end;

function TPortableDeviceServiceProperties.GetDefaultInterface: IPortableDeviceService;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoPortableDeviceDispatchFactory.Create: IPortableDeviceDispatchFactory;
begin
  Result := CreateComObject(CLASS_PortableDeviceDispatchFactory) as IPortableDeviceDispatchFactory;
end;

class function CoPortableDeviceDispatchFactory.CreateRemote(const MachineName: string): IPortableDeviceDispatchFactory;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_PortableDeviceDispatchFactory) as IPortableDeviceDispatchFactory;
end;

procedure TPortableDeviceDispatchFactory.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{43232233-8338-4658-AE01-0B4AE830B6B0}';
    IntfIID:   '{5E1EAFC3-E3D7-4132-96FA-759C0F9D1E0F}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TPortableDeviceDispatchFactory.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IPortableDeviceDispatchFactory;
  end;
end;

procedure TPortableDeviceDispatchFactory.ConnectTo(svrIntf: IPortableDeviceDispatchFactory);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TPortableDeviceDispatchFactory.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TPortableDeviceDispatchFactory.GetDefaultInterface: IPortableDeviceDispatchFactory;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TPortableDeviceDispatchFactory.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TPortableDeviceDispatchFactoryProperties.Create(Self);
{$ENDIF}
end;

destructor TPortableDeviceDispatchFactory.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TPortableDeviceDispatchFactory.GetServerProperties: TPortableDeviceDispatchFactoryProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TPortableDeviceDispatchFactory.GetDeviceDispatch(pszPnPDeviceID: PWideChar; 
                                                          out ppDeviceDispatch: IDispatch): HResult;
begin
  Result := DefaultInterface.GetDeviceDispatch(pszPnPDeviceID, ppDeviceDispatch);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TPortableDeviceDispatchFactoryProperties.Create(AServer: TPortableDeviceDispatchFactory);
begin
  inherited Create;
  FServer := AServer;
end;

function TPortableDeviceDispatchFactoryProperties.GetDefaultInterface: IPortableDeviceDispatchFactory;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoPortableDeviceFTM.Create: IPortableDevice;
begin
  Result := CreateComObject(CLASS_PortableDeviceFTM) as IPortableDevice;
end;

class function CoPortableDeviceFTM.CreateRemote(const MachineName: string): IPortableDevice;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_PortableDeviceFTM) as IPortableDevice;
end;

procedure TPortableDeviceFTM.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{F7C0039A-4762-488A-B4B3-760EF9A1BA9B}';
    IntfIID:   '{625E2DF8-6392-4CF0-9AD1-3CFA5F17775C}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TPortableDeviceFTM.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IPortableDevice;
  end;
end;

procedure TPortableDeviceFTM.ConnectTo(svrIntf: IPortableDevice);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TPortableDeviceFTM.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TPortableDeviceFTM.GetDefaultInterface: IPortableDevice;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TPortableDeviceFTM.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TPortableDeviceFTMProperties.Create(Self);
{$ENDIF}
end;

destructor TPortableDeviceFTM.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TPortableDeviceFTM.GetServerProperties: TPortableDeviceFTMProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TPortableDeviceFTM.Open(pszPnPDeviceID: PWideChar; const pClientInfo: IPortableDeviceValues): HResult;
begin
  Result := DefaultInterface.Open(pszPnPDeviceID, pClientInfo);
end;

function TPortableDeviceFTM.SendCommand(dwFlags: LongWord; 
                                        const pParameters: IPortableDeviceValues; 
                                        out ppResults: IPortableDeviceValues): HResult;
begin
  Result := DefaultInterface.SendCommand(dwFlags, pParameters, ppResults);
end;

function TPortableDeviceFTM.Content(out ppContent: IPortableDeviceContent): HResult;
begin
  Result := DefaultInterface.Content(ppContent);
end;

function TPortableDeviceFTM.Capabilities(out ppCapabilities: IPortableDeviceCapabilities): HResult;
begin
  Result := DefaultInterface.Capabilities(ppCapabilities);
end;

function TPortableDeviceFTM.Cancel: HResult;
begin
  Result := DefaultInterface.Cancel;
end;

function TPortableDeviceFTM.Close: HResult;
begin
  Result := DefaultInterface.Close;
end;

function TPortableDeviceFTM.Advise(dwFlags: LongWord; 
                                   const pCallback: IPortableDeviceEventCallback; 
                                   const pParameters: IPortableDeviceValues; 
                                   out ppszCookie: PWideChar): HResult;
begin
  Result := DefaultInterface.Advise(dwFlags, pCallback, pParameters, ppszCookie);
end;

function TPortableDeviceFTM.Unadvise(pszCookie: PWideChar): HResult;
begin
  Result := DefaultInterface.Unadvise(pszCookie);
end;

function TPortableDeviceFTM.GetPnPDeviceID(out ppszPnPDeviceID: PWideChar): HResult;
begin
  Result := DefaultInterface.GetPnPDeviceID(ppszPnPDeviceID);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TPortableDeviceFTMProperties.Create(AServer: TPortableDeviceFTM);
begin
  inherited Create;
  FServer := AServer;
end;

function TPortableDeviceFTMProperties.GetDefaultInterface: IPortableDevice;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoPortableDeviceServiceFTM.Create: IPortableDeviceService;
begin
  Result := CreateComObject(CLASS_PortableDeviceServiceFTM) as IPortableDeviceService;
end;

class function CoPortableDeviceServiceFTM.CreateRemote(const MachineName: string): IPortableDeviceService;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_PortableDeviceServiceFTM) as IPortableDeviceService;
end;

procedure TPortableDeviceServiceFTM.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{1649B154-C794-497A-9B03-F3F0121302F3}';
    IntfIID:   '{D3BD3A44-D7B5-40A9-98B7-2FA4D01DEC08}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TPortableDeviceServiceFTM.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IPortableDeviceService;
  end;
end;

procedure TPortableDeviceServiceFTM.ConnectTo(svrIntf: IPortableDeviceService);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TPortableDeviceServiceFTM.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TPortableDeviceServiceFTM.GetDefaultInterface: IPortableDeviceService;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TPortableDeviceServiceFTM.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TPortableDeviceServiceFTMProperties.Create(Self);
{$ENDIF}
end;

destructor TPortableDeviceServiceFTM.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TPortableDeviceServiceFTM.GetServerProperties: TPortableDeviceServiceFTMProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TPortableDeviceServiceFTM.Open(pszPnPServiceID: PWideChar; 
                                        const pClientInfo: IPortableDeviceValues): HResult;
begin
  Result := DefaultInterface.Open(pszPnPServiceID, pClientInfo);
end;

function TPortableDeviceServiceFTM.Capabilities(out ppCapabilities: IPortableDeviceServiceCapabilities): HResult;
begin
  Result := DefaultInterface.Capabilities(ppCapabilities);
end;

function TPortableDeviceServiceFTM.Content(out ppContent: IPortableDeviceContent2): HResult;
begin
  Result := DefaultInterface.Content(ppContent);
end;

function TPortableDeviceServiceFTM.Methods(out ppMethods: IPortableDeviceServiceMethods): HResult;
begin
  Result := DefaultInterface.Methods(ppMethods);
end;

function TPortableDeviceServiceFTM.Cancel: HResult;
begin
  Result := DefaultInterface.Cancel;
end;

function TPortableDeviceServiceFTM.Close: HResult;
begin
  Result := DefaultInterface.Close;
end;

function TPortableDeviceServiceFTM.GetServiceObjectID(out ppszServiceObjectID: PWideChar): HResult;
begin
  Result := DefaultInterface.GetServiceObjectID(ppszServiceObjectID);
end;

function TPortableDeviceServiceFTM.GetPnPServiceID(out ppszPnPServiceID: PWideChar): HResult;
begin
  Result := DefaultInterface.GetPnPServiceID(ppszPnPServiceID);
end;

function TPortableDeviceServiceFTM.Advise(dwFlags: LongWord; 
                                          const pCallback: IPortableDeviceEventCallback; 
                                          const pParameters: IPortableDeviceValues; 
                                          out ppszCookie: PWideChar): HResult;
begin
  Result := DefaultInterface.Advise(dwFlags, pCallback, pParameters, ppszCookie);
end;

function TPortableDeviceServiceFTM.Unadvise(pszCookie: PWideChar): HResult;
begin
  Result := DefaultInterface.Unadvise(pszCookie);
end;

function TPortableDeviceServiceFTM.SendCommand(dwFlags: LongWord; 
                                               const pParameters: IPortableDeviceValues; 
                                               out ppResults: IPortableDeviceValues): HResult;
begin
  Result := DefaultInterface.SendCommand(dwFlags, pParameters, ppResults);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TPortableDeviceServiceFTMProperties.Create(AServer: TPortableDeviceServiceFTM);
begin
  inherited Create;
  FServer := AServer;
end;

function TPortableDeviceServiceFTMProperties.GetDefaultInterface: IPortableDeviceService;
begin
  Result := CreateComObject(CLASS_PortableDeviceWebControl) as IPortableDeviceWebControl;
end;
{$ENDIF}

class function CoPortableDeviceWebControl.Create: IPortableDeviceWebControl;
begin
  Result := CreateComObject(CLASS_PortableDeviceWebControl) as IPortableDeviceWebControl;
end;

class function CoPortableDeviceWebControl.CreateRemote(const MachineName: string): IPortableDeviceWebControl;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_PortableDeviceWebControl) as IPortableDeviceWebControl;
end;

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TPortableDevice, TPortableDeviceManager, TPortableDeviceService, TPortableDeviceDispatchFactory, 
    TPortableDeviceFTM, TPortableDeviceServiceFTM]);
end;

end.
