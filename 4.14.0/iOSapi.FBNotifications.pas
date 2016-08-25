{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework FBNotifications
//

unit iOSapi.FBNotifications;

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
  iOSapi.Foundation,
  iOSapi.UIKit;

const
  FBNotificationsErrorInvalidPayload = 1;

type

  // ===== Forward declarations =====
{$M+}
  FBNCardViewController = interface;
  FBNCardViewControllerDelegate = interface;
  FBNotificationsManager = interface;

  // ===== Framework typedefs =====
{$M+}
  NSUInteger = Cardinal;
  FBNotificationsErrorCode = NSUInteger;
  FBNCardContentPreparationCompletion = procedure(param1: NSDictionary;
    param2: NSError) of object;
  FBNCardPresentationCompletion = procedure(param1: FBNCardViewController;
    param2: NSError) of object;
  FBNLocalNotificationCreationCompletion = procedure
    (param1: UILocalNotification; param2: NSError) of object;
  // ===== Interface declarations =====

  FBNCardViewControllerClass = interface(UIViewControllerClass)
    ['{A27D9BB8-45C5-46D9-A0B1-38F8B0313D3D}']
  end;

  FBNCardViewController = interface(UIViewController)
    ['{4D645F0F-BA34-4A32-8B49-3EB25F5AF626}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
  end;

  TFBNCardViewController = class(TOCGenericImport<FBNCardViewControllerClass,
    FBNCardViewController>)
  end;

  PFBNCardViewController = Pointer;

  FBNotificationsManagerClass = interface(NSObjectClass)
    ['{AFB7C18E-284A-42A6-9D83-96469AAD504A}']
    { class } function sharedManager: Pointer { instancetype }; cdecl;
  end;

  FBNotificationsManager = interface(NSObject)
    ['{807BB47D-2EFF-45FF-9070-908880E6815C}']
    procedure preparePushCardContentForRemoteNotificationPayload
      (payload: NSDictionary;
      completion: FBNCardContentPreparationCompletion); cdecl;
    procedure presentPushCardForRemoteNotificationPayload(payload: NSDictionary;
      fromViewController: UIViewController;
      completion: FBNCardPresentationCompletion); cdecl;
    function canPresentPushCardFromRemoteNotificationPayload
      (payload: NSDictionary): Boolean; cdecl;
    procedure createLocalNotificationFromRemoteNotificationPayload
      (payload: NSDictionary;
      completion: FBNLocalNotificationCreationCompletion); cdecl;
    procedure presentPushCardForLocalNotification(notification
      : UILocalNotification; fromViewController: UIViewController;
      completion: FBNCardPresentationCompletion); cdecl;
    function canPresentPushCardFromLocalNotification(notification
      : UILocalNotification): Boolean; cdecl;
  end;

  TFBNotificationsManager = class(TOCGenericImport<FBNotificationsManagerClass,
    FBNotificationsManager>)
  end;

  PFBNotificationsManager = Pointer;

  // ===== Protocol declarations =====

  FBNCardViewControllerDelegate = interface(IObjectiveC)
    ['{1F7CDA72-46D4-4CAD-B2E8-8BCCD8A86130}']
    procedure pushCardViewController(controller: FBNCardViewController;
      willDismissWithOpenURL: NSURL); cdecl;
    procedure pushCardViewControllerWillDismiss
      (controller: FBNCardViewController); cdecl;
  end;

  // ===== Exported string consts =====

function FBNotificationsErrorDomain: NSString;
function FBNotificationsCardFormatVersionString: NSString;


// ===== External functions =====

const
  libFBNotifications =
    '/System/Library/Frameworks/FBNotifications.framework/FBNotifications';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  FBNotificationsModule: THandle;

{$ENDIF IOS}

function FBNotificationsErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libFBNotifications,
    'FBNotificationsErrorDomain');
end;

function FBNotificationsCardFormatVersionString: NSString;
begin
  Result := CocoaNSStringConst(libFBNotifications,
    'FBNotificationsCardFormatVersionString');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

FBNotificationsModule := dlopen(MarshaledAString(libFBNotifications),
  RTLD_LAZY);

finalization

dlclose(FBNotificationsModule);
{$ENDIF IOS}

end.
