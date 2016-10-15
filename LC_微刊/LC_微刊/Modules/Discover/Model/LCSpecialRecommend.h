//
//  LCSpecialRecommend.h
//  LC_微刊
//
//  Created by Omaiga on 16/9/30.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCSpecialRecommend : NSObject

@property (nonatomic, copy)NSString *name;

@property (nonatomic, copy)NSString *describe;

@property (nonatomic, assign)NSInteger article_count;

@property (nonatomic, assign)NSInteger subscribe_count;

@property (nonatomic, strong)NSDictionary *img_info;

@property (nonatomic, strong)NSNumber *id;


+ (LCSpecialRecommend *)specialWithSpecialDic:(NSDictionary *)specialDic;

@end
