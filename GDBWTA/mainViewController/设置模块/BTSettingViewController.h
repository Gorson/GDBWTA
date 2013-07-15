//
//  BTSettingViewController.h
//  GDBWTA
//
//  Created by HJJ on 13-7-15.
//  Copyright (c) 2013年 Air. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BTSettingViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *settingtableView;
    NSMutableArray *contentArray;
}

@end
