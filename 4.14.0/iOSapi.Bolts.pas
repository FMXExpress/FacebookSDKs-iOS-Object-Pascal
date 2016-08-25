{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework Bolts
//

unit iOSapi.Bolts;

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
  BFAppLinkNavigationTypeFailure = 0;
  BFAppLinkNavigationTypeBrowser = 1;
  BFAppLinkNavigationTypeApp = 2;
  BFIncludeStatusBarInSizeNever = 0;
  BFIncludeStatusBarInSizeIOS7AndLater = 1;
  BFIncludeStatusBarInSizeAlways = 2;

type

  // ===== Forward declarations =====
{$M+}
  BFAppLink = interface;
  BFAppLinkResolving = interface;
  BFTask = interface;
  BFAppLinkNavigation = interface;
  BFAppLinkReturnToRefererView = interface;
  BFURL = interface;
  BFAppLinkReturnToRefererViewDelegate = interface;
  BFAppLinkReturnToRefererController = interface;
  BFAppLinkReturnToRefererControllerDelegate = interface;
  BFAppLinkTarget = interface;
  BFCancellationTokenRegistration = interface;
  BFCancellationToken = interface;
  BFCancellationTokenSource = interface;
  BFExecutor = interface;
  BFMeasurementEvent = interface;
  BFTaskCompletionSource = interface;
  BFWebViewAppLinkResolver = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  BFAppLinkNavigationType = NSInteger;
  NSUInteger = Cardinal;
  BFIncludeStatusBarInSize = NSUInteger;
  BFCancellationBlock = procedure() of object;
  TBoltsBlock = procedure() of object;
  TBoltsBlock1 = procedure(param1: TBoltsBlock) of object;
  dispatch_queue_t = Pointer;
  ResultType = Pointer;
  TBoltsWithBlock = function(): Pointer; cdecl;
  BFContinuationBlock = function(param1: BFTask): Pointer; cdecl;
  // ===== Interface declarations =====

  BFAppLinkClass = interface(NSObjectClass)
    ['{015C4EB6-81E1-4BFD-B790-754A742ACFD3}']
    { class } function appLinkWithSourceURL(sourceURL: NSURL; targets: NSArray;
      webURL: NSURL): Pointer { instancetype }; cdecl;
  end;

  BFAppLink = interface(NSObject)
    ['{D966A5F6-13B1-4EE0-99B6-C75A32E2CD59}']
    function sourceURL: NSURL; cdecl;
    function targets: NSArray; cdecl;
    function webURL: NSURL; cdecl;
  end;

  TBFAppLink = class(TOCGenericImport<BFAppLinkClass, BFAppLink>)
  end;

  PBFAppLink = Pointer;

  BFTaskClass = interface(NSObjectClass)
    ['{FB514AD5-3EE2-4E8F-8A26-F35AE3B657F4}']
    { class } function taskWithResult(result: ResultType)
      : Pointer { instancetype }; cdecl;
    { class } function taskWithError(error: NSError)
      : Pointer { instancetype }; cdecl;
    { class } function taskWithException(exception: NSException)
      : Pointer { instancetype }; cdecl;
    { class } function cancelledTask: Pointer { instancetype }; cdecl;
    { class } function taskForCompletionOfAllTasks(tasks: NSArray)
      : Pointer { instancetype }; cdecl;
    { class } function taskForCompletionOfAllTasksWithResults(tasks: NSArray)
      : Pointer { instancetype }; cdecl;
    { class } function taskForCompletionOfAnyTask(tasks: NSArray)
      : Pointer { instancetype }; cdecl;
    [MethodName('taskWithDelay:')]
    { class } function taskWithDelay(millis: Integer)
      : Pointer { instancetype }; cdecl;
    [MethodName('taskWithDelay:cancellationToken:')]
    { class } function taskWithDelayCancellationToken(millis: Integer;
      cancellationToken: BFCancellationToken): Pointer { instancetype }; cdecl;
    { class } function taskFromExecutor(executor: BFExecutor;
      withBlock: TBoltsWithBlock): Pointer { instancetype }; cdecl;
  end;

  BFTask = interface(NSObject)
    ['{328220BE-748A-4A64-ABA8-ECD748ECD7F5}']
    function result: ResultType; cdecl;
    function error: NSError; cdecl;
    function exception: NSException; cdecl;
    function isCancelled: Boolean; cdecl;
    function isFaulted: Boolean; cdecl;
    function isCompleted: Boolean; cdecl;
    [MethodName('continueWithBlock:')]
    function continueWithBlock(block: BFContinuationBlock): BFTask; cdecl;
    [MethodName('continueWithBlock:cancellationToken:')]
    function continueWithBlockCancellationToken(block: BFContinuationBlock;
      cancellationToken: BFCancellationToken): BFTask; cdecl;
    [MethodName('continueWithExecutor:withBlock:')]
    function continueWithExecutorWithBlock(executor: BFExecutor;
      withBlock: BFContinuationBlock): BFTask; cdecl;
    [MethodName('continueWithExecutor:block:cancellationToken:')]
    function continueWithExecutorBlockCancellationToken(executor: BFExecutor;
      block: BFContinuationBlock; cancellationToken: BFCancellationToken)
      : BFTask; cdecl;
    [MethodName('continueWithSuccessBlock:')]
    function continueWithSuccessBlock(block: BFContinuationBlock)
      : BFTask; cdecl;
    [MethodName('continueWithSuccessBlock:cancellationToken:')]
    function continueWithSuccessBlockCancellationToken
      (block: BFContinuationBlock; cancellationToken: BFCancellationToken)
      : BFTask; cdecl;
    [MethodName('continueWithExecutor:withSuccessBlock:')]
    function continueWithExecutorWithSuccessBlock(executor: BFExecutor;
      withSuccessBlock: BFContinuationBlock): BFTask; cdecl;
    [MethodName('continueWithExecutor:successBlock:cancellationToken:')]
    function continueWithExecutorSuccessBlockCancellationToken
      (executor: BFExecutor; successBlock: BFContinuationBlock;
      cancellationToken: BFCancellationToken): BFTask; cdecl;
    procedure waitUntilFinished; cdecl;
  end;

  TBFTask = class(TOCGenericImport<BFTaskClass, BFTask>)
  end;

  PBFTask = Pointer;

  BFAppLinkNavigationClass = interface(NSObjectClass)
    ['{C5A356A7-5801-4BF9-A071-7A8848087C94}']
    { class } function navigationWithAppLink(appLink: BFAppLink;
      extras: NSDictionary; appLinkData: NSDictionary)
      : Pointer { instancetype }; cdecl;
    [MethodName('resolveAppLinkInBackground:')]
    { class } function resolveAppLinkInBackground(destination: NSURL)
      : BFTask; cdecl;
    [MethodName('resolveAppLinkInBackground:resolver:')]
    { class } function resolveAppLinkInBackgroundResolver(destination: NSURL;
      resolver: Pointer): BFTask; cdecl;
    { class } function navigateToAppLink(link: BFAppLink; error: NSError)
      : BFAppLinkNavigationType; cdecl;
    [MethodName('navigateToURLInBackground:')]
    { class } function navigateToURLInBackground(destination: NSURL)
      : BFTask; cdecl;
    [MethodName('navigateToURLInBackground:resolver:')]
    { class } function navigateToURLInBackgroundResolver(destination: NSURL;
      resolver: Pointer): BFTask; cdecl;
    { class } function defaultResolver: Pointer; cdecl;
    { class } procedure setDefaultResolver(resolver: Pointer); cdecl;
  end;

  BFAppLinkNavigation = interface(NSObject)
    ['{18459E92-AD69-4AAD-8E03-A0B9992FDC17}']
    function extras: NSDictionary; cdecl;
    function appLinkData: NSDictionary; cdecl;
    function appLink: BFAppLink; cdecl;
    function navigate(error: NSError): BFAppLinkNavigationType; cdecl;
  end;

  TBFAppLinkNavigation = class(TOCGenericImport<BFAppLinkNavigationClass,
    BFAppLinkNavigation>)
  end;

  PBFAppLinkNavigation = Pointer;

  BFAppLinkReturnToRefererViewClass = interface(UIViewClass)
    ['{2C319CE8-A00B-4B14-A231-A8703495C5B6}']
  end;

  BFAppLinkReturnToRefererView = interface(UIView)
    ['{ADC7D6A0-E951-4351-AC5D-CB8C429208E4}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setTextColor(textColor: UIColor); cdecl;
    function textColor: UIColor; cdecl;
    procedure setRefererAppLink(refererAppLink: BFAppLink); cdecl;
    function refererAppLink: BFAppLink; cdecl;
    procedure setIncludeStatusBarInSize(includeStatusBarInSize
      : BFIncludeStatusBarInSize); cdecl;
    function includeStatusBarInSize: BFIncludeStatusBarInSize; cdecl;
    procedure setClosed(closed: Boolean); cdecl;
    function closed: Boolean; cdecl;
  end;

  TBFAppLinkReturnToRefererView = class
    (TOCGenericImport<BFAppLinkReturnToRefererViewClass,
    BFAppLinkReturnToRefererView>)
  end;

  PBFAppLinkReturnToRefererView = Pointer;

  BFURLClass = interface(NSObjectClass)
    ['{C4329BA5-FE13-46EA-A20C-D73B27DDF4D6}']
    { class } function URLWithURL(url: NSURL): BFURL; cdecl;
    { class } function URLWithInboundURL(url: NSURL;
      sourceApplication: NSString): BFURL; cdecl;
  end;

  BFURL = interface(NSObject)
    ['{5C86A3F7-FF88-4B99-872F-B6169FE76412}']
    function targetURL: NSURL; cdecl;
    function targetQueryParameters: NSDictionary; cdecl;
    function appLinkData: NSDictionary; cdecl;
    function appLinkExtras: NSDictionary; cdecl;
    function appLinkReferer: BFAppLink; cdecl;
    function inputURL: NSURL; cdecl;
    function inputQueryParameters: NSDictionary; cdecl;
  end;

  TBFURL = class(TOCGenericImport<BFURLClass, BFURL>)
  end;

  PBFURL = Pointer;

  BFAppLinkReturnToRefererControllerClass = interface(NSObjectClass)
    ['{531C61F7-9C03-4441-B157-35F8344417B7}']
  end;

  BFAppLinkReturnToRefererController = interface(NSObject)
    ['{272FD441-2D44-4CD0-A22F-34450881843D}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setView(view: BFAppLinkReturnToRefererView); cdecl;
    function view: BFAppLinkReturnToRefererView; cdecl;
    function init: Pointer { instancetype }; cdecl;
    function initForDisplayAboveNavController(navController
      : UINavigationController): Pointer { instancetype }; cdecl;
    procedure removeFromNavController; cdecl;
    procedure showViewForRefererAppLink(refererAppLink: BFAppLink); cdecl;
    procedure showViewForRefererURL(url: NSURL); cdecl;
    procedure closeViewAnimated(animated: Boolean); cdecl;
  end;

  TBFAppLinkReturnToRefererController = class
    (TOCGenericImport<BFAppLinkReturnToRefererControllerClass,
    BFAppLinkReturnToRefererController>)
  end;

  PBFAppLinkReturnToRefererController = Pointer;

  BFAppLinkTargetClass = interface(NSObjectClass)
    ['{9B3CA429-D597-42C1-A8B2-4D41687D699D}']
    { class } function appLinkTargetWithURL(url: NSURL; appStoreId: NSString;
      appName: NSString): Pointer { instancetype }; cdecl;
  end;

  BFAppLinkTarget = interface(NSObject)
    ['{C4045630-C1EC-4319-9488-D67191E0D94C}']
    function url: NSURL; cdecl;
    function appStoreId: NSString; cdecl;
    function appName: NSString; cdecl;
  end;

  TBFAppLinkTarget = class(TOCGenericImport<BFAppLinkTargetClass,
    BFAppLinkTarget>)
  end;

  PBFAppLinkTarget = Pointer;

  BFCancellationTokenRegistrationClass = interface(NSObjectClass)
    ['{0E4F77CC-16C1-456D-91FC-8E2285A41796}']
  end;

  BFCancellationTokenRegistration = interface(NSObject)
    ['{70708D9E-B0A3-419C-B326-C394D606CE00}']
    procedure dispose; cdecl;
  end;

  TBFCancellationTokenRegistration = class
    (TOCGenericImport<BFCancellationTokenRegistrationClass,
    BFCancellationTokenRegistration>)
  end;

  PBFCancellationTokenRegistration = Pointer;

  BFCancellationTokenClass = interface(NSObjectClass)
    ['{3F7C82FA-BDE3-4C81-9C5C-5BDDE8357E9D}']
  end;

  BFCancellationToken = interface(NSObject)
    ['{70159974-1527-4C31-AF24-5B990BCA09C7}']
    function isCancellationRequested: Boolean; cdecl;
    function registerCancellationObserverWithBlock(block: BFCancellationBlock)
      : BFCancellationTokenRegistration; cdecl;
  end;

  TBFCancellationToken = class(TOCGenericImport<BFCancellationTokenClass,
    BFCancellationToken>)
  end;

  PBFCancellationToken = Pointer;

  BFCancellationTokenSourceClass = interface(NSObjectClass)
    ['{1773A2D6-CF56-44FF-B7AE-7B2C7381C637}']
    { class } function cancellationTokenSource: Pointer { instancetype }; cdecl;
  end;

  BFCancellationTokenSource = interface(NSObject)
    ['{1229B241-8C51-4116-9418-F22AA8ABC8BF}']
    function token: BFCancellationToken; cdecl;
    function isCancellationRequested: Boolean; cdecl;
    procedure cancel; cdecl;
    procedure cancelAfterDelay(millis: Integer); cdecl;
    procedure dispose; cdecl;
  end;

  TBFCancellationTokenSource = class
    (TOCGenericImport<BFCancellationTokenSourceClass,
    BFCancellationTokenSource>)
  end;

  PBFCancellationTokenSource = Pointer;

  BFExecutorClass = interface(NSObjectClass)
    ['{BB600421-426C-4B05-A038-BA39CD5A23B6}']
    { class } function defaultExecutor: Pointer { instancetype }; cdecl;
    { class } function immediateExecutor: Pointer { instancetype }; cdecl;
    { class } function mainThreadExecutor: Pointer { instancetype }; cdecl;
    { class } function executorWithBlock(block: TBoltsBlock1)
      : Pointer { instancetype }; cdecl;
    { class } function executorWithDispatchQueue(queue: dispatch_queue_t)
      : Pointer { instancetype }; cdecl;
    { class } function executorWithOperationQueue(queue: NSOperationQueue)
      : Pointer { instancetype }; cdecl;
  end;

  BFExecutor = interface(NSObject)
    ['{A669436B-DE86-43C8-8008-A4B02AC43E16}']
    procedure execute(block: TBoltsBlock); cdecl;
  end;

  TBFExecutor = class(TOCGenericImport<BFExecutorClass, BFExecutor>)
  end;

  PBFExecutor = Pointer;

  BFMeasurementEventClass = interface(NSObjectClass)
    ['{C22A6A46-801B-4F74-BA7B-A75306A3CCF8}']
  end;

  BFMeasurementEvent = interface(NSObject)
    ['{052C774D-FE03-48D8-A6CF-95619ACEB6E7}']
  end;

  TBFMeasurementEvent = class(TOCGenericImport<BFMeasurementEventClass,
    BFMeasurementEvent>)
  end;

  PBFMeasurementEvent = Pointer;

  BFTaskCompletionSourceClass = interface(NSObjectClass)
    ['{5774D568-6196-4BA6-955E-5BE7C4A8865A}']
    { class } function taskCompletionSource: Pointer { instancetype }; cdecl;
  end;

  BFTaskCompletionSource = interface(NSObject)
    ['{603A1A74-9B6E-46A2-A3CE-88A8DCF9DDA0}']
    function task: BFTask; cdecl;
    procedure setResult(result: ResultType); cdecl;
    procedure setError(error: NSError); cdecl;
    procedure setException(exception: NSException); cdecl;
    procedure cancel; cdecl;
    function trySetResult(result: ResultType): Boolean; cdecl;
    function trySetError(error: NSError): Boolean; cdecl;
    function trySetException(exception: NSException): Boolean; cdecl;
    function trySetCancelled: Boolean; cdecl;
  end;

  TBFTaskCompletionSource = class(TOCGenericImport<BFTaskCompletionSourceClass,
    BFTaskCompletionSource>)
  end;

  PBFTaskCompletionSource = Pointer;

  BFWebViewAppLinkResolverClass = interface(NSObjectClass)
    ['{29A119CC-1B22-479D-B264-60E3625093B8}']
    { class } function sharedInstance: Pointer { instancetype }; cdecl;
  end;

  BFWebViewAppLinkResolver = interface(NSObject)
    ['{9D919248-7E12-4C2B-841C-E9D8594E192B}']
  end;

  TBFWebViewAppLinkResolver = class
    (TOCGenericImport<BFWebViewAppLinkResolverClass, BFWebViewAppLinkResolver>)
  end;

  PBFWebViewAppLinkResolver = Pointer;

  // ===== Protocol declarations =====

  BFAppLinkResolving = interface(IObjectiveC)
    ['{29BCCCEF-4800-4BED-BBDC-FD9B4888644E}']
    function appLinkFromURLInBackground(url: NSURL): BFTask; cdecl;
  end;

  BFAppLinkReturnToRefererViewDelegate = interface(IObjectiveC)
    ['{86EF9722-7263-42CF-9B55-145A6429988C}']
    procedure returnToRefererViewDidTapInsideCloseButton
      (view: BFAppLinkReturnToRefererView); cdecl;
    procedure returnToRefererViewDidTapInsideLink
      (view: BFAppLinkReturnToRefererView; link: BFAppLink); cdecl;
  end;

  BFAppLinkReturnToRefererControllerDelegate = interface(IObjectiveC)
    ['{EBB9EA82-567B-46E9-B873-89684A12B44C}']
    [MethodName('returnToRefererController:willNavigateToAppLink:')]
    procedure returnToRefererControllerWillNavigateToAppLink
      (controller: BFAppLinkReturnToRefererController;
      willNavigateToAppLink: BFAppLink); cdecl;
    [MethodName('returnToRefererController:didNavigateToAppLink:type:')]
    procedure returnToRefererControllerDidNavigateToAppLinkType
      (controller: BFAppLinkReturnToRefererController;
      didNavigateToAppLink: BFAppLink; &type: BFAppLinkNavigationType); cdecl;
  end;

  // ===== Exported string consts =====

function BFAppLinkVersion: NSString;
function BFMeasurementEventNotificationName: NSString;
function BFMeasurementEventNameKey: NSString;
function BFMeasurementEventArgsKey: NSString;
function BFAppLinkParseEventName: NSString;
function BFAppLinkNavigateInEventName: NSString;
function BFAppLinkNavigateOutEventName: NSString;
function BFAppLinkNavigateBackToReferrerEventName: NSString;
function BFTaskErrorDomain: NSString;
function kBFMultipleErrorsError: Pointer;
function BFTaskMultipleExceptionsException: NSString;
function BFTaskMultipleErrorsUserInfoKey: NSString;
function BFTaskMultipleExceptionsUserInfoKey: NSString;
function BoltsFrameworkVersionString: NSString;


// ===== External functions =====

const
  libBolts = '/System/Library/Frameworks/Bolts.framework/Bolts';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  BoltsModule: THandle;

{$ENDIF IOS}

function BFAppLinkVersion: NSString;
begin
  result := CocoaNSStringConst(libBolts, 'BFAppLinkVersion');
end;

function BFMeasurementEventNotificationName: NSString;
begin
  result := CocoaNSStringConst(libBolts, 'BFMeasurementEventNotificationName');
end;

function BFMeasurementEventNameKey: NSString;
begin
  result := CocoaNSStringConst(libBolts, 'BFMeasurementEventNameKey');
end;

function BFMeasurementEventArgsKey: NSString;
begin
  result := CocoaNSStringConst(libBolts, 'BFMeasurementEventArgsKey');
end;

function BFAppLinkParseEventName: NSString;
begin
  result := CocoaNSStringConst(libBolts, 'BFAppLinkParseEventName');
end;

function BFAppLinkNavigateInEventName: NSString;
begin
  result := CocoaNSStringConst(libBolts, 'BFAppLinkNavigateInEventName');
end;

function BFAppLinkNavigateOutEventName: NSString;
begin
  result := CocoaNSStringConst(libBolts, 'BFAppLinkNavigateOutEventName');
end;

function BFAppLinkNavigateBackToReferrerEventName: NSString;
begin
  result := CocoaNSStringConst(libBolts,
    'BFAppLinkNavigateBackToReferrerEventName');
end;

function BFTaskErrorDomain: NSString;
begin
  result := CocoaNSStringConst(libBolts, 'BFTaskErrorDomain');
end;

function BFTaskMultipleExceptionsException: NSString;
begin
  result := CocoaNSStringConst(libBolts, 'BFTaskMultipleExceptionsException');
end;

function BFTaskMultipleErrorsUserInfoKey: NSString;
begin
  result := CocoaNSStringConst(libBolts, 'BFTaskMultipleErrorsUserInfoKey');
end;

function BFTaskMultipleExceptionsUserInfoKey: NSString;
begin
  result := CocoaNSStringConst(libBolts, 'BFTaskMultipleExceptionsUserInfoKey');
end;

function BoltsFrameworkVersionString: NSString;
begin
  result := CocoaNSStringConst(libBolts, 'BoltsFrameworkVersionString');
end;

function kBFMultipleErrorsError: Pointer;
begin
  result := CocoaPointerConst(libBolts, 'kBFMultipleErrorsError');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

BoltsModule := dlopen(MarshaledAString(libBolts), RTLD_LAZY);

finalization

dlclose(BoltsModule);
{$ENDIF IOS}

end.
