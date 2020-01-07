#import "FlashyTabBarPlugin.h"
#import <flashy_tab_bar/flashy_tab_bar-Swift.h>

@implementation FlashyTabBarPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlashyTabBarPlugin registerWithRegistrar:registrar];
}
@end
