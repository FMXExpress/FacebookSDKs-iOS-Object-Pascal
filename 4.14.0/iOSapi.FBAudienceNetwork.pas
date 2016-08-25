{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework FBAudienceNetwork
//

unit iOSapi.FBAudienceNetwork;

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
  FBAdLogLevelNone = 0;
  FBAdLogLevelNotification = 1;
  FBAdLogLevelError = 2;
  FBAdLogLevelWarning = 3;
  FBAdLogLevelLog = 4;
  FBAdLogLevelDebug = 5;
  FBAdLogLevelVerbose = 6;
  FBNativeAdsCachePolicyNone = 1 shl 0;
  FBNativeAdsCachePolicyIcon = 1 shl 1;
  FBNativeAdsCachePolicyCoverImage = 1 shl 2;
  FBNativeAdsCachePolicyVideo = 1 shl 3;
  FBNativeAdsCachePolicyAll = FBNativeAdsCachePolicyCoverImage or
    FBNativeAdsCachePolicyIcon or FBNativeAdsCachePolicyVideo;
  FBNativeAdViewTypeGenericHeight100 = 1;
  FBNativeAdViewTypeGenericHeight120 = 2;
  FBNativeAdViewTypeGenericHeight300 = 3;
  FBNativeAdViewTypeGenericHeight400 = 4;

type

  // ===== Forward declarations =====
{$M+}
  FBAdImage = interface;
  FBNativeAd = interface;
  FBNativeAdViewAttributes = interface;
  FBAdChoicesView = interface;
  FBAdSettings = interface;
  FBAdViewDelegate = interface;
  FBAdView = interface;
  FBInterstitialAdDelegate = interface;
  FBInterstitialAd = interface;
  FBMediaViewDelegate = interface;
  FBMediaView = interface;
  FBNativeAdDelegate = interface;
  FBAdStarRatingView = interface;
  FBNativeAdView = interface;
  FBNativeAdsManagerDelegate = interface;
  FBNativeAdsManager = interface;
  FBNativeAdScrollView = interface;
  FBNativeAdTableViewAdProvider = interface;
  FBNativeAdTableViewCellProvider = interface;

  // ===== Framework typedefs =====
{$M+}
  NSUInteger = Cardinal;
  UIRectCorner = NSUInteger;
  NSInteger = Integer;
  FBAdLogLevel = NSInteger;
  CGFloat = Single;
  CGSize = CGSize = record width: CGFloat;
height:
CGFloat;
end;
PCGSize = ^CGSize;;

FBAdSize = record size: CGSize;
end;
PFBAdSize = ^FBAdSize;

FBNativeAdsCachePolicy = NSInteger;
TFBAudienceNetworkBlock =
procedure(param1: UIImage) of object;
CGPoint = CGPoint = record x: CGFloat;
y:
CGFloat;
end;
PCGPoint = ^CGPoint;;
CGRect = CGRect = record origin: CGPoint;
size:
CGSize;
end;
PCGRect = ^CGRect;;
FBNativeAdViewType = NSInteger;
TFBAudienceNetworkWithViewProvider =
function(param1: FBNativeAd; param2: NSUInteger): UIView;
cdecl;
// ===== Interface declarations =====

FBAdImageClass = interface(NSObjectClass)
  ['{0773CE76-9FE5-46AE-87FD-E8FFA1863223}']
end;
FBAdImage = interface(NSObject)['{8AADD0BC-7ED6-4B1E-AF5E-0F57328F32FE}']
function url: NSURL;
cdecl;

function width: NSInteger; cdecl;
  function height: NSInteger; cdecl;
    function initWithURL(url: NSURL; width: NSInteger; height: NSInteger)
      : Pointer { instancetype }; cdecl;
      procedure loadImageAsyncWithBlock(block: TFBAudienceNetworkBlock); cdecl;
      end;

  TFBAdImage = class(TOCGenericImport<FBAdImageClass, FBAdImage>)
  end;
PFBAdImage = Pointer;

FBNativeAdClass = interface(NSObjectClass)
  ['{1F4AFCD2-4836-42E6-A4EF-3E382B8E2513}']
end;
FBNativeAd = interface(NSObject)['{9E570BF3-28FD-44EC-B7D6-5C90C3952B8C}']
function placementID: NSString;
cdecl;

function starRating: FBAdStarRating = record value: CGFloat;
scale:
NSInteger;
end;
PFBAdStarRating = ^FBAdStarRating;;
cdecl;

function title: NSString; cdecl;
  function subtitle: NSString; cdecl;
    function socialContext: NSString; cdecl;
      function callToAction: NSString; cdecl;
        function icon: FBAdImage; cdecl;
          function coverImage: FBAdImage; cdecl;
            function body: NSString; cdecl;
              procedure setMediaCachePolicy(mediaCachePolicy
                : FBNativeAdsCachePolicy); cdecl;
                function mediaCachePolicy: FBNativeAdsCachePolicy; cdecl;
                  procedure setDelegate(delegate: Pointer); cdecl;
                    function delegate: Pointer; cdecl;
                      function initWithPlacementID(placementID: NSString)
                        : Pointer { instancetype }; cdecl;
                      [MethodName
                        ('registerViewForInteraction:withViewController:')]
                        procedure registerViewForInteractionWithViewController
                          (view: UIView;
                          withViewController: UIViewController); cdecl;
                        [MethodName
                          ('registerViewForInteraction:withViewController:withClickableViews:')
                          ]
                          procedure registerViewForInteractionWithViewControllerWithClickableViews
                            (view: UIView; withViewController: UIViewController;
                            withClickableViews: NSArray); cdecl;
                            procedure unregisterView; cdecl;
                              procedure loadAd; cdecl;
                                function isAdValid: Boolean; cdecl;
                                end;

                            TFBNativeAd = class
                              (TOCGenericImport<FBNativeAdClass, FBNativeAd>)
                            end;
                        PFBNativeAd = Pointer;

                        FBNativeAdViewAttributesClass = interface(NSObjectClass)
                          ['{69F62A3F-E880-4313-9863-8B6256280486}']
                        { class } function defaultAttributesForType
                          (&type: FBNativeAdViewType): Pointer { instancetype };
                        cdecl;
                        end;
                    FBNativeAdViewAttributes = interface(NSObject)
                      ['{D08FC63D-531C-4115-AFAE-F2A65739E8DB}']
                    function initWithDictionary(dict: NSDictionary)
                      : Pointer { instancetype };
                    cdecl;
                      procedure setBackgroundColor(backgroundColor
                        : UIColor); cdecl;
                        function backgroundColor: UIColor; cdecl;
                          procedure setTitleColor(titleColor: UIColor); cdecl;
                            function titleColor: UIColor; cdecl;
                              procedure setTitleFont(titleFont: UIFont); cdecl;
                                function titleFont: UIFont; cdecl;
                                  procedure setDescriptionColor(descriptionColor
                                    : UIColor); cdecl;
                                    function descriptionColor: UIColor; cdecl;
                                      procedure setDescriptionFont
                                        (descriptionFont: UIFont); cdecl;
                                        function descriptionFont: UIFont; cdecl;
                                        procedure setButtonColor
                                        (buttonColor: UIColor); cdecl;
                                        function buttonColor: UIColor; cdecl;
                                        procedure setButtonTitleColor
                                        (buttonTitleColor: UIColor); cdecl;
                                        function buttonTitleColor
                                        : UIColor; cdecl;
                                        procedure setButtonTitleFont
                                        (buttonTitleFont: UIFont); cdecl;
                                        function buttonTitleFont: UIFont; cdecl;
                                        procedure setButtonBorderColor
                                        (buttonBorderColor: UIColor); cdecl;
                                        function buttonBorderColor
                                        : UIColor; cdecl;
                                        procedure setAutoplayEnabled
                                        (autoplayEnabled: Boolean); cdecl;
                                        function isAutoplayEnabled
                                        : Boolean; cdecl;
                                        end;

                                        TFBNativeAdViewAttributes = class
                                        (TOCGenericImport<
                                        FBNativeAdViewAttributesClass,
                                        FBNativeAdViewAttributes>)
                                        end;
                                        PFBNativeAdViewAttributes = Pointer;

                                        FBAdChoicesViewClass = interface
                                        (UIViewClass)
                                        ['{BF8F53AC-9454-45B1-A930-7C6683AFA042}']
                                        end;
                                        FBAdChoicesView = interface(UIView)
                                        ['{7F9A7529-56EE-4A50-A228-CAE64080E206}']
                                        function &label: UILabel;
                                        cdecl;
                                        procedure setBackgroundShown
                                        (backgroundShown: Boolean); cdecl;
                                        function isBackgroundShown
                                        : Boolean; cdecl;
                                        function isExpandable: Boolean; cdecl;
                                        procedure setNativeAd
                                        (nativeAd: FBNativeAd); cdecl;
                                        function nativeAd: FBNativeAd; cdecl;
                                        procedure setCorner
                                        (corner: UIRectCorner); cdecl;
                                        function corner: UIRectCorner; cdecl;
                                        procedure setViewController
                                        (viewController
                                        : UIViewController); cdecl;
                                        function viewController
                                        : UIViewController; cdecl;
                                        [MethodName('initWithNativeAd:')]
                                        function initWithNativeAd
                                        (nativeAd: FBNativeAd)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('initWithNativeAd:expandable:')]
                                        function initWithNativeAdExpandable
                                        (nativeAd: FBNativeAd;
                                        expandable: Boolean)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('initWithViewController:adChoicesIcon:adChoicesLinkURL:attributes:')
                                        ]
                                        function initWithViewControllerAdChoicesIconAdChoicesLinkURLAttributes
                                        (viewController: UIViewController;
                                        adChoicesIcon: FBAdImage;
                                        adChoicesLinkURL: NSURL;
                                        attributes: FBNativeAdViewAttributes)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('initWithViewController:adChoicesIcon:adChoicesLinkURL:attributes:expandable:')
                                        ]
                                        function initWithViewControllerAdChoicesIconAdChoicesLinkURLAttributesExpandable
                                        (viewController: UIViewController;
                                        adChoicesIcon: FBAdImage;
                                        adChoicesLinkURL: NSURL;
                                        attributes: FBNativeAdViewAttributes;
                                        expandable: Boolean)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('initWithViewController:adChoicesIcon:adChoicesLinkURL:adChoicesText:attributes:expandable:')
                                        ]
                                        function initWithViewControllerAdChoicesIconAdChoicesLinkURLAdChoicesTextAttributesExpandable
                                        (viewController: UIViewController;
                                        adChoicesIcon: FBAdImage;
                                        adChoicesLinkURL: NSURL;
                                        adChoicesText: NSString;
                                        attributes: FBNativeAdViewAttributes;
                                        expandable: Boolean)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName('updateFrameFromSuperview')]
                                        procedure updateFrameFromSuperview;
                                        cdecl; overload;
                                        [MethodName
                                        ('updateFrameFromSuperview:')]
                                        procedure updateFrameFromSuperview
                                        (corner: UIRectCorner); cdecl; overload;
                                        end;

                                        TFBAdChoicesView = class
                                        (TOCGenericImport<FBAdChoicesViewClass,
                                        FBAdChoicesView>)
                                        end;
                                        PFBAdChoicesView = Pointer;

                                        FBAdSettingsClass = interface
                                        (NSObjectClass)
                                        ['{8E190FF8-3694-4E84-8244-77108F161716}']
                                        { class } procedure addTestDevice
                                        (deviceHash: NSString);
                                        cdecl;
                                        { class } procedure addTestDevices
                                        (devicesHash: NSArray); cdecl;
                                        { class } procedure
                                        clearTestDevices; cdecl;
                                        { class } procedure setIsChildDirected
                                        (isChildDirected: Boolean); cdecl;
                                        { class } procedure setMediationService
                                        (service: NSString); cdecl;
                                        { class } procedure setUrlPrefix
                                        (urlPrefix: NSString); cdecl;
                                        { class } function getLogLevel
                                        : FBAdLogLevel; cdecl;
                                        { class } procedure setLogLevel
                                        (level: FBAdLogLevel); cdecl;
                                        end;
                                        FBAdSettings = interface(NSObject)
                                        ['{EB60D7E8-53C9-4C72-8758-0C66170146F4}']
                                        end;

                                        TFBAdSettings = class
                                        (TOCGenericImport<FBAdSettingsClass,
                                        FBAdSettings>)
                                        end;
                                        PFBAdSettings = Pointer;

                                        FBAdViewClass = interface(UIViewClass)
                                        ['{11A6591F-B86B-45EA-A3FD-819070838355}']
                                        end;
                                        FBAdView = interface(UIView)
                                        ['{3A3A2389-BEB4-4583-83ED-C8F531222F93}']
                                        function initWithPlacementID
                                        (placementID: NSString;
                                        adSize: FBAdSize;
                                        rootViewController: UIViewController)
                                        : Pointer { instancetype };
                                        cdecl;
                                        procedure loadAd; cdecl;
                                        procedure disableAutoRefresh; cdecl;
                                        function placementID: NSString; cdecl;
                                        function rootViewController
                                        : UIViewController; cdecl;
                                        procedure setDelegate
                                        (delegate: Pointer); cdecl;
                                        function delegate: Pointer; cdecl;
                                        end;

                                        TFBAdView = class
                                        (TOCGenericImport<FBAdViewClass,
                                        FBAdView>)
                                        end;
                                        PFBAdView = Pointer;

                                        FBInterstitialAdClass = interface
                                        (NSObjectClass)
                                        ['{5DA972AC-E310-4089-8BF1-4439A9284C48}']
                                        end;
                                        FBInterstitialAd = interface(NSObject)
                                        ['{62E5DA4E-7BE7-4C47-BE12-2039557CD0B1}']
                                        function placementID: NSString;
                                        cdecl;
                                        procedure setDelegate
                                        (delegate: Pointer); cdecl;
                                        function delegate: Pointer; cdecl;
                                        function initWithPlacementID
                                        (placementID: NSString)
                                        : Pointer { instancetype }; cdecl;
                                        function isAdValid: Boolean; cdecl;
                                        procedure loadAd; cdecl;
                                        function showAdFromRootViewController
                                        (rootViewController: UIViewController)
                                        : Boolean; cdecl;
                                        end;

                                        TFBInterstitialAd = class
                                        (TOCGenericImport<FBInterstitialAdClass,
                                        FBInterstitialAd>)
                                        end;
                                        PFBInterstitialAd = Pointer;

                                        FBMediaViewClass = interface
                                        (UIViewClass)
                                        ['{19A51BD9-8AE7-4D6D-94A4-B39E4CFF881E}']
                                        end;
                                        FBMediaView = interface(UIView)
                                        ['{72382DFC-4053-45A1-8BBD-744239F8779B}']
                                        procedure setDelegate
                                        (delegate: Pointer);
                                        cdecl;
                                        function delegate: Pointer; cdecl;
                                        function initWithNativeAd
                                        (nativeAd: FBNativeAd)
                                        : Pointer { instancetype }; cdecl;
                                        procedure setNativeAd
                                        (nativeAd: FBNativeAd); cdecl;
                                        function nativeAd: FBNativeAd; cdecl;
                                        procedure setAutoplayEnabled
                                        (autoplayEnabled: Boolean); cdecl;
                                        function isAutoplayEnabled
                                        : Boolean; cdecl;
                                        end;

                                        TFBMediaView = class
                                        (TOCGenericImport<FBMediaViewClass,
                                        FBMediaView>)
                                        end;
                                        PFBMediaView = Pointer;

                                        FBAdStarRatingViewClass = interface
                                        (UIViewClass)
                                        ['{765B4160-F3F1-4F0C-AF35-5F39AD2395AC}']
                                        end;
                                        FBAdStarRatingView = interface(UIView)
                                        ['{A9D2EE7A-C373-4B27-95EA-19F42DA66544}']
                                        procedure setRating
                                        (rating: FBAdStarRating = record value
                                        : CGFloat; scale: NSInteger; end;
                                        PFBAdStarRating = ^FBAdStarRating;);
                                        cdecl;
                                        function rating
                                        : FBAdStarRating = record value
                                        : CGFloat;
                                        scale:
                                        NSInteger;
                                        end;
                                        PFBAdStarRating = ^FBAdStarRating;;
                                        cdecl;
                                        procedure setPrimaryColor
                                        (primaryColor: UIColor); cdecl;
                                        function primaryColor: UIColor; cdecl;
                                        procedure setSecondaryColor
                                        (secondaryColor: UIColor); cdecl;
                                        function secondaryColor: UIColor; cdecl;
                                        function initWithFrame(frame: CGRect;
                                        withStarRating
                                        : FBAdStarRating = record value
                                        : CGFloat; scale: NSInteger; end;
                                        PFBAdStarRating = ^FBAdStarRating;
                                        ): Pointer { instancetype }; cdecl;
                                        end;

                                        TFBAdStarRatingView = class
                                        (TOCGenericImport<
                                        FBAdStarRatingViewClass,
                                        FBAdStarRatingView>)
                                        end;
                                        PFBAdStarRatingView = Pointer;

                                        FBNativeAdViewClass = interface
                                        (UIViewClass)
                                        ['{96E6087E-1B79-4C89-BCCC-BBF9AFDE3F50}']
                                        [MethodName
                                        ('nativeAdViewWithNativeAd:withType:')]
                                        { class } function
                                        nativeAdViewWithNativeAdWithType
                                        (nativeAd: FBNativeAd;
                                        withType: FBNativeAdViewType)
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName
                                        ('nativeAdViewWithNativeAd:withType:withAttributes:')
                                        ]
                                        { class } function
                                        nativeAdViewWithNativeAdWithTypeWithAttributes
                                        (nativeAd: FBNativeAd;
                                        withType: FBNativeAdViewType;
                                        withAttributes
                                        : FBNativeAdViewAttributes)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        FBNativeAdView = interface(UIView)
                                        ['{648CE806-680F-40B1-BF5E-D674E928556F}']
                                        function &type: FBNativeAdViewType;
                                        cdecl;
                                        procedure setViewController
                                        (viewController
                                        : UIViewController); cdecl;
                                        function viewController
                                        : UIViewController; cdecl;
                                        end;

                                        TFBNativeAdView = class
                                        (TOCGenericImport<FBNativeAdViewClass,
                                        FBNativeAdView>)
                                        end;
                                        PFBNativeAdView = Pointer;

                                        FBNativeAdsManagerClass = interface
                                        (NSObjectClass)
                                        ['{0CED8F70-65C0-4379-AA5C-BEFF90C128F5}']
                                        end;
                                        FBNativeAdsManager = interface(NSObject)
                                        ['{B8A09928-A159-4DE9-90DE-18A26B19F337}']
                                        procedure setDelegate
                                        (delegate: Pointer);
                                        cdecl;
                                        function delegate: Pointer; cdecl;
                                        procedure setMediaCachePolicy
                                        (mediaCachePolicy
                                        : FBNativeAdsCachePolicy); cdecl;
                                        function mediaCachePolicy
                                        : FBNativeAdsCachePolicy; cdecl;
                                        function uniqueNativeAdCount
                                        : NSUInteger; cdecl;
                                        function isValid: Boolean; cdecl;
                                        function initWithPlacementID
                                        (placementID: NSString;
                                        forNumAdsRequested: NSUInteger)
                                        : Pointer { instancetype }; cdecl;
                                        procedure loadAds; cdecl;
                                        procedure disableAutoRefresh; cdecl;
                                        function nextNativeAd
                                        : FBNativeAd; cdecl;
                                        end;

                                        TFBNativeAdsManager = class
                                        (TOCGenericImport<
                                        FBNativeAdsManagerClass,
                                        FBNativeAdsManager>)
                                        end;
                                        PFBNativeAdsManager = Pointer;

                                        FBNativeAdScrollViewClass = interface
                                        (UIViewClass)
                                        ['{35A78CA3-F372-447A-9C4F-55A8F4ED235E}']
                                        end;
                                        FBNativeAdScrollView = interface(UIView)
                                        ['{5B55B257-FD88-4D8E-BEE3-8997691AAB83}']
                                        function maximumNativeAdCount
                                        : NSUInteger;
                                        cdecl;
                                        procedure setAnimationEnabled
                                        (animationEnabled: Boolean); cdecl;
                                        function isAnimationEnabled
                                        : Boolean; cdecl;
                                        procedure setXInset
                                        (xInset: CGFloat); cdecl;
                                        function xInset: CGFloat; cdecl;
                                        procedure setAdPersistenceEnabled
                                        (adPersistenceEnabled: Boolean); cdecl;
                                        function isAdPersistenceEnabled
                                        : Boolean; cdecl;
                                        procedure setViewController
                                        (viewController
                                        : UIViewController); cdecl;
                                        function viewController
                                        : UIViewController; cdecl;
                                        procedure setDelegate
                                        (delegate: Pointer); cdecl;
                                        function delegate: Pointer; cdecl;
                                        [MethodName
                                        ('initWithNativeAdsManager:withType:')]
                                        function initWithNativeAdsManagerWithType
                                        (manager: FBNativeAdsManager;
                                        withType: FBNativeAdViewType)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('initWithNativeAdsManager:withType:withAttributes:')
                                        ]
                                        function initWithNativeAdsManagerWithTypeWithAttributes
                                        (manager: FBNativeAdsManager;
                                        withType: FBNativeAdViewType;
                                        withAttributes
                                        : FBNativeAdViewAttributes)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('initWithNativeAdsManager:withType:withAttributes:withMaximum:')
                                        ]
                                        function initWithNativeAdsManagerWithTypeWithAttributesWithMaximum
                                        (manager: FBNativeAdsManager;
                                        withType: FBNativeAdViewType;
                                        withAttributes
                                        : FBNativeAdViewAttributes;
                                        withMaximum: NSUInteger)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('initWithNativeAdsManager:withViewProvider:')
                                        ]
                                        function initWithNativeAdsManagerWithViewProvider
                                        (manager: FBNativeAdsManager;
                                        withViewProvider
                                        : TFBAudienceNetworkWithViewProvider)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('initWithNativeAdsManager:withViewProvider:withMaximum:')
                                        ]
                                        function initWithNativeAdsManagerWithViewProviderWithMaximum
                                        (manager: FBNativeAdsManager;
                                        withViewProvider
                                        : TFBAudienceNetworkWithViewProvider;
                                        withMaximum: NSUInteger)
                                        : Pointer { instancetype }; cdecl;
                                        end;

                                        TFBNativeAdScrollView = class
                                        (TOCGenericImport<
                                        FBNativeAdScrollViewClass,
                                        FBNativeAdScrollView>)
                                        end;
                                        PFBNativeAdScrollView = Pointer;

                                        FBNativeAdTableViewAdProviderClass =
                                        interface(NSObjectClass)
                                        ['{0C333BF4-56D4-402B-B16B-7B86E513A71F}']
                                        end;
                                        FBNativeAdTableViewAdProvider =
                                        interface(NSObject)
                                        ['{A2ADC11C-BDB9-4F4C-941C-CA7A534432A2}']
                                        procedure setDelegate
                                        (delegate: Pointer);
                                        cdecl;
                                        function delegate: Pointer; cdecl;
                                        function initWithManager
                                        (manager: FBNativeAdsManager)
                                        : Pointer { instancetype }; cdecl;
                                        function tableView
                                        (tableView: UITableView;
                                        nativeAdForRowAtIndexPath: NSIndexPath)
                                        : FBNativeAd; cdecl;
                                        function isAdCellAtIndexPath
                                        (indexPath: NSIndexPath;
                                        forStride: NSUInteger): Boolean; cdecl;
                                        function adjustNonAdCellIndexPath
                                        (indexPath: NSIndexPath;
                                        forStride: NSUInteger)
                                        : NSIndexPath; cdecl;
                                        function adjustCount(count: NSUInteger;
                                        forStride: NSUInteger)
                                        : NSUInteger; cdecl;
                                        end;

                                        TFBNativeAdTableViewAdProvider = class
                                        (TOCGenericImport<
                                        FBNativeAdTableViewAdProviderClass,
                                        FBNativeAdTableViewAdProvider>)
                                        end;
                                        PFBNativeAdTableViewAdProvider =
                                        Pointer;

                                        FBNativeAdTableViewCellProviderClass =
                                        interface(
                                        FBNativeAdTableViewAdProviderClass)
                                        ['{1024443A-978B-45B8-A399-BCFDD7B15685}']
                                        end;
                                        FBNativeAdTableViewCellProvider =
                                        interface(FBNativeAdTableViewAdProvider)
                                        ['{F432398F-0D7F-4BD8-951C-F0B4526A3007}']
                                        [MethodName('initWithManager:forType:')]
                                        function initWithManagerForType
                                        (manager: FBNativeAdsManager;
                                        forType: FBNativeAdViewType)
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName
                                        ('initWithManager:forType:forAttributes:')
                                        ]
                                        function initWithManagerForTypeForAttributes
                                        (manager: FBNativeAdsManager;
                                        forType: FBNativeAdViewType;
                                        forAttributes: FBNativeAdViewAttributes)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('tableView:cellForRowAtIndexPath:')]
                                        function tableViewCellForRowAtIndexPath
                                        (tableView: UITableView;
                                        cellForRowAtIndexPath: NSIndexPath)
                                        : UITableViewCell; cdecl;
                                        [MethodName
                                        ('tableView:heightForRowAtIndexPath:')]
                                        function tableViewHeightForRowAtIndexPath
                                        (tableView: UITableView;
                                        heightForRowAtIndexPath: NSIndexPath)
                                        : CGFloat; cdecl;
                                        [MethodName
                                        ('tableView:estimatedHeightForRowAtIndexPath:')
                                        ]
                                        function tableViewEstimatedHeightForRowAtIndexPath
                                        (tableView: UITableView;
                                        estimatedHeightForRowAtIndexPath
                                        : NSIndexPath): CGFloat; cdecl;
                                        end;

                                        TFBNativeAdTableViewCellProvider = class
                                        (TOCGenericImport<
                                        FBNativeAdTableViewCellProviderClass,
                                        FBNativeAdTableViewCellProvider>)
                                        end;
                                        PFBNativeAdTableViewCellProvider =
                                        Pointer;

                                        // ===== Protocol declarations =====

                                        FBAdViewDelegate = interface
                                        (IObjectiveC)
                                        ['{71CA23BA-8CB9-4DA1-A2B2-91BAA4C53C4B}']
                                        procedure adViewDidClick
                                        (adView: FBAdView);
                                        cdecl;
                                        procedure adViewDidFinishHandlingClick
                                        (adView: FBAdView); cdecl;
                                        procedure adViewDidLoad
                                        (adView: FBAdView); cdecl;
                                        procedure adView(adView: FBAdView;
                                        didFailWithError: NSError); cdecl;
                                        procedure adViewWillLogImpression
                                        (adView: FBAdView); cdecl;
                                        function viewControllerForPresentingModalView
                                        : UIViewController; cdecl;
                                        end;

                                        FBInterstitialAdDelegate = interface
                                        (IObjectiveC)
                                        ['{CDE305B3-E327-4A7D-903F-E5E1B07804E1}']
                                        procedure interstitialAdDidClick
                                        (interstitialAd: FBInterstitialAd);
                                        cdecl;
                                        procedure interstitialAdDidClose
                                        (interstitialAd
                                        : FBInterstitialAd); cdecl;
                                        procedure interstitialAdWillClose
                                        (interstitialAd
                                        : FBInterstitialAd); cdecl;
                                        procedure interstitialAdDidLoad
                                        (interstitialAd
                                        : FBInterstitialAd); cdecl;
                                        procedure interstitialAd
                                        (interstitialAd: FBInterstitialAd;
                                        didFailWithError: NSError); cdecl;
                                        procedure interstitialAdWillLogImpression
                                        (interstitialAd
                                        : FBInterstitialAd); cdecl;
                                        end;

                                        FBMediaViewDelegate = interface
                                        (IObjectiveC)
                                        ['{20EE46C5-9027-4BC8-B2D1-0036B8896DFC}']
                                        procedure mediaViewDidLoad
                                        (mediaView: FBMediaView);
                                        cdecl;
                                        end;

                                        FBNativeAdDelegate = interface
                                        (IObjectiveC)
                                        ['{A4B36225-C194-4D00-A164-17B402743CC5}']
                                        procedure nativeAdDidLoad
                                        (nativeAd: FBNativeAd);
                                        cdecl;
                                        procedure nativeAdWillLogImpression
                                        (nativeAd: FBNativeAd); cdecl;
                                        procedure nativeAd(nativeAd: FBNativeAd;
                                        didFailWithError: NSError); cdecl;
                                        procedure nativeAdDidClick
                                        (nativeAd: FBNativeAd); cdecl;
                                        procedure nativeAdDidFinishHandlingClick
                                        (nativeAd: FBNativeAd); cdecl;
                                        end;

                                        FBNativeAdsManagerDelegate = interface
                                        (IObjectiveC)
                                        ['{AF40900E-0892-4A6B-91DE-8335FCB8FD5C}']
                                        procedure nativeAdsLoaded;
                                        cdecl;
                                        procedure nativeAdsFailedToLoadWithError
                                        (error: NSError); cdecl;
                                        end;

                                        // ===== Exported string consts =====

                                        function FBAudienceNetworkErrorDomain
                                        : NSString;
                                        function kFBAdSize320x50: Pointer;
                                        function kFBAdSizeHeight50Banner
                                        : Pointer;
                                        function kFBAdSizeHeight90Banner
                                        : Pointer;
                                        function kFBAdSizeInterstitial: Pointer;
                                        function kFBAdSizeHeight250Rectangle
                                        : Pointer;
                                        function FBAdStarRating: Pointer;


                                        // ===== External functions =====

                                        const
                                        libFBAudienceNetwork =
                                        '/System/Library/Frameworks/FBAudienceNetwork.framework/FBAudienceNetwork';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  FBAudienceNetworkModule: THandle;

{$ENDIF IOS}

function FBAudienceNetworkErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libFBAudienceNetwork,
    'FBAudienceNetworkErrorDomain');
end;

function kFBAdSize320x50: Pointer;
begin
  Result := CocoaPointerConst(libFBAudienceNetwork, 'kFBAdSize320x50');
end;

function kFBAdSizeHeight50Banner: Pointer;
begin
  Result := CocoaPointerConst(libFBAudienceNetwork, 'kFBAdSizeHeight50Banner');
end;

function kFBAdSizeHeight90Banner: Pointer;
begin
  Result := CocoaPointerConst(libFBAudienceNetwork, 'kFBAdSizeHeight90Banner');
end;

function kFBAdSizeInterstitial: Pointer;
begin
  Result := CocoaPointerConst(libFBAudienceNetwork, 'kFBAdSizeInterstitial');
end;

function kFBAdSizeHeight250Rectangle: Pointer;
begin
  Result := CocoaPointerConst(libFBAudienceNetwork,
    'kFBAdSizeHeight250Rectangle');
end;

function FBAdStarRating: Pointer;
begin
  Result := CocoaPointerConst(libFBAudienceNetwork, 'FBAdStarRating');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

FBAudienceNetworkModule := dlopen(MarshaledAString(libFBAudienceNetwork),
  RTLD_LAZY);

finalization

dlclose(FBAudienceNetworkModule);
{$ENDIF IOS}

end.
