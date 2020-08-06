#import <AVFoundation/AVFoundation.h>
#import <WebKit/WebKit.h>

#import "browsersettings_EventListener.h"

@implementation browsersettings_EventListener


+ (void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSDictionary *config = [[ForgeApp sharedApp] configForModule:@"browsersettings"];
    NSDictionary *config_media_playback = [config objectForKey:@"media_playback"];

    // configure cookie accept policy
    BOOL accept_cookies = [[config objectForKey:@"accept_cookies"] boolValue];
    if (accept_cookies) {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyAlways];
    } else {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyNever];
    }

    // configure audio
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


+ (void)applicationWillConfigureWebView:(WKWebViewConfiguration*)configuration {
    NSDictionary *config_media_playback = [[[ForgeApp sharedApp] configForModule:@"browsersettings"] objectForKey:@"media_playback"];

    configuration.allowsInlineMediaPlayback = [[config_media_playback objectForKey:@"inline_video"] boolValue];
    Boolean autoplay_video = [[config_media_playback objectForKey:@"autoplay_video"] boolValue];
    if (autoplay_video == NO) {
        configuration.mediaTypesRequiringUserActionForPlayback = WKAudiovisualMediaTypeNone;
    } else {
        configuration.mediaTypesRequiringUserActionForPlayback = WKAudiovisualMediaTypeAll;
    }
}


@end
