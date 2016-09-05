unit uFacebookSDK;

interface

uses
  iOSapi.FBSDKCoreKit, Macapi.Helpers;

type
  tFacebookConversionTracking = class
    class procedure TrackLaunch;
    class procedure TrackPurchase(const aCurrency: string; aValue: Double);
    class procedure EnableDebuggingLogging;
  end;

implementation

{ tFacebookConversionTracking }

class procedure tFacebookConversionTracking.EnableDebuggingLogging;
begin
  TFBSDKSettings.OCClass.enableLoggingBehavior(FBSDKLoggingBehaviorAppEvents);
end;

class procedure tFacebookConversionTracking.TrackLaunch;
begin
  TFBSDKAppEvents.OCClass.activateApp;



//  - (void)applicationDidBecomeActive:(UIApplication *)application { [FBSDKAppEvents activateApp];  }
//
//  - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    [[FBSDKApplicationDelegate sharedInstance] application:application
//                             didFinishLaunchingWithOptions:launchOptions];
//    return YES;
//  }
//
//  - (BOOL)application:(UIApplication *)application
//              openURL:(NSURL *)url
//    sourceApplication:(NSString *)sourceApplication
//           annotation:(id)annotation {
//    return [[FBSDKApplicationDelegate sharedInstance] application:application
//                                                           openURL:url
//                                                 sourceApplication:sourceApplication
//                                                        annotation:annotation];
//  }

end;

class procedure tFacebookConversionTracking.TrackPurchase(const aCurrency: string; aValue: Double);
begin
  TFBSDKAppEvents.OCClass.logPurchaseCurrency(aValue, StrToNSStr(aCurrency));
end;

end.
