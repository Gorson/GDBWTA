//
//  BTSettingViewController.h
//  GDBWTA
//
//  Created by HJJ on 13-7-15.
//  Copyright (c) 2013年 Air. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface BTSettingViewController : BTParentViewController
{
    UITableView *settingtableView;
    NSMutableArray *contentArray;
    AVAudioPlayer *player;
}
- (void)playmusic;
+ (BTSettingViewController *) sharedInstance;

@end
