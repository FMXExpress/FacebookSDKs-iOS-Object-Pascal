unit uFacebookSDK;

interface

uses
  iOSapi.UIKit, iOSapi.Foundation,
  Macapi.Helpers,
  iOSapi.FBSDKCoreKit, iOSapi.FBSDKShareKit,
  FMX.Helpers.iOS, FMX.Graphics;

type
  tFacebookConversionTracking = class
    class procedure TrackLaunch;
    class procedure TrackPurchase(const aCurrency: string; aValue: Double);
    class procedure EnableDebuggingLogging;
  end;

  tFacebookShare = class
  private
    class function GetRootViewController: UIViewController;
    class procedure ShowShareDialog(aContent: Pointer);
    /// <summary> Hans: Use this instead of ShowShareDialog if you want to control how it should fallback if FB app not installed. </summary>
    class procedure ShowShareDialogMode(aContent: Pointer);
  public
    class function IsAppInstalled: Boolean;
    /// <summary> Hans: Works only if Facebook app is installed. If not installed, nothing happens and it does not fall back to
    /// website, as image sharing is not supported by this method (only link sharing). Use IsAppInstalled first to detect. </summary>
    class procedure ShareImage(aImage: TBitmap);
    /// <summary> Hans: Opens Facebook app if installed, else shows a web based pop-up window.</summary>
    class procedure ShareLink(aLink, aTitle, aDescription, aImageURL: string);
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


{ tFacebookShare }

class function tFacebookShare.IsAppInstalled: Boolean;
begin
  result := TUIApplication.Wrap(TUIApplication.OCClass.sharedApplication).canOpenURL(StrToNSUrl('fbapi://'));
end;

class function tFacebookShare.GetRootViewController: UIViewController;
begin
//Get the main window to be the parent of the facebook window (First window is always the main window)
  Result := TUIWindow.Wrap(TUIApplication.Wrap(TUIApplication.OCClass.sharedApplication).windows.objectAtIndex(0)).rootViewController;
end;

class procedure tFacebookShare.ShareImage(aImage: TBitmap);
var lPhoto: FBSDKSharePhoto;
    lArray: NSArray;
    lPhotoContent: FBSDKSharePhotoContent;
begin
  {$ifdef DEBUG} Assert(IsAppInstalled, 'tFacebookShare.ShareImage: Image sharing is only supported when FB app is installed.'); {$endif}
//Create a FB photo
  lPhoto := TFBSDKSharePhoto.Create;
  lPhoto.setImage(BitmapToUIImage(aImage));
  lPhoto.setUserGenerated(true);
  //lPhoto.setCaption(StrToNSStr('Test caption')); <- does not seem to show up
//Add the photo to the list of photos to be shared
  lArray := TNSArray.Wrap(TNSArray.OCClass.arrayWithObject(NSObjectToID(lPhoto)));
  lPhotoContent := TFBSDKSharePhotoContent.Create;
  lPhotoContent.setPhotos(lArray);
  //lPhotoContent.SetcontentURL(StrToNSUrl('http://www.mycompany.com')); <- does not seem to work
  ShowShareDialog( NSObjectToID(lPhotoContent) );
end;

class procedure tFacebookShare.ShareLink(aLink, aTitle, aDescription, aImageURL: string);
var
  lLinkContent: FBSDKShareLinkContent;
begin
  lLinkContent := TFBSDKShareLinkContent.Create;
  lLinkContent.setContentTitle(StrToNSStr(aTitle));
  lLinkContent.setContentDescription(StrToNSStr(aDescription));
  lLinkContent.setImageURL(StrToNSUrl(aImageURL));
  lLinkContent.SetcontentURL(StrToNSUrl(aLink));
  ShowShareDialogMode( NSObjectToID(lLinkContent) );
end;

class procedure tFacebookShare.ShowShareDialog(aContent: Pointer);
begin
  TFBSDKShareDialog.OCClass.showFromViewController(GetRootViewController, aContent, nil);
end;

class procedure tFacebookShare.ShowShareDialogMode(aContent: Pointer);
var lFBSDKShareDialog: FBSDKShareDialog;
begin
{Mode constants:
  FBSDKShareDialogModeAutomatic:   Automatically detects if FB app installed and choose appropriate mode
  FBSDKShareDialogModeNative:      Switches to FB app with "back to MyApp" link in toolbar  (fails silently if FB app not installed)
  FBSDKShareDialogModeShareSheet:  Show a FB app popup window with my app as background (fails silently if FB app not installed)
  FBSDKShareDialogModeBrowser:     Show browser window with autofetched text and image from the shared url
  FBSDKShareDialogModeWeb:         Show pop-up window with autofetched text and image from the shared url
  FBSDKShareDialogModeFeedBrowser: Show browser window with supplied text and image
  FBSDKShareDialogModeFeedWeb:     Show pop-up window with supplied text and image
}

  lFBSDKShareDialog := TFBSDKShareDialog.Create;
  lFBSDKShareDialog.setshareContent(aContent);
  lFBSDKShareDialog.setFromViewController(GetRootViewController);
  lFBSDKShareDialog.setMode(FBSDKShareDialogModeNative);
  if not lFBSDKShareDialog.canShow then //if FB app not installed, fallback to web access
    lFBSDKShareDialog.setMode(FBSDKShareDialogModeFeedWeb);
  lFBSDKShareDialog.Show;
end;

end.
