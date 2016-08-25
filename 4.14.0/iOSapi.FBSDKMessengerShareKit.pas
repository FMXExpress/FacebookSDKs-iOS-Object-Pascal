{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework FBSDKMessengerShareKit
//

unit iOSapi.FBSDKMessengerShareKit;

interface

uses
  Macapi.CoreFoundation,
  Macapi.CoreServices,
  Macapi.Dispatch,
  Macapi.Foundation,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  Macapi.QuartzCore,
  iOSapi.CocoaTypes,
  iOSapi.CoreGraphics,
  iOSapi.Foundation,
  iOSapi.UIKit;

const
  FBSDKMessengerPlatformCapabilityNone = 0;
  FBSDKMessengerPlatformCapabilityOpen = 1 shl 0;
  FBSDKMessengerPlatformCapabilityImage = 1 shl 1;
  FBSDKMessengerPlatformCapabilityAnimatedGIF = 1 shl 2;
  FBSDKMessengerPlatformCapabilityAnimatedWebP = 1 shl 3;
  FBSDKMessengerPlatformCapabilityVideo = 1 shl 4;
  FBSDKMessengerPlatformCapabilityAudio = 1 shl 5;
  FBSDKMessengerPlatformCapabilityRenderAsSticker = 1 shl 6;
  FBSDKMessengerShareButtonStyleBlue = 0;
  FBSDKMessengerShareButtonStyleWhite = 1;
  FBSDKMessengerShareButtonStyleWhiteBordered = 2;

type

  // ===== Forward declarations =====
{$M+}
  FBSDKMessengerContext = interface;
  FBSDKMessengerShareOptions = interface;
  FBSDKMessengerSharer = interface;
  FBSDKMessengerURLHandler = interface;
  FBSDKMessengerURLHandlerReplyContext = interface;
  FBSDKMessengerURLHandlerOpenFromComposerContext = interface;
  FBSDKMessengerURLHandlerCancelContext = interface;
  FBSDKMessengerURLHandlerDelegate = interface;
  FBSDKMessengerShareButton = interface;
  FBSDKMessengerBroadcastContext = interface;

  // ===== Framework typedefs =====
{$M+}
  NSUInteger = Cardinal;
  FBSDKMessengerPlatformCapability = NSUInteger;
  FBSDKMessengerShareButtonStyle = NSUInteger;
  CGFloat = Single;
  // ===== Interface declarations =====

  FBSDKMessengerContextClass = interface(NSObjectClass)
    ['{72039C6A-5580-4765-A48B-7734E34B1888}']
  end;

  FBSDKMessengerContext = interface(NSObject)
    ['{BAC06E06-5478-4F2E-83B8-09DAA8D17429}']
  end;

  TFBSDKMessengerContext = class(TOCGenericImport<FBSDKMessengerContextClass,
    FBSDKMessengerContext>)
  end;

  PFBSDKMessengerContext = Pointer;

  FBSDKMessengerShareOptionsClass = interface(NSObjectClass)
    ['{FAA7629A-BD5D-42BA-8557-86CE045630D9}']
  end;

  FBSDKMessengerShareOptions = interface(NSObject)
    ['{E3F0FD8C-FB14-4618-A93C-137731B36139}']
    procedure setMetadata(metadata: NSString); cdecl;
    function metadata: NSString; cdecl;
    procedure setSourceURL(sourceURL: NSURL); cdecl;
    function sourceURL: NSURL; cdecl;
    procedure setRenderAsSticker(renderAsSticker: Boolean); cdecl;
    function renderAsSticker: Boolean; cdecl;
    procedure setContextOverride(contextOverride: FBSDKMessengerContext); cdecl;
    function contextOverride: FBSDKMessengerContext; cdecl;
  end;

  TFBSDKMessengerShareOptions = class
    (TOCGenericImport<FBSDKMessengerShareOptionsClass,
    FBSDKMessengerShareOptions>)
  end;

  PFBSDKMessengerShareOptions = Pointer;

  FBSDKMessengerSharerClass = interface(NSObjectClass)
    ['{3E842360-6DA1-49B2-A3B6-05116CCBB66B}']
    { class } function messengerPlatformCapabilities
      : FBSDKMessengerPlatformCapability; cdecl;
    { class } procedure openMessenger; cdecl;
    [MethodName('shareImage:withMetadata:withContext:')]
    { class } procedure shareImageWithMetadataWithContext(image: UIImage;
      withMetadata: NSString; withContext: FBSDKMessengerContext); cdecl;
    [MethodName('shareImage:withOptions:')]
    { class } procedure shareImageWithOptions(image: UIImage;
      withOptions: FBSDKMessengerShareOptions); cdecl;
    [MethodName('shareAnimatedGIF:withMetadata:withContext:')]
    { class } procedure shareAnimatedGIFWithMetadataWithContext(animatedGIFData
      : NSData; withMetadata: NSString;
      withContext: FBSDKMessengerContext); cdecl;
    [MethodName('shareAnimatedGIF:withOptions:')]
    { class } procedure shareAnimatedGIFWithOptions(animatedGIFData: NSData;
      withOptions: FBSDKMessengerShareOptions); cdecl;
    [MethodName('shareAnimatedWebP:withMetadata:withContext:')]
    { class } procedure shareAnimatedWebPWithMetadataWithContext
      (animatedWebPData: NSData; withMetadata: NSString;
      withContext: FBSDKMessengerContext); cdecl;
    [MethodName('shareAnimatedWebP:withOptions:')]
    { class } procedure shareAnimatedWebPWithOptions(animatedWebPData: NSData;
      withOptions: FBSDKMessengerShareOptions); cdecl;
    [MethodName('shareVideo:withMetadata:withContext:')]
    { class } procedure shareVideoWithMetadataWithContext(videoData: NSData;
      withMetadata: NSString; withContext: FBSDKMessengerContext); cdecl;
    [MethodName('shareVideo:withOptions:')]
    { class } procedure shareVideoWithOptions(videoData: NSData;
      withOptions: FBSDKMessengerShareOptions); cdecl;
    [MethodName('shareAudio:withMetadata:withContext:')]
    { class } procedure shareAudioWithMetadataWithContext(audioData: NSData;
      withMetadata: NSString; withContext: FBSDKMessengerContext); cdecl;
    [MethodName('shareAudio:withOptions:')]
    { class } procedure shareAudioWithOptions(audioData: NSData;
      withOptions: FBSDKMessengerShareOptions); cdecl;
  end;

  FBSDKMessengerSharer = interface(NSObject)
    ['{F99A71EC-5363-4EDF-8B87-4EC31819371D}']
  end;

  TFBSDKMessengerSharer = class(TOCGenericImport<FBSDKMessengerSharerClass,
    FBSDKMessengerSharer>)
  end;

  PFBSDKMessengerSharer = Pointer;

  FBSDKMessengerURLHandlerClass = interface(NSObjectClass)
    ['{22BC0D95-4AFD-4BB1-B7BF-0701A1653D3B}']
  end;

  FBSDKMessengerURLHandler = interface(NSObject)
    ['{D97D30C5-1F2F-46ED-8C13-2DB8D0922615}']
    function canOpenURL(url: NSURL; sourceApplication: NSString)
      : Boolean; cdecl;
    function openURL(url: NSURL; sourceApplication: NSString): Boolean; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
  end;

  TFBSDKMessengerURLHandler = class
    (TOCGenericImport<FBSDKMessengerURLHandlerClass, FBSDKMessengerURLHandler>)
  end;

  PFBSDKMessengerURLHandler = Pointer;

  FBSDKMessengerURLHandlerReplyContextClass = interface
    (FBSDKMessengerContextClass)
    ['{C4C5FC19-2191-4C4C-9918-F55AEEB9CEF3}']
  end;

  FBSDKMessengerURLHandlerReplyContext = interface(FBSDKMessengerContext)
    ['{C31F1D68-4092-4B6C-8BEE-E989B228AC1C}']
    function metadata: NSString; cdecl;
    function userIDs: NSSet; cdecl;
  end;

  TFBSDKMessengerURLHandlerReplyContext = class
    (TOCGenericImport<FBSDKMessengerURLHandlerReplyContextClass,
    FBSDKMessengerURLHandlerReplyContext>)
  end;

  PFBSDKMessengerURLHandlerReplyContext = Pointer;

  FBSDKMessengerURLHandlerOpenFromComposerContextClass = interface
    (FBSDKMessengerContextClass)
    ['{474985A4-E01E-4AB2-AE05-756A5D55E91C}']
  end;

  FBSDKMessengerURLHandlerOpenFromComposerContext = interface
    (FBSDKMessengerContext)
    ['{261B75D7-335E-4EB3-88B2-79BEBA2F6BF6}']
    function metadata: NSString; cdecl;
    function userIDs: NSSet; cdecl;
  end;

  TFBSDKMessengerURLHandlerOpenFromComposerContext = class
    (TOCGenericImport<FBSDKMessengerURLHandlerOpenFromComposerContextClass,
    FBSDKMessengerURLHandlerOpenFromComposerContext>)
  end;

  PFBSDKMessengerURLHandlerOpenFromComposerContext = Pointer;

  FBSDKMessengerURLHandlerCancelContextClass = interface
    (FBSDKMessengerContextClass)
    ['{61380280-F861-4E60-991A-7B9903D18FA2}']
  end;

  FBSDKMessengerURLHandlerCancelContext = interface(FBSDKMessengerContext)
    ['{0E3F11A0-CEBC-41D0-A327-4E3E247C1E86}']
  end;

  TFBSDKMessengerURLHandlerCancelContext = class
    (TOCGenericImport<FBSDKMessengerURLHandlerCancelContextClass,
    FBSDKMessengerURLHandlerCancelContext>)
  end;

  PFBSDKMessengerURLHandlerCancelContext = Pointer;

  FBSDKMessengerShareButtonClass = interface(NSObjectClass)
    ['{8E6FBD37-1D4D-406C-AD7B-1E634F8D89DE}']
    { class } function rectangularButtonWithStyle
      (style: FBSDKMessengerShareButtonStyle): UIButton; cdecl;
    [MethodName('circularButtonWithStyle:width:')]
    { class } function circularButtonWithStyleWidth
      (style: FBSDKMessengerShareButtonStyle; width: CGFloat): UIButton; cdecl;
    [MethodName('circularButtonWithStyle:')]
    { class } function circularButtonWithStyle
      (style: FBSDKMessengerShareButtonStyle): UIButton; cdecl;
  end;

  FBSDKMessengerShareButton = interface(NSObject)
    ['{62648469-B28F-40B5-B094-55DD0A5EF297}']
  end;

  TFBSDKMessengerShareButton = class
    (TOCGenericImport<FBSDKMessengerShareButtonClass,
    FBSDKMessengerShareButton>)
  end;

  PFBSDKMessengerShareButton = Pointer;

  FBSDKMessengerBroadcastContextClass = interface(FBSDKMessengerContextClass)
    ['{AFFB577A-229A-443C-8CCE-DB64143A43DD}']
  end;

  FBSDKMessengerBroadcastContext = interface(FBSDKMessengerContext)
    ['{F79A4DD1-450D-43B8-A173-8C0E7A57A43A}']
  end;

  TFBSDKMessengerBroadcastContext = class
    (TOCGenericImport<FBSDKMessengerBroadcastContextClass,
    FBSDKMessengerBroadcastContext>)
  end;

  PFBSDKMessengerBroadcastContext = Pointer;

  // ===== Protocol declarations =====

  FBSDKMessengerURLHandlerDelegate = interface(IObjectiveC)
    ['{83E1ADE6-C8DB-487F-810D-1CF6B24C1AA7}']
    [MethodName('messengerURLHandler:didHandleReplyWithContext:')]
    procedure messengerURLHandlerDidHandleReplyWithContext(messengerURLHandler
      : FBSDKMessengerURLHandler;
      didHandleReplyWithContext: FBSDKMessengerURLHandlerReplyContext); cdecl;
    [MethodName('messengerURLHandler:didHandleOpenFromComposerWithContext:')]
    procedure messengerURLHandlerDidHandleOpenFromComposerWithContext
      (messengerURLHandler: FBSDKMessengerURLHandler;
      didHandleOpenFromComposerWithContext
      : FBSDKMessengerURLHandlerOpenFromComposerContext); cdecl;
    [MethodName('messengerURLHandler:didHandleCancelWithContext:')]
    procedure messengerURLHandlerDidHandleCancelWithContext(messengerURLHandler
      : FBSDKMessengerURLHandler;
      didHandleCancelWithContext: FBSDKMessengerURLHandlerCancelContext); cdecl;
  end;

  // ===== External functions =====

const
  libFBSDKMessengerShareKit =
    '/System/Library/Frameworks/FBSDKMessengerShareKit.framework/FBSDKMessengerShareKit';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  FBSDKMessengerShareKitModule: THandle;

{$ENDIF IOS}
{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

FBSDKMessengerShareKitModule :=
  dlopen(MarshaledAString(libFBSDKMessengerShareKit), RTLD_LAZY);

finalization

dlclose(FBSDKMessengerShareKitModule);
{$ENDIF IOS}

end.
