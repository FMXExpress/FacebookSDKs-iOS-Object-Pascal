{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework FacebookSDKStrings
//

unit iOSapi.FacebookSDKStrings;

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
  iOSapi.Foundation;

// ===== External functions =====

const
  libFacebookSDKStrings =
    '/System/Library/Frameworks/FacebookSDKStrings.framework/FacebookSDKStrings';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  FacebookSDKStringsModule: THandle;

{$ENDIF IOS}
{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

FacebookSDKStringsModule := dlopen(MarshaledAString(libFacebookSDKStrings),
  RTLD_LAZY);

finalization

dlclose(FacebookSDKStringsModule);
{$ENDIF IOS}

end.
