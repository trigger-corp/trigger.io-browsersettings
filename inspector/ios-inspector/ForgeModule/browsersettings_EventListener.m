#import "browsersettings_EventListener.h"

@implementation browsersettings_EventListener


+ (void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
      
    NSString* inlineVideo = [[[[ForgeApp sharedApp] configForModule:@"browsersettings"]
                              objectForKey:@"media_playback"]
                             objectForKey:@"inline_video"];
    [Util setInlineVideo:[inlineVideo boolValue]];
    
    NSString* autoplayVideo = [[[[ForgeApp sharedApp] configForModule:@"browsersettings"]
                                objectForKey:@"media_playback"]
                               objectForKey:@"autoplay_video"];
    [Util setAutoplayVideo:[autoplayVideo boolValue]];
    
    NSString* acceptCookies = [[[ForgeApp sharedApp] configForModule:@"browsersettings"]objectForKey:@"accept_cookies"];
    [Util setAcceptCookies:[acceptCookies boolValue]];
}



@end
