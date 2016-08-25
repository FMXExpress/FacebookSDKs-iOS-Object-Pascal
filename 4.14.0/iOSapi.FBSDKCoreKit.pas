{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework FBSDKCoreKit
//

unit iOSapi.FBSDKCoreKit;

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
  FBSDKAppEventsFlushBehaviorAuto = 0;
  FBSDKAppEventsFlushBehaviorExplicitOnly = 1;
  FBSDKReservedErrorCode = 0;
  FBSDKEncryptionErrorCode = 1;
  FBSDKInvalidArgumentErrorCode = 2;
  FBSDKUnknownErrorCode = 3;
  FBSDKNetworkErrorCode = 4;
  FBSDKAppEventsFlushErrorCode = 5;
  FBSDKGraphRequestNonTextMimeTypeReturnedErrorCode = 6;
  FBSDKGraphRequestProtocolMismatchErrorCode = 7;
  FBSDKGraphRequestGraphAPIErrorCode = 8;
  FBSDKDialogUnavailableErrorCode = 9;
  FBSDKAccessTokenRequiredErrorCode = 10;
  FBSDKAppVersionUnsupportedErrorCode = 11;
  FBSDKBrowserUnavailableErrorCode = 12;
  FBSDKBrowswerUnavailableErrorCode = FBSDKBrowserUnavailableErrorCode;
  FBSDKGraphRequestErrorCategoryOther = 0;
  FBSDKGraphRequestErrorCategoryTransient = 1;
  FBSDKGraphRequestErrorCategoryRecoverable = 2;
  FBSDKProfilePictureModeSquare = 0;
  FBSDKProfilePictureModeNormal = 1;

type

  // ===== Forward declarations =====
{$M+}
  FBSDKCopying = interface;
  FBSDKGraphRequest = interface;
  FBSDKGraphRequestConnection = interface;
  FBSDKGraphRequestConnectionDelegate = interface;
  FBSDKAccessToken = interface;
  FBSDKAppEvents = interface;
  FBSDKApplicationDelegate = interface;
  FBSDKAppLinkResolver = interface;
  FBSDKAppLinkUtility = interface;
  FBSDKButton = interface;
  FBSDKErrorRecoveryAttempting = interface;
  FBSDKGraphRequestDataAttachment = interface;
  FBSDKSettings = interface;
  FBSDKTestUsersManager = interface;
  FBSDKUtility = interface;
  FBSDKGraphErrorRecoveryProcessor = interface;
  FBSDKGraphErrorRecoveryProcessorDelegate = interface;
  FBSDKMutableCopying = interface;
  FBSDKProfilePictureView = interface;
  FBSDKProfile = interface;

  // ===== Framework typedefs =====
{$M+}
  FBSDKGraphRequestHandler = procedure(param1: FBSDKGraphRequestConnection;
    param2: Pointer; param3: NSError) of object;
  NSInteger = Integer;
  NSTimeInterval = Double;
  NSUInteger = Cardinal;
  FBSDKAppEventsFlushBehavior = NSUInteger;
  FBSDKDeferredAppLinkHandler = procedure(param1: NSURL; param2: NSError)
    of object;
  FBSDKDeferredAppInviteHandler = procedure(param1: NSURL) of object;
  FBSDKErrorCode = NSInteger;
  FBSDKGraphRequestErrorCategory = NSUInteger;
  SEL = SEL *;
  CGFloat = Single;
  FBSDKTestUsersManagerRetrieveTestAccountTokensHandler = procedure
    (param1: NSArray; param2: NSError) of object;
  FBSDKTestUsersManagerRemoveTestAccountHandler = procedure(param1: NSError)
    of object;
  TFBSDKCoreKitCallback = procedure(param1: NSError) of object;
  FBSDKProfilePictureMode = NSUInteger;
  TFBSDKCoreKitCompletion = procedure(param1: FBSDKProfile; param2: NSError)
    of object;
  CGSize = CGSize = record width: CGFloat;
height:
CGFloat;
end;
PCGSize = ^CGSize;;
// ===== Interface declarations =====

FBSDKGraphRequestClass = interface(NSObjectClass)
  ['{01BA87F2-9060-4832-ACC9-781BACBBA0D3}']
end;
FBSDKGraphRequest = interface(NSObject)
  ['{E0EA1627-56FD-486C-B8CF-31717E27D3E9}']
  [MethodName('initWithGraphPath:parameters:')]
function initWithGraphPathParameters(graphPath: NSString;
  parameters: NSDictionary): Pointer { instancetype };
cdecl;

[MethodName('initWithGraphPath:parameters:HTTPMethod:')]
function initWithGraphPathParametersHTTPMethod(graphPath: NSString;
  parameters: NSDictionary; HTTPMethod: NSString)
  : Pointer { instancetype }; cdecl;
[MethodName('initWithGraphPath:parameters:tokenString:version:HTTPMethod:')]
  function initWithGraphPathParametersTokenStringVersionHTTPMethod
    (graphPath: NSString; parameters: NSDictionary; tokenString: NSString;
    version: NSString; HTTPMethod: NSString): Pointer { instancetype }; cdecl;
    function parameters: NSMutableDictionary; cdecl;
      function tokenString: NSString; cdecl;
        function graphPath: NSString; cdecl;
          function HTTPMethod: NSString; cdecl;
            function version: NSString; cdecl;
              procedure setGraphErrorRecoveryDisabled(disable: Boolean); cdecl;
                function startWithCompletionHandler
                  (handler: FBSDKGraphRequestHandler)
                  : FBSDKGraphRequestConnection; cdecl;
                end;

            TFBSDKGraphRequest = class(TOCGenericImport<FBSDKGraphRequestClass,
              FBSDKGraphRequest>)
            end;
        PFBSDKGraphRequest = Pointer;

        FBSDKGraphRequestConnectionClass = interface(NSObjectClass)
          ['{D8004539-742E-42BB-961A-8C7B69C0B114}']
        { class } procedure setDefaultConnectionTimeout(defaultConnectionTimeout
          : NSTimeInterval);
        cdecl;
        end;
    FBSDKGraphRequestConnection = interface(NSObject)
      ['{7E544FB8-81BF-4C8B-9049-75525508E9DA}']
    procedure setDelegate(delegate: Pointer);
    cdecl;
      function delegate: Pointer; cdecl;
        procedure setTimeout(timeout: NSTimeInterval); cdecl;
          function timeout: NSTimeInterval; cdecl;
            function URLResponse: NSHTTPURLResponse; cdecl;
            [MethodName('addRequest:completionHandler:')]
              procedure addRequestCompletionHandler(request: FBSDKGraphRequest;
                completionHandler: FBSDKGraphRequestHandler); cdecl;
              [MethodName('addRequest:completionHandler:batchEntryName:')]
                procedure addRequestCompletionHandlerBatchEntryName
                  (request: FBSDKGraphRequest;
                  completionHandler: FBSDKGraphRequestHandler;
                  batchEntryName: NSString); cdecl;
                [MethodName('addRequest:completionHandler:batchParameters:')]
                  procedure addRequestCompletionHandlerBatchParameters
                    (request: FBSDKGraphRequest;
                    completionHandler: FBSDKGraphRequestHandler;
                    batchParameters: NSDictionary); cdecl;
                    procedure cancel; cdecl;
                      procedure start; cdecl;
                        procedure setDelegateQueue
                          (queue: NSOperationQueue); cdecl;
                          procedure overrideVersionPartWith
                            (version: NSString); cdecl;
                          end;

                      TFBSDKGraphRequestConnection = class
                        (TOCGenericImport<FBSDKGraphRequestConnectionClass,
                        FBSDKGraphRequestConnection>)
                      end;
                  PFBSDKGraphRequestConnection = Pointer;

                  FBSDKAccessTokenClass = interface(NSObjectClass)
                    ['{408F2AA6-8382-470A-BE30-1251976E3DE7}']
                  { class } function currentAccessToken: FBSDKAccessToken;
                  cdecl;
                  { class } procedure setCurrentAccessToken
                      (token: FBSDKAccessToken); cdecl;
                    { class } procedure refreshCurrentAccessToken
                        (completionHandler: FBSDKGraphRequestHandler); cdecl;
                      end;
                  FBSDKAccessToken = interface(NSObject)
                    ['{92F3D96C-7F8E-421B-B985-A78BE07D0BBE}']
                  function appID: NSString;
                  cdecl;
                    function declinedPermissions: NSSet; cdecl;
                      function expirationDate: NSDate; cdecl;
                        function permissions: NSSet; cdecl;
                          function refreshDate: NSDate; cdecl;
                            function tokenString: NSString; cdecl;
                              function userID: NSString; cdecl;
                                function initWithTokenString
                                  (tokenString: NSString; permissions: NSArray;
                                  declinedPermissions: NSArray; appID: NSString;
                                  userID: NSString; expirationDate: NSDate;
                                  refreshDate: NSDate)
                                  : Pointer { instancetype }; cdecl;
                                  function hasGranted(permission: NSString)
                                    : Boolean; cdecl;
                                    function isEqualToAccessToken
                                      (token: FBSDKAccessToken): Boolean; cdecl;
                                    end;

                                TFBSDKAccessToken = class
                                  (TOCGenericImport<FBSDKAccessTokenClass,
                                  FBSDKAccessToken>)
                                end;
                            PFBSDKAccessToken = Pointer;

                            FBSDKAppEventsClass = interface(NSObjectClass)
                              ['{45715BC3-D55C-4A26-B327-E599332C5DFF}']
                              [MethodName('logEvent:')]
                            { class } procedure logEvent(eventName: NSString);
                            cdecl;
                            [MethodName('logEvent:valueToSum:')]
                            { class } procedure logEventValueToSum
                                (eventName: NSString;
                                valueToSum: Double); cdecl;
                              [MethodName('logEvent:parameters:')]
                              { class } procedure logEventParameters
                                  (eventName: NSString;
                                  parameters: NSDictionary); cdecl;
                                [MethodName('logEvent:valueToSum:parameters:')]
                                { class } procedure logEventValueToSumParameters
                                    (eventName: NSString; valueToSum: Double;
                                    parameters: NSDictionary); cdecl;
                                  [MethodName
                                    ('logEvent:valueToSum:parameters:accessToken:')
                                    ]
                                  { class } procedure
                                      logEventValueToSumParametersAccessToken
                                      (eventName: NSString;
                                      valueToSum: NSNumber;
                                      parameters: NSDictionary;
                                      accessToken: FBSDKAccessToken); cdecl;
                                    [MethodName('logPurchase:currency:')]
                                    { class } procedure logPurchaseCurrency
                                        (purchaseAmount: Double;
                                        currency: NSString); cdecl;
                                      [MethodName
                                        ('logPurchase:currency:parameters:')]
                                      { class } procedure
                                        logPurchaseCurrencyParameters
                                        (purchaseAmount: Double;
                                        currency: NSString;
                                        parameters: NSDictionary); cdecl;
                                        [MethodName
                                        ('logPurchase:currency:parameters:accessToken:')
                                        ]
                                        { class } procedure
                                        logPurchaseCurrencyParametersAccessToken
                                        (purchaseAmount: Double;
                                        currency: NSString;
                                        parameters: NSDictionary;
                                        accessToken: FBSDKAccessToken); cdecl;
                                        [MethodName('logPushNotificationOpen:')]
                                        { class } procedure
                                        logPushNotificationOpen
                                        (payload: NSDictionary); cdecl;
                                        [MethodName
                                        ('logPushNotificationOpen:action:')]
                                        { class } procedure
                                        logPushNotificationOpenAction
                                        (payload: NSDictionary;
                                        action: NSString); cdecl;
                                        { class } procedure activateApp; cdecl;
                                        { class } procedure
                                        setPushNotificationsDeviceToken
                                        (deviceToken: NSData); cdecl;
                                        { class } function flushBehavior
                                        : FBSDKAppEventsFlushBehavior; cdecl;
                                        { class } procedure setFlushBehavior
                                        (flushBehavior
                                        : FBSDKAppEventsFlushBehavior); cdecl;
                                        { class } procedure
                                        setLoggingOverrideAppID
                                        (appID: NSString); cdecl;
                                        { class } function loggingOverrideAppID
                                        : NSString; cdecl;
                                        { class } procedure flush; cdecl;
                                        { class } function
                                        requestForCustomAudienceThirdPartyIDWithAccessToken
                                        (accessToken: FBSDKAccessToken)
                                        : FBSDKGraphRequest; cdecl;
                                        end;
                                        FBSDKAppEvents = interface(NSObject)
                                        ['{AEB594E8-C2B0-41A3-A77A-0D729F276D83}']
                                        end;

                                        TFBSDKAppEvents = class
                                        (TOCGenericImport<FBSDKAppEventsClass,
                                        FBSDKAppEvents>)
                                        end;
                                        PFBSDKAppEvents = Pointer;

                                        FBSDKApplicationDelegateClass =
                                        interface(NSObjectClass)
                                        ['{2AEB96CE-23D1-4694-A59C-C8F737EE9705}']
                                        { class } function sharedInstance
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        FBSDKApplicationDelegate = interface
                                        (NSObject)
                                        ['{E9CB526E-4024-44BC-A506-304E0CF2D942}']
                                        [MethodName
                                        ('application:openURL:sourceApplication:annotation:')
                                        ]
                                        function applicationOpenURLSourceApplicationAnnotation
                                        (application: UIApplication;
                                        openURL: NSURL;
                                        sourceApplication: NSString;
                                        annotation: Pointer): Boolean;
                                        cdecl;
                                        [MethodName
                                        ('application:didFinishLaunchingWithOptions:')
                                        ]
                                        function applicationDidFinishLaunchingWithOptions
                                        (application: UIApplication;
                                        didFinishLaunchingWithOptions
                                        : NSDictionary): Boolean; cdecl;
                                        end;

                                        TFBSDKApplicationDelegate = class
                                        (TOCGenericImport<
                                        FBSDKApplicationDelegateClass,
                                        FBSDKApplicationDelegate>)
                                        end;
                                        PFBSDKApplicationDelegate = Pointer;

                                        FBSDKAppLinkResolverClass = interface
                                        (NSObjectClass)
                                        ['{AD0C081F-8CFA-4295-85A4-50E0A557414C}']
                                        { class } function resolver
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                    FBSDKAppLinkResolver = interface(NSObject)
                                      ['{F036D5BD-1BB6-4BCB-A0E9-B807A8DFCC7D}']
                                    function appLinksFromURLsInBackground
                                      (urls: NSArray): BFTask;
                                    cdecl;
                                    end;

                                TFBSDKAppLinkResolver = class
                                  (TOCGenericImport<FBSDKAppLinkResolverClass,
                                  FBSDKAppLinkResolver>)
                                end;
                            PFBSDKAppLinkResolver = Pointer;

                            FBSDKAppLinkUtilityClass = interface(NSObjectClass)
                              ['{CED72325-2F63-4710-95A3-E12E8E31E0A9}']
                            { class } procedure fetchDeferredAppLink
                              (handler: FBSDKDeferredAppLinkHandler);
                            cdecl;
                            { class } function fetchDeferredAppInvite
                                (handler: FBSDKDeferredAppInviteHandler)
                                : Boolean; cdecl;
                              { class } function appInvitePromotionCodeFromURL
                                  (url: NSURL): NSString; cdecl;
                                end;
                            FBSDKAppLinkUtility = interface(NSObject)
                              ['{FAE6DF38-5978-4B6D-BC2C-811671D0081E}']
                            end;

                        TFBSDKAppLinkUtility = class
                          (TOCGenericImport<FBSDKAppLinkUtilityClass,
                          FBSDKAppLinkUtility>)
                        end;
                    PFBSDKAppLinkUtility = Pointer;

                    FBSDKButtonClass = interface(UIButtonClass)
                      ['{79414B3F-E636-4FE8-B9EA-E4403B29A6F1}']
                    end;
                FBSDKButton = interface(UIButton)
                  ['{6956AC67-5DC6-4199-A008-0EFA3A9DB9DE}']
                end;

            TFBSDKButton = class(TOCGenericImport<FBSDKButtonClass,
              FBSDKButton>)
            end;
        PFBSDKButton = Pointer;

        FBSDKGraphRequestDataAttachmentClass = interface(NSObjectClass)
          ['{C45FF83C-BD15-463C-BB89-554F4E175C87}']
        end;
    FBSDKGraphRequestDataAttachment = interface(NSObject)
      ['{9E5AB490-34F2-4B93-BAEE-DC764BAE1544}']
    function initWithData(data: NSData; filename: NSString;
      contentType: NSString): Pointer { instancetype };
    cdecl;
      function contentType: NSString; cdecl;
        function data: NSData; cdecl;
          function filename: NSString; cdecl;
          end;

      TFBSDKGraphRequestDataAttachment = class
        (TOCGenericImport<FBSDKGraphRequestDataAttachmentClass,
        FBSDKGraphRequestDataAttachment>)
      end;
  PFBSDKGraphRequestDataAttachment = Pointer;

  FBSDKSettingsClass = interface(NSObjectClass)
    ['{117890D9-E2BF-4BF2-A196-E4B8420E8E9D}']
  { class } function appID: NSString;
  cdecl;
  { class } procedure setAppID(appID: NSString); cdecl;
    { class } function appURLSchemeSuffix: NSString; cdecl;
      { class } procedure setAppURLSchemeSuffix(appURLSchemeSuffix
          : NSString); cdecl;
        { class } function clientToken: NSString; cdecl;
          { class } procedure setClientToken(clientToken: NSString); cdecl;
            { class } procedure setGraphErrorRecoveryDisabled
                (disableGraphErrorRecovery: Boolean); cdecl;
              { class } function displayName: NSString; cdecl;
                { class } procedure setDisplayName
                    (displayName: NSString); cdecl;
                  { class } function facebookDomainPart: NSString; cdecl;
                    { class } procedure setFacebookDomainPart(facebookDomainPart
                        : NSString); cdecl;
                      { class } function JPEGCompressionQuality: CGFloat; cdecl;
                        { class } procedure setJPEGCompressionQuality
                            (JPEGCompressionQuality: CGFloat); cdecl;
                          { class } function limitEventAndDataUsage
                              : Boolean; cdecl;
                            { class } procedure setLimitEventAndDataUsage
                                (limitEventAndDataUsage: Boolean); cdecl;
                              { class } function sdkVersion: NSString; cdecl;
                                { class } function loggingBehavior
                                    : NSSet; cdecl;
                                  { class } procedure setLoggingBehavior
                                      (loggingBehavior: NSSet); cdecl;
                                    { class } procedure enableLoggingBehavior
                                        (loggingBehavior: NSString); cdecl;
                                      { class } procedure disableLoggingBehavior
                                        (loggingBehavior: NSString); cdecl;
                                        { class } procedure
                                        setLegacyUserDefaultTokenInformationKeyName
                                        (tokenInformationKeyName
                                        : NSString); cdecl;
                                        { class } function
                                        legacyUserDefaultTokenInformationKeyName
                                        : NSString; cdecl;
                                        end;
                                        FBSDKSettings = interface(NSObject)
                                        ['{0089C21A-15B0-49BB-9B6F-BA08A9B43A93}']
                                        end;

                                    TFBSDKSettings = class
                                      (TOCGenericImport<FBSDKSettingsClass,
                                      FBSDKSettings>)
                                    end;
                                PFBSDKSettings = Pointer;

                                FBSDKTestUsersManagerClass = interface
                                  (NSObjectClass)
                                  ['{4686AAC1-530C-4F31-8FAB-1E6F2DB2CF26}']
                                { class } function sharedInstanceForAppID
                                  (appID: NSString; appSecret: NSString)
                                  : Pointer { instancetype };
                                cdecl;
                                end;
                            FBSDKTestUsersManager = interface(NSObject)
                              ['{19E30DF5-3D60-4904-95DC-7C20C40ECFCB}']
                            procedure requestTestAccountTokensWithArraysOfPermissions
                              (arraysOfPermissions: NSArray;
                              createIfNotFound: Boolean;
                              completionHandler
                              : FBSDKTestUsersManagerRetrieveTestAccountTokensHandler);
                            cdecl;
                              procedure addTestAccountWithPermissions
                                (permissions: NSSet;
                                completionHandler
                                : FBSDKTestUsersManagerRetrieveTestAccountTokensHandler);
                                cdecl;
                                procedure removeTestAccount(userID: NSString;
                                  completionHandler
                                  : FBSDKTestUsersManagerRemoveTestAccountHandler);
                                  cdecl;
                                  procedure makeFriendsWithFirst
                                    (first: FBSDKAccessToken;
                                    second: FBSDKAccessToken;
                                    callback: TFBSDKCoreKitCallback); cdecl;
                                  end;

                              TFBSDKTestUsersManager = class
                                (TOCGenericImport<FBSDKTestUsersManagerClass,
                                FBSDKTestUsersManager>)
                              end;
                          PFBSDKTestUsersManager = Pointer;

                          FBSDKUtilityClass = interface(NSObjectClass)
                            ['{7D1F922B-4B8E-4C77-9C47-1DB3F0B5A795}']
                          { class } function dictionaryWithQueryString
                            (queryString: NSString): NSDictionary;
                          cdecl;
                          { class } function queryStringWithDictionary
                              (dictionary: NSDictionary; error: NSError)
                              : NSString; cdecl;
                            { class } function URLDecode(value: NSString)
                                : NSString; cdecl;
                              { class } function URLEncode(value: NSString)
                                  : NSString; cdecl;
                                end;
                            FBSDKUtility = interface(NSObject)
                              ['{28B50781-25C1-40AD-92A8-808E18F55AA2}']
                            end;

                        TFBSDKUtility = class
                          (TOCGenericImport<FBSDKUtilityClass, FBSDKUtility>)
                        end;
                    PFBSDKUtility = Pointer;

                    FBSDKGraphErrorRecoveryProcessorClass = interface
                      (NSObjectClass)['{8B7389B3-22E6-4BCB-9322-86A2277159F9}']
                    end;
                FBSDKGraphErrorRecoveryProcessor = interface(NSObject)
                  ['{E5A02210-B449-4F9A-90D3-D71E95149B74}']
                function delegate: Pointer;
                cdecl;
                  function processError(error: NSError;
                    request: FBSDKGraphRequest; delegate: Pointer)
                    : Boolean; cdecl;
                    procedure didPresentErrorWithRecovery(didRecover: Boolean;
                      contextInfo: Pointer); cdecl;
                    end;

                TFBSDKGraphErrorRecoveryProcessor = class
                  (TOCGenericImport<FBSDKGraphErrorRecoveryProcessorClass,
                  FBSDKGraphErrorRecoveryProcessor>)
                end;
            PFBSDKGraphErrorRecoveryProcessor = Pointer;

            FBSDKProfilePictureViewClass = interface(UIViewClass)
              ['{34ED190D-4B22-4F30-8BFE-6B90CE42DDA6}']
            end;
        FBSDKProfilePictureView = interface(UIView)
          ['{FF5F1F80-84E8-4F58-A6E9-9887D2A98E4D}']
        procedure setPictureMode(pictureMode: FBSDKProfilePictureMode);
        cdecl;
          function pictureMode: FBSDKProfilePictureMode; cdecl;
            procedure setProfileID(profileID: NSString); cdecl;
              function profileID: NSString; cdecl;
                procedure setNeedsImageUpdate; cdecl;
                end;

            TFBSDKProfilePictureView = class
              (TOCGenericImport<FBSDKProfilePictureViewClass,
              FBSDKProfilePictureView>)
            end;
        PFBSDKProfilePictureView = Pointer;

        FBSDKProfileClass = interface(NSObjectClass)
          ['{C6BE052A-C74A-4DDE-A165-DDFF44EF56EB}']
        { class } function currentProfile: FBSDKProfile;
        cdecl;
        { class } procedure setCurrentProfile(profile: FBSDKProfile); cdecl;
          { class } procedure enableUpdatesOnAccessTokenChange
              (enable: Boolean); cdecl;
            { class } procedure loadCurrentProfileWithCompletion
                (completion: TFBSDKCoreKitCompletion); cdecl;
              end;
          FBSDKProfile = interface(NSObject)
            ['{E355345F-3F77-4ABB-AC6A-F3A808671D6C}']
          function initWithUserID(userID: NSString; firstName: NSString;
            middleName: NSString; lastName: NSString; name: NSString;
            linkURL: NSURL; refreshDate: NSDate): Pointer { instancetype };
          cdecl;
            function userID: NSString; cdecl;
              function firstName: NSString; cdecl;
                function middleName: NSString; cdecl;
                  function lastName: NSString; cdecl;
                    function name: NSString; cdecl;
                      function linkURL: NSURL; cdecl;
                        function refreshDate: NSDate; cdecl;
                          function imageURLForPictureMode
                            (mode: FBSDKProfilePictureMode; size: CGSize)
                            : NSURL; cdecl;
                            function imagePathForPictureMode
                              (mode: FBSDKProfilePictureMode; size: CGSize)
                              : NSString; cdecl;
                              function isEqualToProfile(profile: FBSDKProfile)
                                : Boolean; cdecl;
                              end;

                          TFBSDKProfile = class
                            (TOCGenericImport<FBSDKProfileClass, FBSDKProfile>)
                          end;
                      PFBSDKProfile = Pointer;

                      // ===== Protocol declarations =====

                      FBSDKCopying = interface(IObjectiveC)
                        ['{D2E95564-F109-4F89-9BBC-99E7E0136832}']
                      function copy: Pointer;
                      cdecl;
                      end;

                  FBSDKGraphRequestConnectionDelegate = interface(IObjectiveC)
                    ['{BB81BA38-0094-46A1-8290-D866EA99CD06}']
                  procedure requestConnectionWillBeginLoading
                    (connection: FBSDKGraphRequestConnection);
                  cdecl;
                    procedure requestConnectionDidFinishLoading
                      (connection: FBSDKGraphRequestConnection); cdecl;
                    [MethodName('requestConnection:didFailWithError:')]
                      procedure requestConnectionDidFailWithError
                        (connection: FBSDKGraphRequestConnection;
                        didFailWithError: NSError); cdecl;
                      [MethodName
                        ('requestConnection:didSendBodyData:totalBytesWritten:totalBytesExpectedToWrite:')
                        ]
                        procedure requestConnectionDidSendBodyDataTotalBytesWrittenTotalBytesExpectedToWrite
                          (connection: FBSDKGraphRequestConnection;
                          didSendBodyData: NSInteger;
                          totalBytesWritten: NSInteger;
                          totalBytesExpectedToWrite: NSInteger); cdecl;
                        end;

                    FBSDKErrorRecoveryAttempting = interface(IObjectiveC)
                      ['{C2B68DE7-8E73-4051-B57C-54CE39D32B53}']
                    procedure attemptRecoveryFromError(error: NSError;
                      optionIndex: NSUInteger; delegate: Pointer;
                      didRecoverSelector: SEL; contextInfo: Pointer);
                    cdecl;
                    end;

                FBSDKGraphErrorRecoveryProcessorDelegate = interface
                  (IObjectiveC)['{E7B2A01D-5CB0-4175-9100-33E094729FA4}']
                procedure processorDidAttemptRecovery
                  (processor: FBSDKGraphErrorRecoveryProcessor;
                  didRecover: Boolean; error: NSError);
                cdecl;
                  function processorWillProcessError
                    (processor: FBSDKGraphErrorRecoveryProcessor;
                    error: NSError): Boolean; cdecl;
                  end;

              FBSDKMutableCopying = interface(IObjectiveC)
                ['{464AE5B5-518E-414B-A007-FD06F2FF962F}']
              function mutableCopy: Pointer;
              cdecl;
              end;

          // ===== Exported string consts =====

            function FBSDKNonJSONResponseProperty: NSString;
              function FBSDKAccessTokenDidChangeNotification: NSString;
                function FBSDKAccessTokenDidChangeUserID: NSString;
                  function FBSDKAccessTokenChangeOldKey: NSString;
                    function FBSDKAccessTokenChangeNewKey: NSString;
                      function FBSDKAppEventsLoggingResultNotification
                        : NSString;
                        function FBSDKAppEventsOverrideAppIDBundleKey: NSString;
                          function FBSDKAppEventNameAchievedLevel: NSString;
                            function FBSDKAppEventNameAddedPaymentInfo
                              : NSString;
                              function FBSDKAppEventNameAddedToCart: NSString;
                                function FBSDKAppEventNameAddedToWishlist
                                  : NSString;
                                  function FBSDKAppEventNameCompletedRegistration
                                    : NSString;
                                    function FBSDKAppEventNameCompletedTutorial
                                      : NSString;
                                      function FBSDKAppEventNameInitiatedCheckout
                                        : NSString;
                                        function FBSDKAppEventNameRated
                                        : NSString;
                                        function FBSDKAppEventNameSearched
                                        : NSString;
                                        function FBSDKAppEventNameSpentCredits
                                        : NSString;
                                        function FBSDKAppEventNameUnlockedAchievement
                                        : NSString;
                                        function FBSDKAppEventNameViewedContent
                                        : NSString;
                                        function FBSDKAppEventParameterNameContentID
                                        : NSString;
                                        function FBSDKAppEventParameterNameContentType
                                        : NSString;
                                        function FBSDKAppEventParameterNameCurrency
                                        : NSString;
                                        function FBSDKAppEventParameterNameDescription
                                        : NSString;
                                        function FBSDKAppEventParameterNameLevel
                                        : NSString;
                                        function FBSDKAppEventParameterNameMaxRatingValue
                                        : NSString;
                                        function FBSDKAppEventParameterNameNumItems
                                        : NSString;
                                        function FBSDKAppEventParameterNamePaymentInfoAvailable
                                        : NSString;
                                        function FBSDKAppEventParameterNameRegistrationMethod
                                        : NSString;
                                        function FBSDKAppEventParameterNameSearchString
                                        : NSString;
                                        function FBSDKAppEventParameterNameSuccess
                                        : NSString;
                                        function FBSDKAppEventParameterValueYes
                                        : NSString;
                                        function FBSDKAppEventParameterValueNo
                                        : NSString;
                                        function FBSDKErrorDomain: NSString;
                                        function FBSDKErrorArgumentCollectionKey
                                        : NSString;
                                        function FBSDKErrorArgumentNameKey
                                        : NSString;
                                        function FBSDKErrorArgumentValueKey
                                        : NSString;
                                        function FBSDKErrorDeveloperMessageKey
                                        : NSString;
                                        function FBSDKErrorLocalizedDescriptionKey
                                        : NSString;
                                        function FBSDKErrorLocalizedTitleKey
                                        : NSString;
                                        function FBSDKGraphRequestErrorCategoryKey
                                        : NSString;
                                        function FBSDKGraphRequestErrorGraphErrorCode
                                        : NSString;
                                        function FBSDKGraphRequestErrorGraphErrorSubcode
                                        : NSString;
                                        function FBSDKGraphRequestErrorHTTPStatusCodeKey
                                        : NSString;
                                        function FBSDKGraphRequestErrorParsedJSONResponseKey
                                        : NSString;
                                        function FBSDKLoggingBehaviorAccessTokens
                                        : NSString;
                                        function FBSDKLoggingBehaviorPerformanceCharacteristics
                                        : NSString;
                                        function FBSDKLoggingBehaviorAppEvents
                                        : NSString;
                                        function FBSDKLoggingBehaviorInformational
                                        : NSString;
                                        function FBSDKLoggingBehaviorCacheErrors
                                        : NSString;
                                        function FBSDKLoggingBehaviorUIControlErrors
                                        : NSString;
                                        function FBSDKLoggingBehaviorGraphAPIDebugWarning
                                        : NSString;
                                        function FBSDKLoggingBehaviorGraphAPIDebugInfo
                                        : NSString;
                                        function FBSDKLoggingBehaviorNetworkRequests
                                        : NSString;
                                        function FBSDKLoggingBehaviorDeveloperErrors
                                        : NSString;
                                        function FBSDKProfileDidChangeNotification
                                        : NSString;
                                        function FBSDKProfileChangeOldKey
                                        : NSString;
                                        function FBSDKProfileChangeNewKey
                                        : NSString;


                                        // ===== External functions =====

                                        const
                                        libFBSDKCoreKit =
                                        '/System/Library/Frameworks/FBSDKCoreKit.framework/FBSDKCoreKit';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  FBSDKCoreKitModule: THandle;

{$ENDIF IOS}

function FBSDKNonJSONResponseProperty: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit, 'FBSDKNonJSONResponseProperty');
end;

function FBSDKAccessTokenDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKAccessTokenDidChangeNotification');
end;

function FBSDKAccessTokenDidChangeUserID: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKAccessTokenDidChangeUserID');
end;

function FBSDKAccessTokenChangeOldKey: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit, 'FBSDKAccessTokenChangeOldKey');
end;

function FBSDKAccessTokenChangeNewKey: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit, 'FBSDKAccessTokenChangeNewKey');
end;

function FBSDKAppEventsLoggingResultNotification: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKAppEventsLoggingResultNotification');
end;

function FBSDKAppEventsOverrideAppIDBundleKey: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKAppEventsOverrideAppIDBundleKey');
end;

function FBSDKAppEventNameAchievedLevel: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKAppEventNameAchievedLevel');
end;

function FBSDKAppEventNameAddedPaymentInfo: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKAppEventNameAddedPaymentInfo');
end;

function FBSDKAppEventNameAddedToCart: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit, 'FBSDKAppEventNameAddedToCart');
end;

function FBSDKAppEventNameAddedToWishlist: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKAppEventNameAddedToWishlist');
end;

function FBSDKAppEventNameCompletedRegistration: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKAppEventNameCompletedRegistration');
end;

function FBSDKAppEventNameCompletedTutorial: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKAppEventNameCompletedTutorial');
end;

function FBSDKAppEventNameInitiatedCheckout: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKAppEventNameInitiatedCheckout');
end;

function FBSDKAppEventNameRated: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit, 'FBSDKAppEventNameRated');
end;

function FBSDKAppEventNameSearched: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit, 'FBSDKAppEventNameSearched');
end;

function FBSDKAppEventNameSpentCredits: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKAppEventNameSpentCredits');
end;

function FBSDKAppEventNameUnlockedAchievement: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKAppEventNameUnlockedAchievement');
end;

function FBSDKAppEventNameViewedContent: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKAppEventNameViewedContent');
end;

function FBSDKAppEventParameterNameContentID: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKAppEventParameterNameContentID');
end;

function FBSDKAppEventParameterNameContentType: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKAppEventParameterNameContentType');
end;

function FBSDKAppEventParameterNameCurrency: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKAppEventParameterNameCurrency');
end;

function FBSDKAppEventParameterNameDescription: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKAppEventParameterNameDescription');
end;

function FBSDKAppEventParameterNameLevel: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKAppEventParameterNameLevel');
end;

function FBSDKAppEventParameterNameMaxRatingValue: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKAppEventParameterNameMaxRatingValue');
end;

function FBSDKAppEventParameterNameNumItems: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKAppEventParameterNameNumItems');
end;

function FBSDKAppEventParameterNamePaymentInfoAvailable: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKAppEventParameterNamePaymentInfoAvailable');
end;

function FBSDKAppEventParameterNameRegistrationMethod: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKAppEventParameterNameRegistrationMethod');
end;

function FBSDKAppEventParameterNameSearchString: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKAppEventParameterNameSearchString');
end;

function FBSDKAppEventParameterNameSuccess: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKAppEventParameterNameSuccess');
end;

function FBSDKAppEventParameterValueYes: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKAppEventParameterValueYes');
end;

function FBSDKAppEventParameterValueNo: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKAppEventParameterValueNo');
end;

function FBSDKErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit, 'FBSDKErrorDomain');
end;

function FBSDKErrorArgumentCollectionKey: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKErrorArgumentCollectionKey');
end;

function FBSDKErrorArgumentNameKey: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit, 'FBSDKErrorArgumentNameKey');
end;

function FBSDKErrorArgumentValueKey: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit, 'FBSDKErrorArgumentValueKey');
end;

function FBSDKErrorDeveloperMessageKey: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKErrorDeveloperMessageKey');
end;

function FBSDKErrorLocalizedDescriptionKey: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKErrorLocalizedDescriptionKey');
end;

function FBSDKErrorLocalizedTitleKey: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit, 'FBSDKErrorLocalizedTitleKey');
end;

function FBSDKGraphRequestErrorCategoryKey: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKGraphRequestErrorCategoryKey');
end;

function FBSDKGraphRequestErrorGraphErrorCode: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKGraphRequestErrorGraphErrorCode');
end;

function FBSDKGraphRequestErrorGraphErrorSubcode: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKGraphRequestErrorGraphErrorSubcode');
end;

function FBSDKGraphRequestErrorHTTPStatusCodeKey: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKGraphRequestErrorHTTPStatusCodeKey');
end;

function FBSDKGraphRequestErrorParsedJSONResponseKey: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKGraphRequestErrorParsedJSONResponseKey');
end;

function FBSDKLoggingBehaviorAccessTokens: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKLoggingBehaviorAccessTokens');
end;

function FBSDKLoggingBehaviorPerformanceCharacteristics: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKLoggingBehaviorPerformanceCharacteristics');
end;

function FBSDKLoggingBehaviorAppEvents: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKLoggingBehaviorAppEvents');
end;

function FBSDKLoggingBehaviorInformational: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKLoggingBehaviorInformational');
end;

function FBSDKLoggingBehaviorCacheErrors: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKLoggingBehaviorCacheErrors');
end;

function FBSDKLoggingBehaviorUIControlErrors: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKLoggingBehaviorUIControlErrors');
end;

function FBSDKLoggingBehaviorGraphAPIDebugWarning: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKLoggingBehaviorGraphAPIDebugWarning');
end;

function FBSDKLoggingBehaviorGraphAPIDebugInfo: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKLoggingBehaviorGraphAPIDebugInfo');
end;

function FBSDKLoggingBehaviorNetworkRequests: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKLoggingBehaviorNetworkRequests');
end;

function FBSDKLoggingBehaviorDeveloperErrors: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKLoggingBehaviorDeveloperErrors');
end;

function FBSDKProfileDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit,
    'FBSDKProfileDidChangeNotification');
end;

function FBSDKProfileChangeOldKey: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit, 'FBSDKProfileChangeOldKey');
end;

function FBSDKProfileChangeNewKey: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKCoreKit, 'FBSDKProfileChangeNewKey');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

FBSDKCoreKitModule := dlopen(MarshaledAString(libFBSDKCoreKit), RTLD_LAZY);

finalization

dlclose(FBSDKCoreKitModule);
{$ENDIF IOS}

end.
