//
//  BTAppDelegate.h
//  GDBWTA
//
//  Created by Air on 13-7-15.
//  Copyright (c) 2013年 Air. All rights reserved.
//

#import <UIKit/UIKit.h>
#define theApp [BTAppDelegate sharedAppDelegate]    // 宏，单例对象

@class BTViewController;
@interface BTAppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) BTViewController *viewController;
+ (BTAppDelegate *)sharedAppDelegate;
@end
