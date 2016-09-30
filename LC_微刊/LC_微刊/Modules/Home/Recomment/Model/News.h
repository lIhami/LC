//
//  News.h
//  LC_微刊
//
//  Created by dllo on 16/9/24.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject

@property (nonatomic, copy)NSString *title;

@property (nonatomic, copy)NSString *imgsrc;

@property (nonatomic, copy)NSString *source;

+ (News *)newsWithTitleDic:(NSDictionary *)titleDic;

@end
