//
//  Util.h
//  ForgeModule
//
//  Created by Ross Tapson on 2015/04/03.
//  Copyright (c) 2015 Trigger Corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Util : NSObject
+ (void) setAllowsInlineMediaPlayback:(BOOL)allowsInlineMediaPlayback;
+ (void) setMediaPlaybackRequiresUserAction:(BOOL)mediaPlaybackRequiresUserAction;
+ (void) setCookieAcceptPolicy:(BOOL)acceptCookies;
@end
