//
//  LCNewSpecial.h
//  LC_微刊
//
//  Created by Omaiga on 16/9/30.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCNewSpecial : NSObject

@property (nonatomic, copy)NSString *name;

@property (nonatomic, strong)NSNumber *article_count;

@property (nonatomic, strong)NSNumber *subscribe_count;

@property (nonatomic, strong)NSDictionary *img_info;

+ (LCNewSpecial *)specialNewWithSpeNewDic:(NSDictionary *)speNewDic;

@end
