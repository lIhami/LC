//
//  LCBaseModel.h
//  LC_微刊
//
//  Created by dllo on 16/9/20.
//  Copyright © 2016年 dllo. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface LCBaseModel : NSObject

- (instancetype)initWithDic:(NSDictionary *)dic;

+ (instancetype)modelWithDic:(NSDictionary *)dic;

@end
NS_ASSUME_NONNULL_END
