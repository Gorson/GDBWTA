//
//  BTSettingCell.h
//  GDBWTA
//
//  Created by HJJ on 13-7-15.
//  Copyright (c) 2013年 Air. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BTSettingCell : UITableViewCell
{
    UILabel *_titleLabel;
    UILabel *_DetailLabel;
}
@property(nonatomic,retain)UILabel *titleLabel;
@property(nonatomic,retain)UILabel *DetailLabel;

@end
