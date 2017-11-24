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

+ (void) setAllowsInlineMediaPlayback:(BOOL)allowsInlineMediaPlayback {
    if (NSClassFromString(@"WKWebView") && [[ForgeApp sharedApp] useWKWebView]) {        
        WKWebView *webView = (WKWebView*)[[ForgeApp sharedApp] webView];
        webView.configuration.allowsInlineMediaPlayback = allowsInlineMediaPlayback;
    } else {
        UIWebView *webView = (UIWebView*)[[ForgeApp sharedApp] webView];
        webView.allowsInlineMediaPlayback = allowsInlineMediaPlayback;
    }
}


+ (void) setMediaPlaybackRequiresUserAction:(BOOL)mediaPlaybackRequiresUserAction {
    if (NSClassFromString(@"WKWebView") && [[ForgeApp sharedApp] useWKWebView]) {        
        WKWebView *webView = (WKWebView*)[[ForgeApp sharedApp] webView];
        webView.configuration.mediaPlaybackRequiresUserAction = mediaPlaybackRequiresUserAction;
    } else {
        UIWebView *webView = (UIWebView*)[[ForgeApp sharedApp] webView];
        webView.mediaPlaybackRequiresUserAction = mediaPlaybackRequiresUserAction;
    }
}


+ (void) setCookieAcceptPolicy:(BOOL)acceptCookies {
    if (acceptCookies) {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyAlways];
    } else {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyNever];
    }
}

@end
