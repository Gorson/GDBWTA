//
//  CloNetworkUtil.m
//  SideBarDemo
//
//  Created by 1026 on 13-5-30.
//  Copyright (c) 2013年 JianYe. All rights reserved.
//

#import "CloNetworkUtil.h"

@implementation CloNetworkUtil

//初始化reachability
- (Reachability *)initReachability
{
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    return reachability;
}

//判断网络是否可用
- (BOOL)getNetWorkStatus
{
    if ([[self initReachability] currentReachabilityStatus] == NotReachable)
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

/**
获取网络类型
return
*/
- (NSString *)getNetWorkType
{
    NSString *netWorkType;
    Reachability *reachability = [self initReachability];
    switch ([reachability currentReachabilityStatus])
    {
        case ReachableViaWiFi:   //Wifi网络
        netWorkType = @"wifi";
            NSLog(@"WorkType = %@",netWorkType);
        break;
        case ReachableViaWWAN:  //无线广域网
        netWorkType = @"wwan";
            NSLog(@"WorkType = %@",netWorkType);
        break;
        default: 
        netWorkType = @"no";
            NSLog(@"WorkType = %@",netWorkType);
        break; 
    } 
    return netWorkType; 
}

@end
