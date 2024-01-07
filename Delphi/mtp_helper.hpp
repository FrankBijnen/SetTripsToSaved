﻿// CodeGear C++Builder
// Copyright (c) 1995, 2022 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'mtp_helper.pas' rev: 35.00 (Windows)

#ifndef Mtp_helperHPP
#define Mtp_helperHPP

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
#include <Winapi.ActiveX.hpp>
#include <System.Win.ComObj.hpp>
#include <Vcl.ComCtrls.hpp>
#include <PortableDeviceApiLib_TLB.hpp>

//-- user supplied -----------------------------------------------------------

namespace Mtp_helper
{
//-- forward type declarations -----------------------------------------------
//-- type declarations -------------------------------------------------------
typedef Portabledeviceapilib_tlb::_di_IPortableDevice IMTPDevice;

//-- var, const, procedure ---------------------------------------------------
extern DELPHI_PACKAGE System::WideString CLIENT_NAME;
static const System::Int8 CLIENT_MAJOR_VER = System::Int8(0x1);
static const System::Int8 CLIENT_MINOR_VER = System::Int8(0x0);
static const System::Int8 CLIENT_REVISION = System::Int8(0x0);
extern DELPHI_PACKAGE GUID CLASS_PortableDeviceValues;
extern DELPHI_PACKAGE GUID CLASS_PortableDevicePropVariantCollection;
extern DELPHI_PACKAGE GUID CLASS_PortableDeviceKeyCollection;
extern DELPHI_PACKAGE GUID CLASS_IPortableDeviceDataStream;
extern DELPHI_PACKAGE GUID GUID_DEVINTERFACE_WPD;
extern DELPHI_PACKAGE GUID GUID_DEVINTERFACE_WPD_PRIVATE;
extern DELPHI_PACKAGE GUID GUID_DEVINTERFACE_WPD_SERVICE;
extern DELPHI_PACKAGE GUID WPD_API_OPTIONS_V1;
extern DELPHI_PACKAGE GUID WPD_APPOINTMENT_OBJECT_PROPERTIES_V1;
extern DELPHI_PACKAGE GUID WPD_CATEGORY_CAPABILITIES;
extern DELPHI_PACKAGE GUID WPD_CATEGORY_COMMON;
extern DELPHI_PACKAGE GUID WPD_CATEGORY_DEVICE_HINTS;
extern DELPHI_PACKAGE GUID WPD_CATEGORY_MEDIA_CAPTURE;
extern DELPHI_PACKAGE GUID WPD_CATEGORY_NETWORK_CONFIGURATION;
extern DELPHI_PACKAGE GUID WPD_CATEGORY_NULL;
extern DELPHI_PACKAGE GUID WPD_CATEGORY_OBJECT_ENUMERATION;
extern DELPHI_PACKAGE GUID WPD_CATEGORY_OBJECT_MANAGEMENT;
extern DELPHI_PACKAGE GUID WPD_CATEGORY_OBJECT_PROPERTIES;
extern DELPHI_PACKAGE GUID WPD_CATEGORY_OBJECT_PROPERTIES_BULK;
extern DELPHI_PACKAGE GUID WPD_CATEGORY_OBJECT_RESOURCES;
extern DELPHI_PACKAGE GUID WPD_CATEGORY_SERVICE_CAPABILITIES;
extern DELPHI_PACKAGE GUID WPD_CATEGORY_SERVICE_COMMON;
extern DELPHI_PACKAGE GUID WPD_CATEGORY_SERVICE_METHODS;
extern DELPHI_PACKAGE GUID WPD_CATEGORY_SMS;
extern DELPHI_PACKAGE GUID WPD_CATEGORY_STILL_IMAGE_CAPTURE;
extern DELPHI_PACKAGE GUID WPD_CATEGORY_STORAGE;
extern DELPHI_PACKAGE GUID WPD_CLASS_EXTENSION_OPTIONS_V1;
extern DELPHI_PACKAGE GUID WPD_CLASS_EXTENSION_OPTIONS_V2;
extern DELPHI_PACKAGE GUID WPD_CLASS_EXTENSION_V1;
extern DELPHI_PACKAGE GUID WPD_CLASS_EXTENSION_V2;
extern DELPHI_PACKAGE GUID WPD_CLIENT_INFORMATION_PROPERTIES_V1;
extern DELPHI_PACKAGE GUID WPD_COMMON_INFORMATION_OBJECT_PROPERTIES_V1;
extern DELPHI_PACKAGE GUID WPD_PROPERTY_COMMON_COMMAND_CATEGORY;
extern DELPHI_PACKAGE GUID WPD_CONTACT_OBJECT_PROPERTIES_V1;
extern DELPHI_PACKAGE GUID WPD_CONTENT_TYPE_ALL;
extern DELPHI_PACKAGE GUID WPD_CONTENT_TYPE_APPOINTMENT;
extern DELPHI_PACKAGE GUID WPD_CONTENT_TYPE_AUDIO;
extern DELPHI_PACKAGE GUID WPD_CONTENT_TYPE_AUDIO_ALBUM;
extern DELPHI_PACKAGE GUID WPD_CONTENT_TYPE_CALENDAR;
extern DELPHI_PACKAGE GUID WPD_CONTENT_TYPE_CERTIFICATE;
extern DELPHI_PACKAGE GUID WPD_CONTENT_TYPE_CONTACT;
extern DELPHI_PACKAGE GUID WPD_CONTENT_TYPE_CONTACT_GROUP;
extern DELPHI_PACKAGE GUID WPD_CONTENT_TYPE_DOCUMENT;
extern DELPHI_PACKAGE GUID WPD_CONTENT_TYPE_EMAIL;
extern DELPHI_PACKAGE GUID WPD_CONTENT_TYPE_FUNCTIONAL_OBJECT;
extern DELPHI_PACKAGE GUID WPD_CONTENT_TYPE_GENERIC_FILE;
extern DELPHI_PACKAGE GUID WPD_CONTENT_TYPE_GENERIC_MESSAGE;
extern DELPHI_PACKAGE GUID WPD_CONTENT_TYPE_IMAGE;
extern DELPHI_PACKAGE GUID WPD_CONTENT_TYPE_IMAGE_ALBUM;
extern DELPHI_PACKAGE GUID WPD_CONTENT_TYPE_MEDIA_CAST;
extern DELPHI_PACKAGE GUID WPD_CONTENT_TYPE_MEMO;
extern DELPHI_PACKAGE GUID WPD_CONTENT_TYPE_MIXED_CONTENT_ALBUM;
extern DELPHI_PACKAGE GUID WPD_CONTENT_TYPE_NETWORK_ASSOCIATION;
extern DELPHI_PACKAGE GUID WPD_CONTENT_TYPE_PLAYLIST;
extern DELPHI_PACKAGE GUID WPD_CONTENT_TYPE_PROGRAM;
extern DELPHI_PACKAGE GUID WPD_CONTENT_TYPE_SECTION;
extern DELPHI_PACKAGE GUID WPD_CONTENT_TYPE_TASK;
extern DELPHI_PACKAGE GUID WPD_CONTENT_TYPE_TELEVISION;
extern DELPHI_PACKAGE GUID WPD_CONTENT_TYPE_UNSPECIFIED;
extern DELPHI_PACKAGE GUID WPD_CONTENT_TYPE_VIDEO;
extern DELPHI_PACKAGE GUID WPD_CONTENT_TYPE_VIDEO_ALBUM;
extern DELPHI_PACKAGE GUID WPD_CONTENT_TYPE_WIRELESS_PROFILE;
extern DELPHI_PACKAGE GUID WPD_CONTENT_TYPE_FOLDER;
extern DELPHI_PACKAGE GUID WPD_DEVICE_PROPERTIES_V1;
extern DELPHI_PACKAGE GUID WPD_DEVICE_PROPERTIES_V2;
extern DELPHI_PACKAGE GUID WPD_DOCUMENT_OBJECT_PROPERTIES_V1;
extern DELPHI_PACKAGE GUID WPD_EMAIL_OBJECT_PROPERTIES_V1;
extern DELPHI_PACKAGE GUID WPD_EVENT_ATTRIBUTES_V1;
extern DELPHI_PACKAGE GUID WPD_EVENT_DEVICE_CAPABILITIES_UPDATED;
extern DELPHI_PACKAGE GUID WPD_EVENT_DEVICE_REMOVED;
extern DELPHI_PACKAGE GUID WPD_EVENT_DEVICE_RESET;
extern DELPHI_PACKAGE GUID WPD_EVENT_OBJECT_ADDED;
extern DELPHI_PACKAGE GUID WPD_EVENT_OBJECT_REMOVED;
extern DELPHI_PACKAGE GUID WPD_EVENT_OBJECT_TRANSFER_REQUESTED;
extern DELPHI_PACKAGE GUID WPD_EVENT_OBJECT_UPDATED;
extern DELPHI_PACKAGE GUID WPD_EVENT_OPTIONS_V1;
extern DELPHI_PACKAGE GUID WPD_EVENT_PROPERTIES_V1;
extern DELPHI_PACKAGE GUID WPD_EVENT_PROPERTIES_V2;
extern DELPHI_PACKAGE GUID WPD_EVENT_SERVICE_METHOD_COMPLETE;
extern DELPHI_PACKAGE GUID WPD_EVENT_STORAGE_FORMAT;
extern DELPHI_PACKAGE GUID WPD_FOLDER_OBJECT_PROPERTIES_V1;
extern DELPHI_PACKAGE GUID WPD_FORMAT_ATTRIBUTES_V1;
extern DELPHI_PACKAGE GUID WPD_FUNCTIONAL_CATEGORY_ALL;
extern DELPHI_PACKAGE GUID WPD_FUNCTIONAL_CATEGORY_AUDIO_CAPTURE;
extern DELPHI_PACKAGE GUID WPD_FUNCTIONAL_CATEGORY_DEVICE;
extern DELPHI_PACKAGE GUID WPD_FUNCTIONAL_CATEGORY_NETWORK_CONFIGURATION;
extern DELPHI_PACKAGE GUID WPD_FUNCTIONAL_CATEGORY_RENDERING_INFORMATION;
extern DELPHI_PACKAGE GUID WPD_FUNCTIONAL_CATEGORY_SMS;
extern DELPHI_PACKAGE GUID WPD_FUNCTIONAL_CATEGORY_STILL_IMAGE_CAPTURE;
extern DELPHI_PACKAGE GUID WPD_FUNCTIONAL_CATEGORY_STORAGE;
extern DELPHI_PACKAGE GUID WPD_FUNCTIONAL_CATEGORY_VIDEO_CAPTURE;
extern DELPHI_PACKAGE GUID WPD_FUNCTIONAL_OBJECT_PROPERTIES_V1;
extern DELPHI_PACKAGE GUID WPD_IMAGE_OBJECT_PROPERTIES_V1;
extern DELPHI_PACKAGE GUID WPD_MEDIA_PROPERTIES_V1;
extern DELPHI_PACKAGE GUID WPD_MEMO_OBJECT_PROPERTIES_V1;
extern DELPHI_PACKAGE GUID WPD_METHOD_ATTRIBUTES_V1;
extern DELPHI_PACKAGE GUID WPD_MUSIC_OBJECT_PROPERTIES_V1;
extern DELPHI_PACKAGE GUID WPD_NETWORK_ASSOCIATION_PROPERTIES_V1;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_3GP;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_AAC;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_ABSTRACT_CONTACT;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_ABSTRACT_CONTACT_GROUP;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_ABSTRACT_MEDIA_CAST;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_AIFF;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_ALL;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_ASF;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_ASXPLAYLIST;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_AUDIBLE;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_AVI;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_BMP;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_CIFF;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_DPOF;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_EXECUTABLE;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_EXIF;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_FLAC;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_FLASHPIX;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_GIF;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_HTML;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_ICALENDAR;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_ICON;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_JFIF;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_JP2;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_JPX;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_M3UPLAYLIST;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_M4A;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_MHT_COMPILED_HTML;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_MICROSOFT_EXCEL;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_MICROSOFT_POWERPOINT;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_MICROSOFT_WFC;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_MICROSOFT_WORD;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_MP2;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_MP3;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_MP4;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_MPEG;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_MPLPLAYLIST;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_NETWORK_ASSOCIATION;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_OGG;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_PCD;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_PICT;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_PLSPLAYLIST;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_PNG;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_PROPERTIES_ONLY;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_SCRIPT;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_TEXT;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_TIFF;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_TIFFEP;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_TIFFIT;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_UNSPECIFIED;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_VCALENDAR1;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_VCARD2;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_VCARD3;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_WAVE;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_WINDOWSIMAGEFORMAT;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_WMA;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_WMV;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_WPLPLAYLIST;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_X509V3CERTIFICATE;
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_XML;
extern DELPHI_PACKAGE GUID WPD_OBJECT_PROPERTIES_V1;
extern DELPHI_PACKAGE GUID WPD_PARAMETER_ATTRIBUTES_V1;
extern DELPHI_PACKAGE GUID WPD_PROPERTY_ATTRIBUTES_V1;
extern DELPHI_PACKAGE GUID WPD_PROPERTY_ATTRIBUTES_V2;
extern DELPHI_PACKAGE GUID WPD_RENDERING_INFORMATION_OBJECT_PROPERTIES_V1;
extern DELPHI_PACKAGE GUID WPD_RESOURCE_ATTRIBUTES_V1;
extern DELPHI_PACKAGE GUID WPD_SECTION_OBJECT_PROPERTIES_V1;
extern DELPHI_PACKAGE GUID WPD_SERVICE_PROPERTIES_V1;
extern DELPHI_PACKAGE GUID WPD_SMS_OBJECT_PROPERTIES_V1;
extern DELPHI_PACKAGE GUID WPD_STILL_IMAGE_CAPTURE_OBJECT_PROPERTIES_V1;
extern DELPHI_PACKAGE GUID WPD_STORAGE_OBJECT_PROPERTIES_V1;
extern DELPHI_PACKAGE GUID WPD_TASK_OBJECT_PROPERTIES_V1;
extern DELPHI_PACKAGE GUID WPD_VIDEO_OBJECT_PROPERTIES_V1;
extern DELPHI_PACKAGE Portabledeviceapilib_tlb::_tagpropertykey WPD_OBJECT_CONTENT_TYPE;
extern DELPHI_PACKAGE GUID WPD_PROPERTY_NULL_FMTID;
static const System::Int8 WPD_PROPERTY_NULL_PID = System::Int8(0x0);
extern DELPHI_PACKAGE GUID WPD_OBJECT_ID_FMTID;
static const System::Int8 WPD_OBJECT_ID_PID = System::Int8(0x2);
extern DELPHI_PACKAGE GUID WPD_OBJECT_PARENT_ID_FMTID;
static const System::Int8 WPD_OBJECT_PARENT_ID_PID = System::Int8(0x3);
extern DELPHI_PACKAGE GUID WPD_OBJECT_NAME_FMTID;
static const System::Int8 WPD_OBJECT_NAME_PID = System::Int8(0x4);
extern DELPHI_PACKAGE GUID WPD_OBJECT_PERSISTENT_UNIQUE_ID_FMTID;
static const System::Int8 WPD_OBJECT_PERSISTENT_UNIQUE_ID_PID = System::Int8(0x5);
extern DELPHI_PACKAGE GUID WPD_OBJECT_FORMAT_FMTID;
static const System::Int8 WPD_OBJECT_FORMAT_PID = System::Int8(0x6);
extern DELPHI_PACKAGE GUID WPD_OBJECT_CONTENT_TYPE_FMTID;
static const System::Int8 WPD_OBJECT_CONTENT_TYPE_PID = System::Int8(0x7);
extern DELPHI_PACKAGE GUID WPD_OBJECT_ISHIDDEN_FMTID;
static const System::Int8 WPD_OBJECT_ISHIDDEN_PID = System::Int8(0x9);
extern DELPHI_PACKAGE GUID WPD_OBJECT_ISSYSTEM_FMTID;
static const System::Int8 WPD_OBJECT_ISSYSTEM_PID = System::Int8(0xa);
extern DELPHI_PACKAGE GUID WPD_OBJECT_SIZE_FMTID;
static const System::Int8 WPD_OBJECT_SIZE_PID = System::Int8(0xb);
extern DELPHI_PACKAGE GUID WPD_OBJECT_ORIGINAL_FILE_NAME_FMTID;
static const System::Int8 WPD_OBJECT_ORIGINAL_FILE_NAME_PID = System::Int8(0xc);
extern DELPHI_PACKAGE GUID WPD_OBJECT_NON_CONSUMABLE_FMTID;
static const System::Int8 WPD_OBJECT_NON_CONSUMABLE_PID = System::Int8(0xd);
extern DELPHI_PACKAGE GUID WPD_OBJECT_REFERENCES_FMTID;
static const System::Int8 WPD_OBJECT_REFERENCES_PID = System::Int8(0xe);
extern DELPHI_PACKAGE GUID WPD_OBJECT_KEYWORDS_FMTID;
static const System::Int8 WPD_OBJECT_KEYWORDS_PID = System::Int8(0xf);
extern DELPHI_PACKAGE GUID WPD_OBJECT_SYNC_ID_FMTID;
static const System::Int8 WPD_OBJECT_SYNC_ID_PID = System::Int8(0x10);
extern DELPHI_PACKAGE GUID WPD_OBJECT_IS_DRM_PROTECTED_FMTID;
static const System::Int8 WPD_OBJECT_IS_DRM_PROTECTED_PID = System::Int8(0x11);
extern DELPHI_PACKAGE GUID WPD_OBJECT_DATE_CREATED_FMTID;
static const System::Int8 WPD_OBJECT_DATE_CREATED_PID = System::Int8(0x12);
extern DELPHI_PACKAGE GUID WPD_OBJECT_DATE_MODIFIED_FMTID;
static const System::Int8 WPD_OBJECT_DATE_MODIFIED_PID = System::Int8(0x13);
extern DELPHI_PACKAGE GUID WPD_OBJECT_DATE_AUTHORED_FMTID;
static const System::Int8 WPD_OBJECT_DATE_AUTHORED_PID = System::Int8(0x14);
extern DELPHI_PACKAGE GUID WPD_OBJECT_BACK_REFERENCES_FMTID;
static const System::Int8 WPD_OBJECT_BACK_REFERENCES_PID = System::Int8(0x15);
extern DELPHI_PACKAGE GUID WPD_OBJECT_CONTAINER_FUNCTIONAL_OBJECT_ID_FMTID;
static const System::Int8 WPD_OBJECT_CONTAINER_FUNCTIONAL_OBJECT_ID_PID = System::Int8(0x17);
extern DELPHI_PACKAGE GUID WPD_OBJECT_GENERATE_THUMBNAIL_FROM_RESOURCE_FMTID;
static const System::Int8 WPD_OBJECT_GENERATE_THUMBNAIL_FROM_RESOURCE_PID = System::Int8(0x18);
extern DELPHI_PACKAGE GUID WPD_OBJECT_HINT_LOCATION_DISPLAY_NAME_FMTID;
static const System::Int8 WPD_OBJECT_HINT_LOCATION_DISPLAY_NAME_PID = System::Int8(0x19);
extern DELPHI_PACKAGE GUID WPD_OBJECT_CAN_DELETE_FMTID;
static const System::Int8 WPD_OBJECT_CAN_DELETE_PID = System::Int8(0x1a);
extern DELPHI_PACKAGE GUID WPD_CLIENT_NAME_FMTID;
static const System::Int8 WPD_CLIENT_NAME_PID = System::Int8(0x2);
extern DELPHI_PACKAGE GUID WPD_CLIENT_MAJOR_VERSION_FMTID;
static const System::Int8 WPD_CLIENT_MAJOR_VERSION_PID = System::Int8(0x3);
extern DELPHI_PACKAGE GUID WPD_CLIENT_MINOR_VERSION_FMTID;
static const System::Int8 WPD_CLIENT_MINOR_VERSION_PID = System::Int8(0x4);
extern DELPHI_PACKAGE GUID WPD_CLIENT_REVISION_FMTID;
static const System::Int8 WPD_CLIENT_REVISION_PID = System::Int8(0x5);
extern DELPHI_PACKAGE GUID WPD_CLIENT_DESIRED_ACCESS_FMTID;
static const System::Int8 WPD_CLIENT_DESIRED_ACCESS_PID = System::Int8(0x9);
extern DELPHI_PACKAGE GUID WPD_DEVICE_FRIENDLY_NAME_FMTID;
static const System::Int8 WPD_DEVICE_FRIENDLY_NAME_PID = System::Int8(0xc);
extern DELPHI_PACKAGE GUID WPD_RESOURCE_DEFAULT_FMTID;
static const System::Int8 WPD_RESOURCE_DEFAULT_PID = System::Int8(0x0);
extern DELPHI_PACKAGE GUID WPD_PROPERTY_ATTRIBUTE_FORM_FMTID;
static const System::Int8 WPD_PROPERTY_ATTRIBUTE_FORM_PID = System::Int8(0x2);
extern DELPHI_PACKAGE GUID WPD_PROPERTY_ATTRIBUTE_CAN_READ_FMTID;
static const System::Int8 WPD_PROPERTY_ATTRIBUTE_CAN_READ_PID = System::Int8(0x3);
extern DELPHI_PACKAGE GUID WPD_PROPERTY_ATTRIBUTE_CAN_WRITE_FMTID;
static const System::Int8 WPD_PROPERTY_ATTRIBUTE_CAN_WRITE_PID = System::Int8(0x4);
extern DELPHI_PACKAGE GUID WPD_PROPERTY_ATTRIBUTE_CAN_DELETE_FMTID;
static const System::Int8 WPD_PROPERTY_ATTRIBUTE_CAN_DELETE_PID = System::Int8(0x5);
extern DELPHI_PACKAGE GUID WPD_PROPERTY_ATTRIBUTE_DEFAULT_VALUE_FMTID;
static const System::Int8 WPD_PROPERTY_ATTRIBUTE_DEFAULT_VALUE_PID = System::Int8(0x6);
extern DELPHI_PACKAGE GUID WPD_PROPERTY_ATTRIBUTE_FAST_PROPERTY_FMTID;
static const System::Int8 WPD_PROPERTY_ATTRIBUTE_FAST_PROPERTY_PID = System::Int8(0x7);
extern DELPHI_PACKAGE GUID WPD_PROPERTY_ATTRIBUTE_RANGE_MIN_FMTID;
static const System::Int8 WPD_PROPERTY_ATTRIBUTE_RANGE_MIN_PID = System::Int8(0x8);
extern DELPHI_PACKAGE GUID WPD_PROPERTY_ATTRIBUTE_RANGE_MAX_FMTID;
static const System::Int8 WPD_PROPERTY_ATTRIBUTE_RANGE_MAX_PID = System::Int8(0x9);
extern DELPHI_PACKAGE GUID WPD_PROPERTY_ATTRIBUTE_RANGE_STEP_FMTID;
static const System::Int8 WPD_PROPERTY_ATTRIBUTE_RANGE_STEP_PID = System::Int8(0xa);
extern DELPHI_PACKAGE GUID WPD_PROPERTY_ATTRIBUTE_ENUMERATION_ELEMENTS_FMTID;
static const System::Int8 WPD_PROPERTY_ATTRIBUTE_ENUMERATION_ELEMENTS_PID = System::Int8(0xb);
extern DELPHI_PACKAGE GUID WPD_PROPERTY_ATTRIBUTE_REGULAR_EXPRESSION_FMTID;
static const System::Int8 WPD_PROPERTY_ATTRIBUTE_REGULAR_EXPRESSION_PID = System::Int8(0xc);
extern DELPHI_PACKAGE GUID WPD_PROPERTY_ATTRIBUTE_MAX_SIZE_FMTID;
static const System::Int8 WPD_PROPERTY_ATTRIBUTE_MAX_SIZE_PID = System::Int8(0xd);
#define WPD_DEVICE_OBJECT_ID L"DEVICE"
extern DELPHI_PACKAGE bool __fastcall RenameObject(Portabledeviceapilib_tlb::_di_IPortableDevice Device, System::WideChar * ObjectId, System::WideChar * NewName);
extern DELPHI_PACKAGE bool __fastcall ConnectToDevice(System::WideString SDev, Portabledeviceapilib_tlb::_di_IPortableDevice &PortableDev, bool Readonly = true);
extern DELPHI_PACKAGE System::Classes::TList* __fastcall GetDevices();
extern DELPHI_PACKAGE System::WideChar * __fastcall ReadFilesFromDevice(System::WideString SDev, Vcl::Comctrls::TListItems* Lst, System::WideString SParent, System::WideString &CompletePath);
extern DELPHI_PACKAGE System::UnicodeString __fastcall GetIdForFile(Portabledeviceapilib_tlb::_di_IPortableDevice PortableDev, System::WideString SPath, System::WideString SFile, Vcl::Comctrls::TListItem* AListItem = (Vcl::Comctrls::TListItem*)(0x0));
extern DELPHI_PACKAGE System::UnicodeString __fastcall GetIdForPath(System::WideString SDev, System::WideString SPath, System::UnicodeString &FriendlyPath);
extern DELPHI_PACKAGE bool __fastcall GetFileFromDevice(Portabledeviceapilib_tlb::_di_IPortableDevice PortableDev, System::WideString SFile, System::WideString SSaveTo, System::WideString NFile);
extern DELPHI_PACKAGE bool __fastcall DelFileFromDevice(Portabledeviceapilib_tlb::_di_IPortableDevice PortableDev, System::WideString SFile);
extern DELPHI_PACKAGE System::WideString __fastcall TransferNewFileToDevice(Portabledeviceapilib_tlb::_di_IPortableDevice PortableDev, System::WideString SFile, System::WideString SSaveTo, System::WideString NewName = System::WideString());
extern DELPHI_PACKAGE bool __fastcall TransferExistingFileToDevice(Portabledeviceapilib_tlb::_di_IPortableDevice PortableDev, System::WideString SFile, System::WideString SSaveTo, Vcl::Comctrls::TListItem* AListItem);
}	/* namespace Mtp_helper */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_MTP_HELPER)
using namespace Mtp_helper;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Mtp_helperHPP