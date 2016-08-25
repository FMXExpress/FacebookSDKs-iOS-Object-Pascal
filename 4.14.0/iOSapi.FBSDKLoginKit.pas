{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework FBSDKLoginKit
//

unit iOSapi.FBSDKLoginKit;

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
  iOSapi.Accounts,
  iOSapi.CocoaTypes,
  iOSapi.CoreGraphics,
  iOSapi.FBSDKCoreKit,
  iOSapi.Foundation,
  iOSapi.UIKit;

const
  FBSDKDefaultAudienceFriends = 0;
  FBSDKDefaultAudienceOnlyMe = 1;
  FBSDKDefaultAudienceEveryone = 2;
  FBSDKLoginBehaviorNative = 0;
  FBSDKLoginBehaviorBrowser = 1;
  FBSDKLoginBehaviorSystemAccount = 2;
  FBSDKLoginBehaviorWeb = 3;
  FBSDKTooltipViewArrowDirectionDown = 0;
  FBSDKTooltipViewArrowDirectionUp = 1;
  FBSDKTooltipColorStyleFriendlyBlue = 0;
  FBSDKTooltipColorStyleNeutralGray = 1;
  FBSDKLoginButtonTooltipBehaviorAutomatic = 0;
  FBSDKLoginButtonTooltipBehaviorForceDisplay = 1;
  FBSDKLoginButtonTooltipBehaviorDisable = 2;
  FBSDKLoginReservedErrorCode = 300;
  FBSDKLoginUnknownErrorCode = 301;
  FBSDKLoginPasswordChangedErrorCode = 302;
  FBSDKLoginUserCheckpointedErrorCode = 303;
  FBSDKLoginUserMismatchErrorCode = 304;
  FBSDKLoginUnconfirmedUserErrorCode = 305;
  FBSDKLoginSystemAccountAppDisabledErrorCode = 306;
  FBSDKLoginSystemAccountUnavailableErrorCode = 307;
  FBSDKLoginBadChallengeString = 308;

type

  // ===== Forward declarations =====
{$M+}
  FBSDKLoginManagerLoginResult = interface;
  FBSDKLoginManager = interface;
  FBSDKTooltipView = interface;
  FBSDKLoginButtonDelegate = interface;
  FBSDKLoginButton = interface;
  FBSDKLoginTooltipViewDelegate = interface;
  FBSDKLoginTooltipView = interface;

  // ===== Framework typedefs =====
{$M+}
  FBSDKLoginManagerRequestTokenHandler = procedure
    (param1: FBSDKLoginManagerLoginResult; param2: NSError) of object;
  NSUInteger = Cardinal;
  FBSDKDefaultAudience = NSUInteger;
  FBSDKLoginBehavior = NSUInteger;
  NSInteger = Integer;
  ACAccountCredentialRenewResult = NSInteger;
  TFBSDKLoginKitHandler = procedure(param1: ACAccountCredentialRenewResult;
    param2: NSError) of object;
  FBSDKTooltipViewArrowDirection = NSUInteger;
  FBSDKTooltipColorStyle = NSUInteger;
  CFTimeInterval = Double;
  CGFloat = Single;
  CGPoint = CGPoint = record x: CGFloat;
y:
CGFloat;
end;
PCGPoint = ^CGPoint;;
FBSDKLoginButtonTooltipBehavior = NSUInteger;
FBSDKLoginErrorCode = NSInteger;
// ===== Interface declarations =====

FBSDKLoginManagerLoginResultClass = interface(NSObjectClass)
  ['{D0A5701C-9298-4EA9-9477-C8BBA076EA69}']
end;
FBSDKLoginManagerLoginResult = interface(NSObject)
  ['{C62E2107-B73D-44A2-8ED2-489C988E635F}']
procedure setToken(token: FBSDKAccessToken);
cdecl;

function token: FBSDKAccessToken; cdecl;
  function isCancelled: Boolean; cdecl;
    procedure setGrantedPermissions(grantedPermissions: NSSet); cdecl;
      function grantedPermissions: NSSet; cdecl;
        procedure setDeclinedPermissions(declinedPermissions: NSSet); cdecl;
          function declinedPermissions: NSSet; cdecl;
            function initWithToken(token: FBSDKAccessToken;
              isCancelled: Boolean; grantedPermissions: NSSet;
              declinedPermissions: NSSet): Pointer { instancetype }; cdecl;
            end;

        TFBSDKLoginManagerLoginResult = class
          (TOCGenericImport<FBSDKLoginManagerLoginResultClass,
          FBSDKLoginManagerLoginResult>)
        end;
    PFBSDKLoginManagerLoginResult = Pointer;

    FBSDKLoginManagerClass = interface(NSObjectClass)
      ['{FD347C60-E1F1-4720-B8D5-8D8DE93C86C5}']
    { class } procedure renewSystemCredentials(handler: TFBSDKLoginKitHandler);
    cdecl;
    end;
FBSDKLoginManager = interface(NSObject)
  ['{922D2F92-C26C-4FE0-B2B3-436A9358F4BA}']
procedure setDefaultAudience(defaultAudience: FBSDKDefaultAudience);
cdecl;
  function defaultAudience: FBSDKDefaultAudience; cdecl;
    procedure setLoginBehavior(loginBehavior: FBSDKLoginBehavior); cdecl;
      function loginBehavior: FBSDKLoginBehavior; cdecl;
      [MethodName('logInWithReadPermissions:handler:')]
        procedure logInWithReadPermissionsHandler(permissions: NSArray;
          handler: FBSDKLoginManagerRequestTokenHandler); cdecl;
        [MethodName('logInWithPublishPermissions:handler:')]
          procedure logInWithPublishPermissionsHandler(permissions: NSArray;
            handler: FBSDKLoginManagerRequestTokenHandler); cdecl;
          [MethodName('logInWithReadPermissions:fromViewController:handler:')]
            procedure logInWithReadPermissionsFromViewControllerHandler
              (permissions: NSArray; fromViewController: UIViewController;
              handler: FBSDKLoginManagerRequestTokenHandler); cdecl;
            [MethodName
              ('logInWithPublishPermissions:fromViewController:handler:')]
              procedure logInWithPublishPermissionsFromViewControllerHandler
                (permissions: NSArray; fromViewController: UIViewController;
                handler: FBSDKLoginManagerRequestTokenHandler); cdecl;
                procedure logOut; cdecl;
                end;

            TFBSDKLoginManager = class(TOCGenericImport<FBSDKLoginManagerClass,
              FBSDKLoginManager>)
            end;
        PFBSDKLoginManager = Pointer;

        FBSDKTooltipViewClass = interface(UIViewClass)
          ['{0D7D5E8D-A4C6-467D-BB58-52DE795E0B3F}']
        end;
    FBSDKTooltipView = interface(UIView)
      ['{4329CBA3-B8D2-47D7-BAB4-924A5B270CD6}']
    procedure setDisplayDuration(displayDuration: CFTimeInterval);
    cdecl;
      function displayDuration: CFTimeInterval; cdecl;
        procedure setColorStyle(colorStyle: FBSDKTooltipColorStyle); cdecl;
          function colorStyle: FBSDKTooltipColorStyle; cdecl;
            procedure setMessage(message: NSString); cdecl;
              function message: NSString; cdecl;
                procedure setTagline(tagline: NSString); cdecl;
                  function tagline: NSString; cdecl;
                    function initWithTagline(tagline: NSString;
                      message: NSString; colorStyle: FBSDKTooltipColorStyle)
                      : Pointer { instancetype }; cdecl;
                      procedure presentFromView(anchorView: UIView); cdecl;
                        procedure presentInView(view: UIView;
                          withArrowPosition: CGPoint;
                          direction: FBSDKTooltipViewArrowDirection); cdecl;
                          procedure dismiss; cdecl;
                          end;

                      TFBSDKTooltipView = class
                        (TOCGenericImport<FBSDKTooltipViewClass,
                        FBSDKTooltipView>)
                      end;
                  PFBSDKTooltipView = Pointer;

                  FBSDKLoginButtonClass = interface(FBSDKButtonClass)
                    ['{B6B2529E-13EF-43F2-81B8-FE2EF9F03346}']
                  end;
              FBSDKLoginButton = interface(FBSDKButton)
                ['{1F681599-2093-4CC0-8BB6-38EF3DA38896}']
              procedure setDefaultAudience(defaultAudience
                : FBSDKDefaultAudience);
              cdecl;
                function defaultAudience: FBSDKDefaultAudience; cdecl;
                  procedure setDelegate(delegate: Pointer); cdecl;
                    function delegate: Pointer; cdecl;
                      procedure setLoginBehavior(loginBehavior
                        : FBSDKLoginBehavior); cdecl;
                        function loginBehavior: FBSDKLoginBehavior; cdecl;
                          procedure setPublishPermissions(publishPermissions
                            : NSArray); cdecl;
                            function publishPermissions: NSArray; cdecl;
                              procedure setReadPermissions(readPermissions
                                : NSArray); cdecl;
                                function readPermissions: NSArray; cdecl;
                                  procedure setTooltipBehavior(tooltipBehavior
                                    : FBSDKLoginButtonTooltipBehavior); cdecl;
                                    function tooltipBehavior
                                      : FBSDKLoginButtonTooltipBehavior; cdecl;
                                      procedure setTooltipColorStyle
                                        (tooltipColorStyle
                                        : FBSDKTooltipColorStyle); cdecl;
                                        function tooltipColorStyle
                                        : FBSDKTooltipColorStyle; cdecl;
                                        end;

                                    TFBSDKLoginButton = class
                                      (TOCGenericImport<FBSDKLoginButtonClass,
                                      FBSDKLoginButton>)
                                    end;
                                PFBSDKLoginButton = Pointer;

                                FBSDKLoginTooltipViewClass = interface
                                  (FBSDKTooltipViewClass)
                                  ['{BC0B2C7A-BD09-4347-8673-B966ABA2ABE9}']
                                end;
                            FBSDKLoginTooltipView = interface(FBSDKTooltipView)
                              ['{B1C353A8-8118-4D40-A9CC-1A24854A8F46}']
                            procedure setDelegate(delegate: Pointer);
                            cdecl;
                              function delegate: Pointer; cdecl;
                                procedure setForceDisplay
                                  (forceDisplay: Boolean); cdecl;
                                  function forceDisplay: Boolean; cdecl;
                                  end;

                              TFBSDKLoginTooltipView = class
                                (TOCGenericImport<FBSDKLoginTooltipViewClass,
                                FBSDKLoginTooltipView>)
                              end;
                          PFBSDKLoginTooltipView = Pointer;

                          // ===== Protocol declarations =====

                          FBSDKLoginButtonDelegate = interface(IObjectiveC)
                            ['{7892090C-C27C-47EF-A02B-DAE30CBEFD8F}']
                          procedure loginButton(loginButton: FBSDKLoginButton;
                            didCompleteWithResult: FBSDKLoginManagerLoginResult;
                            error: NSError);
                          cdecl;
                            procedure loginButtonDidLogOut
                              (loginButton: FBSDKLoginButton); cdecl;
                              function loginButtonWillLogin
                                (loginButton: FBSDKLoginButton): Boolean; cdecl;
                              end;

                          FBSDKLoginTooltipViewDelegate = interface(IObjectiveC)
                            ['{B9BCEF39-71F9-44D2-B857-C16F1FF8E0AD}']
                          function loginTooltipView(view: FBSDKLoginTooltipView;
                            shouldAppear: Boolean): Boolean;
                          cdecl;
                            procedure loginTooltipViewWillAppear
                              (view: FBSDKLoginTooltipView); cdecl;
                              procedure loginTooltipViewWillNotAppear
                                (view: FBSDKLoginTooltipView); cdecl;
                              end;

                          // ===== Exported string consts =====

                            function FBSDKLoginErrorDomain: NSString;


                            // ===== External functions =====

                            const
                              libFBSDKLoginKit =
                                '/System/Library/Frameworks/FBSDKLoginKit.framework/FBSDKLoginKit';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  FBSDKLoginKitModule: THandle;

{$ENDIF IOS}

function FBSDKLoginErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKLoginKit, 'FBSDKLoginErrorDomain');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

FBSDKLoginKitModule := dlopen(MarshaledAString(libFBSDKLoginKit), RTLD_LAZY);

finalization

dlclose(FBSDKLoginKitModule);
{$ENDIF IOS}

end.
