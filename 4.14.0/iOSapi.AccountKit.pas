{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework AccountKit
//

unit iOSapi.AccountKit;

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
  AKFResponseTypeAccessToken = 0;
  AKFResponseTypeAuthorizationCode = 1;
  AKFButtonTypeDefault = 0;
  AKFButtonTypeBegin = 1;
  AKFButtonTypeConfirm = 2;
  AKFButtonTypeContinue = 3;
  AKFButtonTypeLogIn = 4;
  AKFButtonTypeNext = 5;
  AKFButtonTypeOK = 6;
  AKFButtonTypeSend = 7;
  AKFButtonTypeStart = 8;
  AKFButtonTypeSubmit = 9;
  AKFLoginFlowStateNone = 0;
  AKFLoginFlowStatePhoneNumberInput = 1;
  AKFLoginFlowStateEmailInput = 2;
  AKFLoginFlowStateEmailVerify = 3;
  AKFLoginFlowStateSendingCode = 4;
  AKFLoginFlowStateSentCode = 5;
  AKFLoginFlowStateCodeInput = 6;
  AKFLoginFlowStateVerifyingCode = 7;
  AKFLoginFlowStateVerified = 8;
  AKFLoginFlowStateError = 9;
  AKFTextPositionDefault = 0;
  AKFTextPositionAboveBody = 1;
  AKFTextPositionBelowBody = 2;
  AKFLoginTypeEmail = 0;
  AKFLoginTypePhone = 1;
  AKFNetworkConnectionError = 100;
  AKFServerError = 200;
  AKFLoginRequestInvalidatedError = 300;
  AKFInvalidParameterValueError = 400;
  AKFInvalidServerParameterValueError = 201;
  AKFLoginRequestExpiredError = 301;
  AKFInvalidEmailAddressError = 401;
  AKFInvalidPhoneNumberError = 402;
  AKFInvalidCodingValueError = 403;
  AKFInvalidAccessTokenError = 404;
  AKFInvalidAccountPreferenceKeyError = 405;
  AKFInvalidAccountPreferenceValueError = 406;
  AKFOperationNotSuccessful = 407;
  AKFServerResponseErrorCodeInvalidConfirmationCode = 15003;
  AKFHeaderTextTypeLogin = 0;
  AKFHeaderTextTypeAppName = 1;

type

  // ===== Forward declarations =====
{$M+}
  AKFAccessToken = interface;
  AKFPhoneNumber = interface;
  AKFAccount = interface;
  AKFAccountPreferencesDelegate = interface;
  AKFAccountPreferences = interface;
  AKFAdvancedUIActionController = interface;
  AKFAdvancedUIManager = interface;
  AKFAdvancedUIManaging = interface;
  AKFConfiguring = interface;
  AKFTheme = interface;
  AKFTheming = interface;
  AKFViewControllerDelegate = interface;
  AKFViewController = interface;
  AKFAccountKit = interface;
  AKFSettings = interface;

  // ===== Framework typedefs =====
{$M+}
  NSTimeInterval = Double;
  NSUInteger = Cardinal;
  AKFResponseType = NSUInteger;
  AKFButtonType = NSUInteger;
  AKFLoginFlowState = NSUInteger;
  AKFTextPosition = NSUInteger;
  AKFLoginType = NSUInteger;
  AKFRequestAccountHandler = procedure(param1: Pointer; param2: NSError)
    of object;
  NSInteger = Integer;
  AKFErrorCode = NSInteger;
  AKFServerErrorCode = NSInteger;
  AKFLoginRequestInvalidatedErrorCode = NSInteger;
  AKFInvalidParameterValueErrorCode = NSInteger;
  AKFServerResponseErrorCode = NSInteger;
  AKFHeaderTextType = NSUInteger;
  UIStatusBarStyle = NSInteger;
  CGFloat = Single;
  // ===== Interface declarations =====

  AKFPhoneNumberClass = interface(NSObjectClass)
    ['{B9909A4D-1580-4C65-9BDC-A95E9E8664DD}']
  end;

  AKFPhoneNumber = interface(NSObject)
    ['{F01435DC-6A4B-49C1-9787-2113DAF43CFE}']
    function initWithCountryCode(countryCode: NSString; phoneNumber: NSString)
      : Pointer { instancetype }; cdecl;
    function countryCode: NSString; cdecl;
    function phoneNumber: NSString; cdecl;
    function isEqualToPhoneNumber(phoneNumber: AKFPhoneNumber): Boolean; cdecl;
    function stringRepresentation: NSString; cdecl;
  end;

  TAKFPhoneNumber = class(TOCGenericImport<AKFPhoneNumberClass, AKFPhoneNumber>)
  end;

  PAKFPhoneNumber = Pointer;

  AKFAccountPreferencesClass = interface(NSObjectClass)
    ['{FBFF6445-0940-4A9D-93C7-7857D18AC314}']
  end;

  AKFAccountPreferences = interface(NSObject)
    ['{086C4305-8953-47BF-B79F-01DF7A627BDA}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure deletePreferenceForKey(key: NSString); cdecl;
    procedure loadPreferenceForKey(key: NSString); cdecl;
    procedure loadPreferences; cdecl;
    procedure setPreferenceForKey(key: NSString; value: NSString); cdecl;
  end;

  TAKFAccountPreferences = class(TOCGenericImport<AKFAccountPreferencesClass,
    AKFAccountPreferences>)
  end;

  PAKFAccountPreferences = Pointer;

  AKFThemeClass = interface(NSObjectClass)
    ['{6721EE2F-A0F2-4B0F-9BDE-8123EEE4C645}']
    { class } function defaultTheme: Pointer { instancetype }; cdecl;
    { class } function outlineTheme: Pointer { instancetype }; cdecl;
    { class } function outlineThemeWithPrimaryColor(primaryColor: UIColor;
      primaryTextColor: UIColor; secondaryTextColor: UIColor;
      statusBarStyle: UIStatusBarStyle): Pointer { instancetype }; cdecl;
    { class } function themeWithPrimaryColor(primaryColor: UIColor;
      primaryTextColor: UIColor; secondaryColor: UIColor;
      secondaryTextColor: UIColor; statusBarStyle: UIStatusBarStyle)
      : Pointer { instancetype }; cdecl;
  end;

  AKFTheme = interface(NSObject)
    ['{4288DDCD-30A5-41AF-86FC-78668C84E5AA}']
    procedure setBackgroundColor(backgroundColor: UIColor); cdecl;
    function backgroundColor: UIColor; cdecl;
    procedure setBackgroundImage(backgroundImage: UIImage); cdecl;
    function backgroundImage: UIImage; cdecl;
    procedure setButtonBackgroundColor(buttonBackgroundColor: UIColor); cdecl;
    function buttonBackgroundColor: UIColor; cdecl;
    procedure setButtonBorderColor(buttonBorderColor: UIColor); cdecl;
    function buttonBorderColor: UIColor; cdecl;
    procedure setButtonDisabledBackgroundColor(buttonDisabledBackgroundColor
      : UIColor); cdecl;
    function buttonDisabledBackgroundColor: UIColor; cdecl;
    procedure setButtonDisabledBorderColor(buttonDisabledBorderColor
      : UIColor); cdecl;
    function buttonDisabledBorderColor: UIColor; cdecl;
    procedure setButtonDisabledTextColor(buttonDisabledTextColor
      : UIColor); cdecl;
    function buttonDisabledTextColor: UIColor; cdecl;
    procedure setButtonHighlightedBackgroundColor
      (buttonHighlightedBackgroundColor: UIColor); cdecl;
    function buttonHighlightedBackgroundColor: UIColor; cdecl;
    procedure setButtonHighlightedBorderColor(buttonHighlightedBorderColor
      : UIColor); cdecl;
    function buttonHighlightedBorderColor: UIColor; cdecl;
    procedure setButtonHighlightedTextColor(buttonHighlightedTextColor
      : UIColor); cdecl;
    function buttonHighlightedTextColor: UIColor; cdecl;
    procedure setButtonTextColor(buttonTextColor: UIColor); cdecl;
    function buttonTextColor: UIColor; cdecl;
    procedure setContentBodyLayoutWeight(contentBodyLayoutWeight
      : NSUInteger); cdecl;
    function contentBodyLayoutWeight: NSUInteger; cdecl;
    procedure setContentBottomLayoutWeight(contentBottomLayoutWeight
      : NSUInteger); cdecl;
    function contentBottomLayoutWeight: NSUInteger; cdecl;
    procedure setContentFooterLayoutWeight(contentFooterLayoutWeight
      : NSUInteger); cdecl;
    function contentFooterLayoutWeight: NSUInteger; cdecl;
    procedure setContentHeaderLayoutWeight(contentHeaderLayoutWeight
      : NSUInteger); cdecl;
    function contentHeaderLayoutWeight: NSUInteger; cdecl;
    procedure setContentMarginLeft(contentMarginLeft: CGFloat); cdecl;
    function contentMarginLeft: CGFloat; cdecl;
    procedure setContentMarginRight(contentMarginRight: CGFloat); cdecl;
    function contentMarginRight: CGFloat; cdecl;
    procedure setContentMaxWidth(contentMaxWidth: CGFloat); cdecl;
    function contentMaxWidth: CGFloat; cdecl;
    procedure setContentMinHeight(contentMinHeight: CGFloat); cdecl;
    function contentMinHeight: CGFloat; cdecl;
    procedure setContentTextLayoutWeight(contentTextLayoutWeight
      : NSUInteger); cdecl;
    function contentTextLayoutWeight: NSUInteger; cdecl;
    procedure setContentTopLayoutWeight(contentTopLayoutWeight
      : NSUInteger); cdecl;
    function contentTopLayoutWeight: NSUInteger; cdecl;
    procedure setHeaderBackgroundColor(headerBackgroundColor: UIColor); cdecl;
    function headerBackgroundColor: UIColor; cdecl;
    procedure setHeaderButtonTextColor(headerButtonTextColor: UIColor); cdecl;
    function headerButtonTextColor: UIColor; cdecl;
    procedure setHeaderTextColor(headerTextColor: UIColor); cdecl;
    function headerTextColor: UIColor; cdecl;
    procedure setHeaderTextType(headerTextType: AKFHeaderTextType); cdecl;
    function headerTextType: AKFHeaderTextType; cdecl;
    procedure setIconColor(iconColor: UIColor); cdecl;
    function iconColor: UIColor; cdecl;
    procedure setInputBackgroundColor(inputBackgroundColor: UIColor); cdecl;
    function inputBackgroundColor: UIColor; cdecl;
    procedure setInputBorderColor(inputBorderColor: UIColor); cdecl;
    function inputBorderColor: UIColor; cdecl;
    procedure setInputTextColor(inputTextColor: UIColor); cdecl;
    function inputTextColor: UIColor; cdecl;
    procedure setStatusBarStyle(statusBarStyle: UIStatusBarStyle); cdecl;
    function statusBarStyle: UIStatusBarStyle; cdecl;
    procedure setTextColor(textColor: UIColor); cdecl;
    function textColor: UIColor; cdecl;
    procedure setTitleColor(titleColor: UIColor); cdecl;
    function titleColor: UIColor; cdecl;
    function isEqualToTheme(theme: AKFTheme): Boolean; cdecl;
  end;

  TAKFTheme = class(TOCGenericImport<AKFThemeClass, AKFTheme>)
  end;

  PAKFTheme = Pointer;

  AKFAccountKitClass = interface(NSObjectClass)
    ['{1064F823-D5B0-48B0-A927-7054556763EC}']
    { class } function graphVersionString: NSString; cdecl;
    { class } function versionString: NSString; cdecl;
  end;

  AKFAccountKit = interface(NSObject)
    ['{0CC53F3E-C857-43B3-AA07-1FFFCF718F70}']
    function currentAccessToken: Pointer; cdecl;
    function initWithResponseType(responseType: AKFResponseType)
      : Pointer { instancetype }; cdecl;
    function accountPreferences: AKFAccountPreferences; cdecl;
    procedure cancelLogin; cdecl;
    procedure logOut; cdecl;
    procedure requestAccount(handler: AKFRequestAccountHandler); cdecl;
    function viewControllerForEmailLogin: UIViewController; cdecl;
    function viewControllerForEmailLoginWithEmail(email: NSString;
      state: NSString): UIViewController; cdecl;
    function viewControllerForPhoneLogin: UIViewController; cdecl;
    function viewControllerForPhoneLoginWithPhoneNumber
      (phoneNumber: AKFPhoneNumber; state: NSString): UIViewController; cdecl;
    function viewControllerForLoginResume: UIViewController; cdecl;
  end;

  TAKFAccountKit = class(TOCGenericImport<AKFAccountKitClass, AKFAccountKit>)
  end;

  PAKFAccountKit = Pointer;

  AKFSettingsClass = interface(NSObjectClass)
    ['{812A9CA4-F114-4521-A485-F57A406066DA}']
    { class } function clientToken: NSString; cdecl;
    { class } procedure setClientToken(clientToken: NSString); cdecl;
  end;

  AKFSettings = interface(NSObject)
    ['{07AEE104-E670-4862-A67E-7F85872933F9}']
  end;

  TAKFSettings = class(TOCGenericImport<AKFSettingsClass, AKFSettings>)
  end;

  PAKFSettings = Pointer;

  // ===== Protocol declarations =====

  AKFAccessToken = interface(IObjectiveC)
    ['{60F884D5-03C2-4696-8B0C-5D898BA4F4C9}']
    function accountID: NSString; cdecl;
    function applicationID: NSString; cdecl;
    function lastRefresh: NSDate; cdecl;
    function tokenRefreshInterval: NSTimeInterval; cdecl;
    function tokenString: NSString; cdecl;
  end;

  AKFAccount = interface(IObjectiveC)
    ['{549BC6C8-F0FB-4B35-AD8F-E659DEC29035}']
    function accountID: NSString; cdecl;
    function emailAddress: NSString; cdecl;
    function phoneNumber: AKFPhoneNumber; cdecl;
  end;

  AKFAccountPreferencesDelegate = interface(IObjectiveC)
    ['{FB3C93AB-1809-4F21-9BAE-C231B84A30AA}']
    [MethodName('accountPreferences:didDeletePreferenceForKey:error:')]
    procedure accountPreferencesDidDeletePreferenceForKeyError
      (accountPreferences: AKFAccountPreferences;
      didDeletePreferenceForKey: NSString; error: NSError); cdecl;
    [MethodName('accountPreferences:didLoadPreferences:error:')]
    procedure accountPreferencesDidLoadPreferencesError(accountPreferences
      : AKFAccountPreferences; didLoadPreferences: NSDictionary;
      error: NSError); cdecl;
    [MethodName('accountPreferences:didLoadPreferenceForKey:value:error:')]
    procedure accountPreferencesDidLoadPreferenceForKeyValueError
      (accountPreferences: AKFAccountPreferences;
      didLoadPreferenceForKey: NSString; value: NSString;
      error: NSError); cdecl;
    [MethodName('accountPreferences:didSetPreferenceForKey:value:error:')]
    procedure accountPreferencesDidSetPreferenceForKeyValueError
      (accountPreferences: AKFAccountPreferences;
      didSetPreferenceForKey: NSString; value: NSString; error: NSError); cdecl;
  end;

  AKFAdvancedUIActionController = interface(IObjectiveC)
    ['{612CFEA9-E0D7-4E71-8E53-6C3ABB3E25F0}']
    procedure back; cdecl;
    procedure cancel; cdecl;
  end;

  AKFAdvancedUIManager = interface(IObjectiveC)
    ['{C58D0297-A019-416E-8E49-78003D800E10}']
    function actionBarViewForState(state: AKFLoginFlowState): UIView; cdecl;
    function bodyViewForState(state: AKFLoginFlowState): UIView; cdecl;
    function buttonTypeForState(state: AKFLoginFlowState): AKFButtonType; cdecl;
    function footerViewForState(state: AKFLoginFlowState): UIView; cdecl;
    function headerViewForState(state: AKFLoginFlowState): UIView; cdecl;
    procedure setActionController(actionController: Pointer); cdecl;
    procedure setError(error: NSError); cdecl;
    function textPositionForState(state: AKFLoginFlowState)
      : AKFTextPosition; cdecl;
  end;

  AKFAdvancedUIManaging = interface(IObjectiveC)
    ['{9C499131-1872-413D-9C51-911BF3C286AE}']
    procedure setAdvancedUIManager(advancedUIManager: Pointer); cdecl;
    function advancedUIManager: Pointer; cdecl;
  end;

  AKFConfiguring = interface(IObjectiveC)
    ['{669AE40E-8DF1-4F20-BEC7-C8A222DE0EF6}']
    procedure setBlacklistedCountryCodes(blacklistedCountryCodes
      : NSArray); cdecl;
    function blacklistedCountryCodes: NSArray; cdecl;
    procedure setDefaultCountryCode(defaultCountryCode: NSString); cdecl;
    function defaultCountryCode: NSString; cdecl;
    procedure setEnableSendToFacebook(enableSendToFacebook: Boolean); cdecl;
    function enableSendToFacebook: Boolean; cdecl;
    procedure setWhitelistedCountryCodes(whitelistedCountryCodes
      : NSArray); cdecl;
    function whitelistedCountryCodes: NSArray; cdecl;
  end;

  AKFTheming = interface(IObjectiveC)
    ['{BD2DE545-64FF-4BDD-8AD3-976D43AA687B}']
    procedure setTheme(theme: AKFTheme); cdecl;
    function theme: AKFTheme; cdecl;
  end;

  AKFViewControllerDelegate = interface(IObjectiveC)
    ['{CBAD2742-FEB8-4297-80C0-DA840F3A8FDD}']
    [MethodName('viewController:didCompleteLoginWithAuthorizationCode:state:')]
    procedure viewControllerDidCompleteLoginWithAuthorizationCodeState
      (viewController: UIViewController;
      didCompleteLoginWithAuthorizationCode: NSString; state: NSString); cdecl;
    [MethodName('viewController:didCompleteLoginWithAccessToken:state:')]
    procedure viewControllerDidCompleteLoginWithAccessTokenState
      (viewController: UIViewController;
      didCompleteLoginWithAccessToken: Pointer; state: NSString); cdecl;
    [MethodName('viewController:didFailWithError:')]
    procedure viewControllerDidFailWithError(viewController: UIViewController;
      didFailWithError: NSError); cdecl;
    procedure viewControllerDidCancel(viewController: UIViewController); cdecl;
  end;

  AKFViewController = interface(IObjectiveC)
    ['{642BEE14-B5BA-4695-85B3-FF6258710009}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function loginType: AKFLoginType; cdecl;
  end;

  // ===== Exported string consts =====

function AKFButtonTypeCount: Pointer;
function AKFLoginFlowStateCount: Pointer;
function AKFTextPositionCount: Pointer;
function AKFErrorDomain: NSString;
function AKFErrorDeveloperMessageKey: NSString;
function AKFErrorUserMessageKey: NSString;
function AKFErrorObjectKey: NSString;
function AKFServerErrorDomain: NSString;
function AKFHeaderTextTypeCount: Pointer;


// ===== External functions =====

const
  libAccountKit = '/System/Library/Frameworks/AccountKit.framework/AccountKit';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  AccountKitModule: THandle;

{$ENDIF IOS}

function AKFErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libAccountKit, 'AKFErrorDomain');
end;

function AKFErrorDeveloperMessageKey: NSString;
begin
  Result := CocoaNSStringConst(libAccountKit, 'AKFErrorDeveloperMessageKey');
end;

function AKFErrorUserMessageKey: NSString;
begin
  Result := CocoaNSStringConst(libAccountKit, 'AKFErrorUserMessageKey');
end;

function AKFErrorObjectKey: NSString;
begin
  Result := CocoaNSStringConst(libAccountKit, 'AKFErrorObjectKey');
end;

function AKFServerErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libAccountKit, 'AKFServerErrorDomain');
end;

function AKFButtonTypeCount: Pointer;
begin
  Result := CocoaPointerConst(libAccountKit, 'AKFButtonTypeCount');
end;

function AKFLoginFlowStateCount: Pointer;
begin
  Result := CocoaPointerConst(libAccountKit, 'AKFLoginFlowStateCount');
end;

function AKFTextPositionCount: Pointer;
begin
  Result := CocoaPointerConst(libAccountKit, 'AKFTextPositionCount');
end;

function AKFHeaderTextTypeCount: Pointer;
begin
  Result := CocoaPointerConst(libAccountKit, 'AKFHeaderTextTypeCount');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

AccountKitModule := dlopen(MarshaledAString(libAccountKit), RTLD_LAZY);

finalization

dlclose(AccountKitModule);
{$ENDIF IOS}

end.
