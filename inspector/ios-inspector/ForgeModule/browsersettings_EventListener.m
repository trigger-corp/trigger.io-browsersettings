#import <AVFoundation/AVFoundation.h> 

#import "browsersettings_EventListener.h"

@implementation browsersettings_EventListener


+ (void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    if ([[[[[ForgeApp sharedApp] configForModule:@"browsersettings"] objectForKey:@"media_playback"] objectForKey:@"enable_html5_audio"] boolValue]) {
        NSError *error = nil;
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:&error];
        [[AVAudioSession sharedInstance] setActive:YES error:&error];
        [[AVAudioSession sharedInstance] setDelegate:application.delegate];
    }

    [Util setInlineVideo:[[[[[ForgeApp sharedApp] configForModule:@"browsersettings"] objectForKey:@"media_playback"] objectForKey:@"inline_video"] boolValue]];

    [Util setAutoplayVideo:[[[[[ForgeApp sharedApp] configForModule:@"browsersettings"] objectForKey:@"media_playback"] objectForKey:@"autoplay_video"] boolValue]];
    
    [Util setAcceptCookies:[[[[ForgeApp sharedApp] configForModule:@"browsersettings"]objectForKey:@"accept_cookies"] boolValue]];
}


@end
