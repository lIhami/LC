//
//  LCMacro.h
//  LC_微刊
//
//  Created by dllo on 16/9/20.
//  Copyright © 2016年 dllo. All rights reserved.
//

#ifndef LCMacro_h
#define LCMacro_h

/**
 *  DDLog参数
 */
//#ifdef DEBUG
//static const int ddLogLevel = DDLogLevelVerbose;
//#else
//static const int ddLogLevel = DDLogLevelWarning;
//#endif

/**
 *  AppStore
 */
#define APP_STORE_URL_7_UNDER @""

#define APP_STORE_URL_7_SUPPER @""

#define SCREEN_RECT         [UIScreen mainScreen].bounds
#define SCREEN_SIZE         [UIScreen mainScreen].bounds.size
#define SCREEN_WIDTH        SCREEN_SIZE.width
#define SCREEN_HEIGHT       SCREEN_SIZE.height

#import "BHNetTool.h"


/**
 *  UMeng参数
 */
// appkey:控制台应用app key
static NSString *const kUMengAppKey = @"57df91dfe0f55ac0a6001507";
// channelID:渠道
static NSString *const kUMengChannelId = @"App Store";


#endif /* LCMacro_h */
