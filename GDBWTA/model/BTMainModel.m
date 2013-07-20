//
//  BTMainModel.m
//  GDBWTA
//
//  Created by 朱 欣 on 13-7-21.
//  Copyright (c) 2013年 Air. All rights reserved.
//

#import "BTMainModel.h"

@implementation BTMainModel
@synthesize imagePath;
@synthesize infomation;

- (id)init
{
    self = [super init];
    if (self)
    {
        self.imagePath = @"";
        self.infomation = @"";
    }
    return self;
}

- (void)dealloc
{
    self.imagePath = nil;
    self.infomation = nil;
    [super dealloc];
}
@end
