//
//  BTConstant.h
//
//  Created by Gorson on 11/15/11.
//  Copyright (c) 2011 Wistronits. All rights reserved.
//

#define debug         1    // 是否输出服务器返回的信息
#define BKColor       [UIColor colorWithRed:62.0f / 255.0f green:58.0f / 255.0f blue:57.0f / 255.0f alpha:1.0f]    // 字体颜色
#define REDColor       [UIColor colorWithRed:231.0f / 255.0f green:51.0f / 255.0f blue:110.0f / 255.0f alpha:1.0f]    // 红色颜色
#define SeparateColor [UIColor colorWithPatternImage:[UIImage imageNamed:@"separateline.png"]]    // 分隔线颜色
#define SetApp PZAppDelegate *app = (PZAppDelegate *)[[UIApplication sharedApplication] delegate];

//判断设备是否IPHONE5
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

//动态获取设备高度
#define IPHONE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define IPHONE_WIDTH [UIScreen mainScreen].bounds.size.width

//设置颜色
#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//设置颜色与透明度
#define HEXCOLORAL(rgbValue, al) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:al]]

//DEBUG 打印
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

#ifndef SAFE_RELEASE
#define SAFE_RELEASE(x) { if (x) [x release]; x = nil; }
#endif