#import "LaunchAtLoginPlugin.h"
#if __has_include(<launch_at_login/launch_at_login-Swift.h>)
#import <launch_at_login/launch_at_login-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "launch_at_login-Swift.h"
#endif

@implementation LaunchAtLoginPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLaunchAtLoginPlugin registerWithRegistrar:registrar];
}
@end
