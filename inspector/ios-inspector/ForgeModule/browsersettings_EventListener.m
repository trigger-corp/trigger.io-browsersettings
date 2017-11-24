#import <AVFoundation/AVFoundation.h> 

#import "browsersettings_EventListener.h"

@implementation browsersettings_EventListener


+ (void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSDictionary *config = [[ForgeApp sharedApp] configForModule:@"browsersettings"];
    BOOL accept_cookies = [[config objectForKey:@"accept_cookies"] boolValue];
    [Util setCookieAcceptPolicy:accept_cookies];

    NSDictionary *config_media_playback = [config objectForKey:@"media_playback"];
    BOOL inline_video = [[config_media_playback objectForKey:@"inline_video"] boolValue];
    BOOL autoplay_video = [[config_media_playback objectForKey:@"autoplay_video"] boolValue];
    [Util setAllowsInlineMediaPlayback:inline_video];
    [Util setMediaPlaybackRequiresUserAction:!autoplay_video];

    BOOL enable_html5_audio = [[config_media_playback objectForKey:@"enable_html5_audio"] boolValue];
    BOOL respect_playing_audio = [[config_media_playback objectForKey:@"respect_playing_audio"] boolValue];
    if (enable_html5_audio) {
        NSError *error = nil;
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:&error];
        if (!respect_playing_audio) {
            [[AVAudioSession sharedInstance] setActive:YES error:&error];
        }
        [[AVAudioSession sharedInstance] setDelegate:application.delegate];
    }
}


@end
