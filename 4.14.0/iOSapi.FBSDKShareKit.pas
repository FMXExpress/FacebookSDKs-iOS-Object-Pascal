{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework FBSDKShareKit
//

unit iOSapi.FBSDKShareKit;

interface

uses
  Macapi.CoreFoundation,
  Macapi.CoreServices,
  Macapi.Dispatch,
  //Macapi.Foundation,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  //Macapi.QuartzCore,
  iOSapi.CocoaTypes,
  iOSapi.CoreGraphics,
  iOSapi.FBSDKCoreKit,
  iOSapi.Foundation,
  FMX.TMSNativeUICore,
  iOSapi.UIKit;

const
  FBSDKAppGroupPrivacyOpen = 0;
  FBSDKAppGroupPrivacyClosed = 1;
  FBSDKAppInviteDestinationFacebook = 0;
  FBSDKAppInviteDestinationMessenger = 1;
  FBSDKGameRequestActionTypeNone = 0;
  FBSDKGameRequestActionTypeSend = 1;
  FBSDKGameRequestActionTypeAskFor = 2;
  FBSDKGameRequestActionTypeTurn = 3;
  FBSDKGameRequestFilterNone = 0;
  FBSDKGameRequestFilterAppUsers = 1;
  FBSDKGameRequestFilterAppNonUsers = 2;
  FBSDKLikeObjectTypeUnknown = 0;
  FBSDKLikeObjectTypeOpenGraph = 1;
  FBSDKLikeObjectTypePage = 2;
  FBSDKLikeControlAuxiliaryPositionInline = 0;
  FBSDKLikeControlAuxiliaryPositionTop = 1;
  FBSDKLikeControlAuxiliaryPositionBottom = 2;
  FBSDKLikeControlHorizontalAlignmentLeft = 0;
  FBSDKLikeControlHorizontalAlignmentCenter = 1;
  FBSDKLikeControlHorizontalAlignmentRight = 2;
  FBSDKLikeControlStyleStandard = 0;
  FBSDKLikeControlStyleBoxCount = 1;
  FBSDKShareReservedErrorCode = 200;
  FBSDKShareOpenGraphErrorCode = 201;
  FBSDKShareDialogNotAvailableErrorCode = 202;
  FBSDKShareUnknownErrorCode = 203;
  FBSDKShareDialogModeAutomatic = 0;
  FBSDKShareDialogModeNative = 1;
  FBSDKShareDialogModeShareSheet = 2;
  FBSDKShareDialogModeBrowser = 3;
  FBSDKShareDialogModeWeb = 4;
  FBSDKShareDialogModeFeedBrowser = 5;
  FBSDKShareDialogModeFeedWeb = 6;

type

  // ===== Forward declarations =====
{$M+}
  FBSDKAppGroupContent = interface;
  FBSDKAppGroupAddDialogDelegate = interface;
  FBSDKAppGroupAddDialog = interface;
  FBSDKAppGroupJoinDialogDelegate = interface;
  FBSDKAppGroupJoinDialog = interface;
  FBSDKAppInviteContent = interface;
  FBSDKAppInviteDialogDelegate = interface;
  FBSDKAppInviteDialog = interface;
  FBSDKGameRequestContent = interface;
  FBSDKGameRequestDialogDelegate = interface;
  FBSDKGameRequestDialog = interface;
  FBSDKHashtag = interface;
  FBSDKLiking = interface;
  FBSDKLikeButton = interface;
  FBSDKLikeControl = interface;
  FBSDKSharingContent = interface;
  FBSDKSharingDelegate = interface;
  FBSDKSharing = interface;
  FBSDKSharingDialog = interface;
  FBSDKMessageDialog = interface;
  FBSDKSharingButton = interface;
  FBSDKSendButton = interface;
  FBSDKShareOpenGraphObject = interface;
  FBSDKSharePhoto = interface;
  FBSDKShareOpenGraphValueContaining = interface;
  FBSDKShareOpenGraphValueContainer = interface;
  FBSDKShareAPI = interface;
  FBSDKShareButton = interface;
  FBSDKShareDialog = interface;
  FBSDKShareLinkContent = interface;
  FBSDKShareOpenGraphAction = interface;
  FBSDKShareOpenGraphContent = interface;
  FBSDKSharePhotoContent = interface;
  FBSDKShareVideo = interface;
  FBSDKShareVideoContent = interface;
  FBSDKShareMediaContent = interface;

  // ===== Framework typedefs =====
{$M+}
  NSUInteger = Cardinal;
  FBSDKAppGroupPrivacy = NSUInteger;
  FBSDKAppInviteDestination = NSUInteger;
  FBSDKGameRequestActionType = NSUInteger;
  FBSDKGameRequestFilter = NSUInteger;
  FBSDKLikeObjectType = NSUInteger;
  FBSDKLikeControlAuxiliaryPosition = NSUInteger;
  FBSDKLikeControlHorizontalAlignment = NSUInteger;
  FBSDKLikeControlStyle = NSUInteger;
  CGFloat = Single;
  TFBSDKShareKitBlock = procedure(param1: NSString; param2: Pointer;
    param3: PBoolean) of object;
  NSInteger = Integer;
  FBSDKShareErrorCode = NSInteger;
  FBSDKShareDialogMode = NSUInteger;
  // ===== Interface declarations =====

  FBSDKAppGroupContentClass = interface(NSObjectClass)
    ['{1192743E-3511-4920-A11D-185B2797C0C2}']
  end;

  FBSDKAppGroupContent = interface(NSObject)
    ['{6783E130-C2F4-44D2-A756-F28A4974EC70}']
    procedure setGroupDescription(groupDescription: NSString); cdecl;
    function groupDescription: NSString; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setPrivacy(privacy: FBSDKAppGroupPrivacy); cdecl;
    function privacy: FBSDKAppGroupPrivacy; cdecl;
    function isEqualToAppGroupContent(content: FBSDKAppGroupContent)
      : Boolean; cdecl;
  end;

  TFBSDKAppGroupContent = class(TOCGenericImport<FBSDKAppGroupContentClass,
    FBSDKAppGroupContent>)
  end;

  PFBSDKAppGroupContent = Pointer;

  FBSDKAppGroupAddDialogClass = interface(NSObjectClass)
    ['{CC64B7CD-0DEF-4B38-8948-97B99173137C}']
    { class } function showWithContent(content: FBSDKAppGroupContent;
      delegate: Pointer): Pointer { instancetype }; cdecl;
  end;

  FBSDKAppGroupAddDialog = interface(NSObject)
    ['{BFA58A15-398B-44B1-B1CD-F2083E6032E9}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setContent(content: FBSDKAppGroupContent); cdecl;
    function content: FBSDKAppGroupContent; cdecl;
    function canShow: Boolean; cdecl;
    function show: Boolean; cdecl;
    function validateWithError(errorRef: NSError): Boolean; cdecl;
  end;

  TFBSDKAppGroupAddDialog = class(TOCGenericImport<FBSDKAppGroupAddDialogClass,
    FBSDKAppGroupAddDialog>)
  end;

  PFBSDKAppGroupAddDialog = Pointer;

  FBSDKAppGroupJoinDialogClass = interface(NSObjectClass)
    ['{E87BAAE9-949A-4067-A3F9-7271D1864FC5}']
    { class } function showWithGroupID(groupID: NSString; delegate: Pointer)
      : Pointer { instancetype }; cdecl;
  end;

  FBSDKAppGroupJoinDialog = interface(NSObject)
    ['{4A185755-3367-41A4-9A63-EC2971CB6B25}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setGroupID(groupID: NSString); cdecl;
    function groupID: NSString; cdecl;
    function canShow: Boolean; cdecl;
    function show: Boolean; cdecl;
    function validateWithError(errorRef: NSError): Boolean; cdecl;
  end;

  TFBSDKAppGroupJoinDialog = class
    (TOCGenericImport<FBSDKAppGroupJoinDialogClass, FBSDKAppGroupJoinDialog>)
  end;

  PFBSDKAppGroupJoinDialog = Pointer;

  FBSDKAppInviteContentClass = interface(NSObjectClass)
    ['{33829217-7B31-4404-BCB7-94E59595CC19}']
  end;

  FBSDKAppInviteContent = interface(NSObject)
    ['{C28C7397-40B5-4BB0-899F-F45D247D6830}']
    procedure setAppInvitePreviewImageURL(appInvitePreviewImageURL
      : NSURL); cdecl;
    function appInvitePreviewImageURL: NSURL; cdecl;
    procedure setAppLinkURL(appLinkURL: NSURL); cdecl;
    function appLinkURL: NSURL; cdecl;
    procedure setPreviewImageURL(previewImageURL: NSURL); cdecl;
    function previewImageURL: NSURL; cdecl;
    procedure setPromotionCode(promotionCode: NSString); cdecl;
    function promotionCode: NSString; cdecl;
    procedure setPromotionText(promotionText: NSString); cdecl;
    function promotionText: NSString; cdecl;
    procedure setDestination(destination: FBSDKAppInviteDestination); cdecl;
    function destination: FBSDKAppInviteDestination; cdecl;
    function isEqualToAppInviteContent(content: FBSDKAppInviteContent)
      : Boolean; cdecl;
  end;

  TFBSDKAppInviteContent = class(TOCGenericImport<FBSDKAppInviteContentClass,
    FBSDKAppInviteContent>)
  end;

  PFBSDKAppInviteContent = Pointer;

  FBSDKAppInviteDialogClass = interface(NSObjectClass)
    ['{35484D44-5493-4FFD-935B-2B0F3E4C5A1F}']
    { class } function showFromViewController(viewController: UIViewController;
      withContent: FBSDKAppInviteContent; delegate: Pointer)
      : Pointer { instancetype }; cdecl;
    { class } function showWithContent(content: FBSDKAppInviteContent;
      delegate: Pointer): Pointer { instancetype }; cdecl;
  end;

  FBSDKAppInviteDialog = interface(NSObject)
    ['{8EB4D51F-9992-4BFC-A8DE-63D0730AB8CF}']
    procedure setFromViewController(fromViewController
      : UIViewController); cdecl;
    function fromViewController: UIViewController; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setContent(content: FBSDKAppInviteContent); cdecl;
    function content: FBSDKAppInviteContent; cdecl;
    function canShow: Boolean; cdecl;
    function show: Boolean; cdecl;
    function validateWithError(errorRef: NSError): Boolean; cdecl;
  end;

  TFBSDKAppInviteDialog = class(TOCGenericImport<FBSDKAppInviteDialogClass,
    FBSDKAppInviteDialog>)
  end;

  PFBSDKAppInviteDialog = Pointer;

  FBSDKGameRequestContentClass = interface(NSObjectClass)
    ['{E10165FB-82EC-453F-8969-4E6114752581}']
  end;

  FBSDKGameRequestContent = interface(NSObject)
    ['{0666095B-CEC8-4F76-A51C-0A7F2A5D0ED3}']
    procedure setActionType(actionType: FBSDKGameRequestActionType); cdecl;
    function actionType: FBSDKGameRequestActionType; cdecl;
    function isEqualToGameRequestContent(content: FBSDKGameRequestContent)
      : Boolean; cdecl;
    procedure setData(data: NSString); cdecl;
    function data: NSString; cdecl;
    procedure setFilters(filters: FBSDKGameRequestFilter); cdecl;
    function filters: FBSDKGameRequestFilter; cdecl;
    procedure setMessage(message: NSString); cdecl;
    function message: NSString; cdecl;
    procedure setObjectID(objectID: NSString); cdecl;
    function objectID: NSString; cdecl;
    procedure setRecipients(recipients: NSArray); cdecl;
    function recipients: NSArray; cdecl;
    procedure setRecipientSuggestions(recipientSuggestions: NSArray); cdecl;
    function recipientSuggestions: NSArray; cdecl;
    procedure setSuggestions(suggestions: NSArray); cdecl;
    function suggestions: NSArray; cdecl;
    procedure setTitle(title: NSString); cdecl;
    function title: NSString; cdecl;
    procedure setTo(&to: NSArray); cdecl;
    function &to: NSArray; cdecl;
  end;

  TFBSDKGameRequestContent = class
    (TOCGenericImport<FBSDKGameRequestContentClass, FBSDKGameRequestContent>)
  end;

  PFBSDKGameRequestContent = Pointer;

  FBSDKGameRequestDialogClass = interface(NSObjectClass)
    ['{26C70B18-7CD2-4100-AFAA-88E874B4769D}']
    { class } function showWithContent(content: FBSDKGameRequestContent;
      delegate: Pointer): Pointer { instancetype }; cdecl;
  end;

  FBSDKGameRequestDialog = interface(NSObject)
    ['{8BD1899D-8A24-47AE-A5E3-173AC7895E8A}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setContent(content: FBSDKGameRequestContent); cdecl;
    function content: FBSDKGameRequestContent; cdecl;
    procedure setFrictionlessRequestsEnabled(frictionlessRequestsEnabled
      : Boolean); cdecl;
    function frictionlessRequestsEnabled: Boolean; cdecl;
    function canShow: Boolean; cdecl;
    function show: Boolean; cdecl;
    function validateWithError(errorRef: NSError): Boolean; cdecl;
  end;

  TFBSDKGameRequestDialog = class(TOCGenericImport<FBSDKGameRequestDialogClass,
    FBSDKGameRequestDialog>)
  end;

  PFBSDKGameRequestDialog = Pointer;

  FBSDKHashtagClass = interface(NSObjectClass)
    ['{A624C31A-75C5-45C8-A722-E050A125B886}']
    { class } function hashtagWithString(hashtagString: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  FBSDKHashtag = interface(NSObject)
    ['{0635DE1D-22F3-44B9-B2E7-F4ADD9863B5E}']
    procedure setStringRepresentation(stringRepresentation: NSString); cdecl;
    function stringRepresentation: NSString; cdecl;
    function isValid: Boolean; cdecl;
    function isEqualToHashtag(hashtag: FBSDKHashtag): Boolean; cdecl;
  end;

  TFBSDKHashtag = class(TOCGenericImport<FBSDKHashtagClass, FBSDKHashtag>)
  end;

  PFBSDKHashtag = Pointer;

  FBSDKLikeButtonClass = interface(FBSDKButtonClass)
    ['{26324B8B-9436-477E-BAB9-BC9B1279CCD2}']
  end;

  FBSDKLikeButton = interface(FBSDKButton)
    ['{410F0637-F162-4B8B-A592-DB02F4CC7883}']
    procedure setSoundEnabled(soundEnabled: Boolean); cdecl;
    function isSoundEnabled: Boolean; cdecl;
  end;

  TFBSDKLikeButton = class(TOCGenericImport<FBSDKLikeButtonClass,
    FBSDKLikeButton>)
  end;

  PFBSDKLikeButton = Pointer;

  FBSDKLikeControlClass = interface(UIControlClass)
    ['{86D1FF78-40AC-45E6-883A-01A6D8EC3B78}']
  end;

  FBSDKLikeControl = interface(UIControl)
    ['{4C1D4E00-0870-420A-AAC0-BC5EEC4B7551}']
    procedure setForegroundColor(foregroundColor: UIColor); cdecl;
    function foregroundColor: UIColor; cdecl;
    procedure setLikeControlAuxiliaryPosition(likeControlAuxiliaryPosition
      : FBSDKLikeControlAuxiliaryPosition); cdecl;
    function likeControlAuxiliaryPosition
      : FBSDKLikeControlAuxiliaryPosition; cdecl;
    procedure setLikeControlHorizontalAlignment(likeControlHorizontalAlignment
      : FBSDKLikeControlHorizontalAlignment); cdecl;
    function likeControlHorizontalAlignment
      : FBSDKLikeControlHorizontalAlignment; cdecl;
    procedure setLikeControlStyle(likeControlStyle
      : FBSDKLikeControlStyle); cdecl;
    function likeControlStyle: FBSDKLikeControlStyle; cdecl;
    procedure setPreferredMaxLayoutWidth(preferredMaxLayoutWidth
      : CGFloat); cdecl;
    function preferredMaxLayoutWidth: CGFloat; cdecl;
    procedure setSoundEnabled(soundEnabled: Boolean); cdecl;
    function isSoundEnabled: Boolean; cdecl;
  end;

  TFBSDKLikeControl = class(TOCGenericImport<FBSDKLikeControlClass,
    FBSDKLikeControl>)
  end;

  PFBSDKLikeControl = Pointer;

  FBSDKMessageDialogClass = interface(NSObjectClass)
    ['{7EF7FD15-3F0C-4CA5-9D56-568C4D66E85E}']
    { class } function showWithContent(content: Pointer; delegate: Pointer)
      : Pointer { instancetype }; cdecl;
  end;

  FBSDKMessageDialog = interface(NSObject)
    ['{B25365DD-0051-4C50-AB1D-64E2B60EA829}']
  end;

  TFBSDKMessageDialog = class(TOCGenericImport<FBSDKMessageDialogClass,
    FBSDKMessageDialog>)
  end;

  PFBSDKMessageDialog = Pointer;

  FBSDKSendButtonClass = interface(FBSDKButtonClass)
    ['{312CD22A-1A21-4B2F-B00F-3A3E2BAB4D9C}']
  end;

  FBSDKSendButton = interface(FBSDKButton)
    ['{649DF69C-2BE1-4F5C-8EE8-B09EADD07617}']
  end;

  TFBSDKSendButton = class(TOCGenericImport<FBSDKSendButtonClass,
    FBSDKSendButton>)
  end;

  PFBSDKSendButton = Pointer;

  FBSDKShareOpenGraphValueContainerClass = interface(NSObjectClass)
    ['{DCAB2782-E951-4305-8F61-8873B50EEE87}']
  end;

  FBSDKShareOpenGraphValueContainer = interface(NSObject)
    ['{5D8FB680-B28C-45EC-9A1B-95E32A085DBA}']
  end;

  TFBSDKShareOpenGraphValueContainer = class
    (TOCGenericImport<FBSDKShareOpenGraphValueContainerClass,
    FBSDKShareOpenGraphValueContainer>)
  end;

  PFBSDKShareOpenGraphValueContainer = Pointer;

  FBSDKShareOpenGraphObjectClass = interface
    (FBSDKShareOpenGraphValueContainerClass)
    ['{961C6285-E6D5-420A-A006-92DE35E0663C}']
    { class } function objectWithProperties(properties: NSDictionary)
      : Pointer { instancetype }; cdecl;
  end;

  FBSDKShareOpenGraphObject = interface(FBSDKShareOpenGraphValueContainer)
    ['{9EFBBCBD-4C97-413A-A691-6709B96B755C}']
    function isEqualToShareOpenGraphObject(&object: FBSDKShareOpenGraphObject)
      : Boolean; cdecl;
  end;

  TFBSDKShareOpenGraphObject = class
    (TOCGenericImport<FBSDKShareOpenGraphObjectClass,
    FBSDKShareOpenGraphObject>)
  end;

  PFBSDKShareOpenGraphObject = Pointer;

  FBSDKSharePhotoClass = interface(NSObjectClass)
    ['{29951F0D-6F0D-49E9-85ED-91278172CBF9}']
    { class } function photoWithImage(image: UIImage; userGenerated: Boolean)
      : Pointer { instancetype }; cdecl;
    { class } function photoWithImageURL(imageURL: NSURL;
      userGenerated: Boolean): Pointer { instancetype }; cdecl;
  end;

  FBSDKSharePhoto = interface(NSObject)
    ['{B90F76EC-3EDE-4320-8D7B-3A3B2CC8212D}']
    procedure setImage(image: UIImage); cdecl;
    function image: UIImage; cdecl;
    procedure setImageURL(imageURL: NSURL); cdecl;
    function imageURL: NSURL; cdecl;
    procedure setUserGenerated(userGenerated: Boolean); cdecl;
    function isUserGenerated: Boolean; cdecl;
    function isEqualToSharePhoto(photo: FBSDKSharePhoto): Boolean; cdecl;
    procedure setCaption(caption: NSString); cdecl;
    function caption: NSString; cdecl;
  end;

  TFBSDKSharePhoto = class(TOCGenericImport<FBSDKSharePhotoClass,
    FBSDKSharePhoto>)
  end;

  PFBSDKSharePhoto = Pointer;

  FBSDKShareAPIClass = interface(NSObjectClass)
    ['{EF579ACE-F52E-465A-BD80-784AF8F91AEC}']
    { class } function shareWithContent(content: Pointer; delegate: Pointer)
      : Pointer { instancetype }; cdecl;
  end;

  FBSDKShareAPI = interface(NSObject)
    ['{63B43E10-502A-4D95-A4F6-60FC04F08F90}']
    procedure setMessage(message: NSString); cdecl;
    function message: NSString; cdecl;
    procedure setGraphNode(graphNode: NSString); cdecl;
    function graphNode: NSString; cdecl;
    procedure setAccessToken(accessToken: FBSDKAccessToken); cdecl;
    function accessToken: FBSDKAccessToken; cdecl;
    function canShare: Boolean; cdecl;
    function createOpenGraphObject(openGraphObject: FBSDKShareOpenGraphObject)
      : Boolean; cdecl;
    function share: Boolean; cdecl;
  end;

  TFBSDKShareAPI = class(TOCGenericImport<FBSDKShareAPIClass, FBSDKShareAPI>)
  end;

  PFBSDKShareAPI = Pointer;

  FBSDKShareButtonClass = interface(FBSDKButtonClass)
    ['{9B3CAABC-64F7-4362-8AA8-1CA453E887E0}']
  end;

  FBSDKShareButton = interface(FBSDKButton)
    ['{D6CE76B2-B81E-4F21-B05E-D25440C5BAA9}']
  end;

  TFBSDKShareButton = class(TOCGenericImport<FBSDKShareButtonClass,
    FBSDKShareButton>)
  end;

  PFBSDKShareButton = Pointer;

  FBSDKShareDialogClass = interface(NSObjectClass)
    ['{E3EC5888-22FC-4BC7-963E-5C6D0639A3CD}']
    { class } function showFromViewController(viewController: UIViewController;
      withContent: Pointer; delegate: Pointer): Pointer { instancetype }; cdecl;
  end;

  FBSDKShareDialog = interface(NSObject)
    ['{01A5B261-B1DB-4846-8B6C-FCF40322AD2A}']
    procedure setFromViewController(fromViewController
      : UIViewController); cdecl;
    function fromViewController: UIViewController; cdecl;
    procedure setMode(mode: FBSDKShareDialogMode); cdecl;
    function mode: FBSDKShareDialogMode; cdecl;
    //added from FBSDKSharingDialog
    function canShow: Boolean; cdecl;
    function show: Boolean; cdecl;
    //added from FBSDKSharing
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setShareContent(shareContent: Pointer); cdecl;
    function shareContent: Pointer; cdecl;
    procedure setShouldFailOnDataError(shouldFailOnDataError: Boolean); cdecl;
    function shouldFailOnDataError: Boolean; cdecl;
    function validateWithError(errorRef: NSError): Boolean; cdecl;
  end;

  TFBSDKShareDialog = class(TOCGenericImport<FBSDKShareDialogClass,
    FBSDKShareDialog>)
  end;

  PFBSDKShareDialog = Pointer;

  FBSDKShareLinkContentClass = interface(NSObjectClass)
    ['{3E151FA3-E273-4455-A02B-AA08018BC39F}']
  end;

  FBSDKShareLinkContent = interface(NSObject)
    ['{09744C48-BB8F-49AB-A42E-F2E2C2C6129E}']
    procedure setContentDescription(contentDescription: NSString); cdecl;
    function contentDescription: NSString; cdecl;
    procedure setContentTitle(contentTitle: NSString); cdecl;
    function contentTitle: NSString; cdecl;
    procedure setImageURL(imageURL: NSURL); cdecl;
    function imageURL: NSURL; cdecl;
    procedure setQuote(quote: NSString); cdecl;
    function quote: NSString; cdecl;
    function isEqualToShareLinkContent(content: FBSDKShareLinkContent): Boolean; cdecl;
    procedure setContentURL(contentURL: NSURL); cdecl;
    function contentURL: NSURL; cdecl;
  end;

  TFBSDKShareLinkContent = class(TOCGenericImport<FBSDKShareLinkContentClass, FBSDKShareLinkContent>)
  end;

  PFBSDKShareLinkContent = Pointer;

  FBSDKShareOpenGraphActionClass = interface
    (FBSDKShareOpenGraphValueContainerClass)
    ['{BAC1E769-AE18-406F-A8F3-6F9B97017F55}']
    [MethodName('actionWithType:object:key:')]
    { class } function actionWithTypeObjectKey(actionType: NSString;
      &object: FBSDKShareOpenGraphObject; key: NSString)
      : Pointer { instancetype }; cdecl;
    [MethodName('actionWithType:objectID:key:')]
    { class } function actionWithTypeObjectIDKey(actionType: NSString;
      objectID: NSString; key: NSString): Pointer { instancetype }; cdecl;
    [MethodName('actionWithType:objectURL:key:')]
    { class } function actionWithTypeObjectURLKey(actionType: NSString;
      objectURL: NSURL; key: NSString): Pointer { instancetype }; cdecl;
  end;

  FBSDKShareOpenGraphAction = interface(FBSDKShareOpenGraphValueContainer)
    ['{BD27F9BD-932B-4569-A2FB-54499FD51EE1}']
    procedure setActionType(actionType: NSString); cdecl;
    function actionType: NSString; cdecl;
    function isEqualToShareOpenGraphAction(action: FBSDKShareOpenGraphAction)
      : Boolean; cdecl;
  end;

  TFBSDKShareOpenGraphAction = class
    (TOCGenericImport<FBSDKShareOpenGraphActionClass,
    FBSDKShareOpenGraphAction>)
  end;

  PFBSDKShareOpenGraphAction = Pointer;

  FBSDKShareOpenGraphContentClass = interface(NSObjectClass)
    ['{1289427E-3928-4BEF-93F0-0E3D40852980}']
  end;

  FBSDKShareOpenGraphContent = interface(NSObject)
    ['{5831A4E9-A977-4CD5-8ADE-5A5FE26C54FF}']
    procedure setAction(action: FBSDKShareOpenGraphAction); cdecl;
    function action: FBSDKShareOpenGraphAction; cdecl;
    procedure setPreviewPropertyName(previewPropertyName: NSString); cdecl;
    function previewPropertyName: NSString; cdecl;
    function isEqualToShareOpenGraphContent(content: FBSDKShareOpenGraphContent)
      : Boolean; cdecl;
  end;

  TFBSDKShareOpenGraphContent = class
    (TOCGenericImport<FBSDKShareOpenGraphContentClass,
    FBSDKShareOpenGraphContent>)
  end;

  PFBSDKShareOpenGraphContent = Pointer;

  FBSDKSharePhotoContentClass = interface(NSObjectClass)
    ['{C89C4AF1-8AA9-4807-9D1A-E64DEC2D4878}']
  end;

  FBSDKSharePhotoContent = interface(NSObject)
    ['{6BBA8C5D-93F1-47C9-89B8-7BD314D141B1}']
    procedure setPhotos(photos: NSArray); cdecl;
    function photos: NSArray; cdecl;
    function isEqualToSharePhotoContent(content: FBSDKSharePhotoContent)
      : Boolean; cdecl;
    procedure setContentURL(contentURL: NSURL); cdecl;
    function contentURL: NSURL; cdecl;
  end;

  TFBSDKSharePhotoContent = class(TOCGenericImport<FBSDKSharePhotoContentClass,
    FBSDKSharePhotoContent>)
  end;

  PFBSDKSharePhotoContent = Pointer;

  FBSDKShareVideoClass = interface(NSObjectClass)
    ['{AC17B5F0-1F62-4FAD-93A1-D3EB6CDC0194}']
    [MethodName('videoWithVideoURL:')]
    { class } function videoWithVideoURL(videoURL: NSURL)
      : Pointer { instancetype }; cdecl;
    [MethodName('videoWithVideoURL:previewPhoto:')]
    { class } function videoWithVideoURLPreviewPhoto(videoURL: NSURL;
      previewPhoto: FBSDKSharePhoto): Pointer { instancetype }; cdecl;
  end;

  FBSDKShareVideo = interface(NSObject)
    ['{95ACACF0-B275-4C4D-A2CE-587D3EC9491A}']
    procedure setVideoURL(videoURL: NSURL); cdecl;
    function videoURL: NSURL; cdecl;
    procedure setPreviewPhoto(previewPhoto: FBSDKSharePhoto); cdecl;
    function previewPhoto: FBSDKSharePhoto; cdecl;
    function isEqualToShareVideo(video: FBSDKShareVideo): Boolean; cdecl;
  end;

  TFBSDKShareVideo = class(TOCGenericImport<FBSDKShareVideoClass,
    FBSDKShareVideo>)
  end;

  PFBSDKShareVideo = Pointer;

  FBSDKShareVideoContentClass = interface(NSObjectClass)
    ['{F5B3FE91-608B-40D7-8AB8-235C3B6BF1F2}']
  end;

  FBSDKShareVideoContent = interface(NSObject)
    ['{9C6229C2-FD1D-4EAE-93F2-4FF0EBB15E68}']
    procedure setPreviewPhoto(previewPhoto: FBSDKSharePhoto); cdecl;
    function previewPhoto: FBSDKSharePhoto; cdecl;
    procedure setVideo(video: FBSDKShareVideo); cdecl;
    function video: FBSDKShareVideo; cdecl;
    function isEqualToShareVideoContent(content: FBSDKShareVideoContent)
      : Boolean; cdecl;
  end;

  TFBSDKShareVideoContent = class(TOCGenericImport<FBSDKShareVideoContentClass,
    FBSDKShareVideoContent>)
  end;

  PFBSDKShareVideoContent = Pointer;

  FBSDKShareMediaContentClass = interface(NSObjectClass)
    ['{EB361072-8B2C-4195-B0C4-8CF73981EB90}']
  end;

  FBSDKShareMediaContent = interface(NSObject)
    ['{B1D2AB2F-1DE1-430E-8F97-46A713224EBA}']
    procedure setMedia(media: NSArray); cdecl;
    function media: NSArray; cdecl;
    function isEqualToShareMediaContent(content: FBSDKShareMediaContent)
      : Boolean; cdecl;
  end;

  TFBSDKShareMediaContent = class(TOCGenericImport<FBSDKShareMediaContentClass,
    FBSDKShareMediaContent>)
  end;

  PFBSDKShareMediaContent = Pointer;

  // ===== Protocol declarations =====

  FBSDKAppGroupAddDialogDelegate = interface(IObjectiveC)
    ['{A735251D-6C99-419F-BD6E-D5F99F8EED34}']
    [MethodName('appGroupAddDialog:didCompleteWithResults:')]
    procedure appGroupAddDialogDidCompleteWithResults(appGroupAddDialog
      : FBSDKAppGroupAddDialog; didCompleteWithResults: NSDictionary); cdecl;
    [MethodName('appGroupAddDialog:didFailWithError:')]
    procedure appGroupAddDialogDidFailWithError(appGroupAddDialog
      : FBSDKAppGroupAddDialog; didFailWithError: NSError); cdecl;
    procedure appGroupAddDialogDidCancel(appGroupAddDialog
      : FBSDKAppGroupAddDialog); cdecl;
  end;

  FBSDKAppGroupJoinDialogDelegate = interface(IObjectiveC)
    ['{EABDEB21-C3F2-4D96-B075-008727BCF4CA}']
    [MethodName('appGroupJoinDialog:didCompleteWithResults:')]
    procedure appGroupJoinDialogDidCompleteWithResults(appGroupJoinDialog
      : FBSDKAppGroupJoinDialog; didCompleteWithResults: NSDictionary); cdecl;
    [MethodName('appGroupJoinDialog:didFailWithError:')]
    procedure appGroupJoinDialogDidFailWithError(appGroupJoinDialog
      : FBSDKAppGroupJoinDialog; didFailWithError: NSError); cdecl;
    procedure appGroupJoinDialogDidCancel(appGroupJoinDialog
      : FBSDKAppGroupJoinDialog); cdecl;
  end;

  FBSDKAppInviteDialogDelegate = interface(IObjectiveC)
    ['{6B23D48D-4D4A-4125-8030-5D555438CE98}']
    [MethodName('appInviteDialog:didCompleteWithResults:')]
    procedure appInviteDialogDidCompleteWithResults(appInviteDialog
      : FBSDKAppInviteDialog; didCompleteWithResults: NSDictionary); cdecl;
    [MethodName('appInviteDialog:didFailWithError:')]
    procedure appInviteDialogDidFailWithError(appInviteDialog
      : FBSDKAppInviteDialog; didFailWithError: NSError); cdecl;
  end;

  FBSDKGameRequestDialogDelegate = interface(IObjectiveC)
    ['{81446467-D284-49D2-9527-5C44227DA403}']
    [MethodName('gameRequestDialog:didCompleteWithResults:')]
    procedure gameRequestDialogDidCompleteWithResults(gameRequestDialog
      : FBSDKGameRequestDialog; didCompleteWithResults: NSDictionary); cdecl;
    [MethodName('gameRequestDialog:didFailWithError:')]
    procedure gameRequestDialogDidFailWithError(gameRequestDialog
      : FBSDKGameRequestDialog; didFailWithError: NSError); cdecl;
    procedure gameRequestDialogDidCancel(gameRequestDialog
      : FBSDKGameRequestDialog); cdecl;
  end;

  FBSDKLiking = interface(IObjectiveC)
    ['{9476C712-D4DE-4DDB-8A1E-82109637F447}']
    procedure setObjectID(objectID: NSString); cdecl;
    function objectID: NSString; cdecl;
    procedure setObjectType(objectType: FBSDKLikeObjectType); cdecl;
    function objectType: FBSDKLikeObjectType; cdecl;
  end;

  FBSDKSharingContent = interface(IObjectiveC)
    ['{BF1DBAD7-9326-44AA-A6BD-5E7F0515F925}']
    procedure setContentURL(contentURL: NSURL); cdecl;
    function contentURL: NSURL; cdecl;
    procedure setHashtag(hashtag: FBSDKHashtag); cdecl;
    function hashtag: FBSDKHashtag; cdecl;
    procedure setPeopleIDs(peopleIDs: NSArray); cdecl;
    function peopleIDs: NSArray; cdecl;
    procedure setPlaceID(placeID: NSString); cdecl;
    function placeID: NSString; cdecl;
    procedure setRef(ref: NSString); cdecl;
    function ref: NSString; cdecl;
  end;

  FBSDKSharingDelegate = interface(IObjectiveC)
    ['{B299312F-8C55-40DF-800C-7CACAE64B65B}']
    [MethodName('sharer:didCompleteWithResults:')]
    procedure sharerDidCompleteWithResults(sharer: Pointer;
      didCompleteWithResults: NSDictionary); cdecl;
    [MethodName('sharer:didFailWithError:')]
    procedure sharerDidFailWithError(sharer: Pointer;
      didFailWithError: NSError); cdecl;
    procedure sharerDidCancel(sharer: Pointer); cdecl;
  end;

  FBSDKSharing = interface(IObjectiveC)
    ['{0E421BB2-BF85-46AA-BFD0-F9B68599CA85}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setShareContent(shareContent: Pointer); cdecl;
    function shareContent: Pointer; cdecl;
    procedure setShouldFailOnDataError(shouldFailOnDataError: Boolean); cdecl;
    function shouldFailOnDataError: Boolean; cdecl;
    function validateWithError(errorRef: NSError): Boolean; cdecl;
  end;

  FBSDKSharingDialog = interface(IObjectiveC)
    ['{0A79A307-62CD-41D7-9B03-56283BEE8FAF}']
    function canShow: Boolean; cdecl;
    function show: Boolean; cdecl;
  end;

  FBSDKSharingButton = interface(IObjectiveC)
    ['{EC2AE4E9-99B0-4875-AECD-794E1619A769}']
    procedure setShareContent(shareContent: Pointer); cdecl;
    function shareContent: Pointer; cdecl;
  end;

  FBSDKShareOpenGraphValueContaining = interface(IObjectiveC)
    ['{AAFC9F2D-25E3-465B-BCDD-610AB9F7AA07}']
    function arrayForKey(key: NSString): NSArray; cdecl;
    procedure enumerateKeysAndObjectsUsingBlock
      (block: TFBSDKShareKitBlock); cdecl;
    function keyEnumerator: NSEnumerator; cdecl;
    function numberForKey(key: NSString): NSNumber; cdecl;
    function objectEnumerator: NSEnumerator; cdecl;
    function objectForKey(key: NSString): FBSDKShareOpenGraphObject; cdecl;
    function objectForKeyedSubscript(key: NSString): Pointer; cdecl;
    procedure parseProperties(properties: NSDictionary); cdecl;
    function photoForKey(key: NSString): FBSDKSharePhoto; cdecl;
    procedure removeObjectForKey(key: NSString); cdecl;
    procedure setArray(&array: NSArray; forKey: NSString); cdecl;
    procedure setNumber(number: NSNumber; forKey: NSString); cdecl;
    procedure setObject(&object: FBSDKShareOpenGraphObject;
      forKey: NSString); cdecl;
    procedure setPhoto(photo: FBSDKSharePhoto; forKey: NSString); cdecl;
    procedure setString(&string: NSString; forKey: NSString); cdecl;
    procedure setURL(URL: NSURL; forKey: NSString); cdecl;
    function stringForKey(key: NSString): NSString; cdecl;
    function URLForKey(key: NSString): NSURL; cdecl;
  end;

  // ===== Exported string consts =====

function FBSDKShareErrorDomain: NSString;


// ===== External functions =====

const
  //libFBSDKShareKit = 'FBSDKShareKit.a';
  libFBSDKShareKit = '/System/Library/Frameworks/FBSDKShareKit.framework/FBSDKShareKit';

function NSStringFromFBSDKAppGroupPrivacy(privacy: FBSDKAppGroupPrivacy) : Pointer { NSString }; cdecl;
  external libFBSDKShareKit name _PU + 'NSStringFromFBSDKAppGroupPrivacy';
function NSStringFromFBSDKLikeObjectType(objectType: FBSDKLikeObjectType) : Pointer { NSString }; cdecl;
  external libFBSDKShareKit name _PU + 'NSStringFromFBSDKLikeObjectType';
function NSStringFromFBSDKLikeControlAuxiliaryPosition(auxiliaryPosition : FBSDKLikeControlAuxiliaryPosition): Pointer { NSString }; cdecl;
  external libFBSDKShareKit name _PU + 'NSStringFromFBSDKLikeControlAuxiliaryPosition';
function NSStringFromFBSDKLikeControlHorizontalAlignment(horizontalAlignment : FBSDKLikeControlHorizontalAlignment): Pointer { NSString }; cdecl;
  external libFBSDKShareKit name _PU + 'NSStringFromFBSDKLikeControlHorizontalAlignment';
function NSStringFromFBSDKLikeControlStyle(style: FBSDKLikeControlStyle) : Pointer { NSString }; cdecl;
  external libFBSDKShareKit name _PU + 'NSStringFromFBSDKLikeControlStyle';
function NSStringFromFBSDKShareDialogMode(dialogMode: FBSDKShareDialogMode) : Pointer { NSString }; cdecl;
  external libFBSDKShareKit name _PU + 'NSStringFromFBSDKShareDialogMode';

//This function is never called (it does not even exist in the library), but it is here to trick Delphi to think that we use the
//static library and therefore link it into the binary.
//function FakeLoader: FBSDKShareDialog; cdecl; external libFBSDKShareKit name 'OBJC_CLASS_$_SomeClassName';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  FBSDKShareKitModule: THandle;

{$ENDIF IOS}

function FBSDKShareErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libFBSDKShareKit, 'FBSDKShareErrorDomain');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

FBSDKShareKitModule := dlopen(MarshaledAString(libFBSDKShareKit), RTLD_LAZY);

finalization

dlclose(FBSDKShareKitModule);
{$ENDIF IOS}

end.
