//
//  CloNetworkUtil.h
//  SideBarDemo
//
//  Created by 1026 on 13-5-30.
//  Copyright (c) 2013年 JianYe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

@interface CloNetworkUtil : NSObject

- (Reachability *)initReachability;
- (BOOL)getNetWorkStatus;
- (NSString *)getNetWorkType;

@end
