//
//  BTSettingCell.m
//  GDBWTA
//
//  Created by HJJ on 13-7-15.
//  Copyright (c) 2013年 Air. All rights reserved.
//

#import "BTSettingCell.h"

@implementation BTSettingCell
@synthesize titleLabel = _titleLabel,detailTextLabel = _detailLabel;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.titleLabel = [[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 150, 30)]autorelease];
        self.titleLabel.font = [UIFont fontWithName:@"Arial" size:18];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.titleLabel];
        
        self.DetailLabel = [[[UILabel alloc]initWithFrame:CGRectMake(240, 10, 50, 30)]autorelease];
        self.DetailLabel.font = [UIFont fontWithName:@"Arial" size:16];
        self.DetailLabel.textColor = [UIColor blackColor];
        self.DetailLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.DetailLabel];

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
