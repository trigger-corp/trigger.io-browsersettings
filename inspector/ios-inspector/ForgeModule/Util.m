//
//  Util.m
//  ForgeModule
//
//  Created by Ross Tapson on 2015/04/03.
//  Copyright (c) 2015 Trigger Corp. All rights reserved.
//

#import "Util.h"
#import <WebKit/WebKit.h>

@implementation Util

+ (void) setInlineVideo:(BOOL)inlineVideo {
    if (NSClassFromString(@"WKWebView") && [[ForgeApp sharedApp] useWKWebView]) {        
        // TODO handle iOS 8
        [ForgeLog w:@"forge won't support WKWebView until various issues are addressed."];
    } else {
        UIWebView *webView = (UIWebView*)[[ForgeApp sharedApp] webView];
        webView.allowsInlineMediaPlayback = inlineVideo;
    }

    return;
}

+ (void) setAutoplayVideo:(BOOL)autoplayVideo {
    if (NSClassFromString(@"WKWebView") && [[ForgeApp sharedApp] useWKWebView]) {        
        // TODO handle iOS 8
        [ForgeLog w:@"forge won't support WKWebView until various issues are addressed."];
    } else {
        UIWebView *webView = (UIWebView*)[[ForgeApp sharedApp] webView];
        webView.mediaPlaybackRequiresUserAction = !autoplayVideo;
    }
    return;
}

+ (void) setAcceptCookies:(BOOL)acceptCookies {
    if (acceptCookies) {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyAlways];
    }
    else {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyNever];
    }
}

@end
