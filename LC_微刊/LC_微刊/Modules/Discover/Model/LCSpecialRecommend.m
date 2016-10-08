//
//  LCSpecialRecommend.m
//  LC_微刊
//
//  Created by Omaiga on 16/9/30.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCSpecialRecommend.h"

@implementation LCSpecialRecommend

+ (LCSpecialRecommend *)specialWithSpecialDic:(NSDictionary *)specialDic {
    
    LCSpecialRecommend *special = [[LCSpecialRecommend alloc] init];
    [special setValuesForKeysWithDictionary:specialDic];
    return special;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    
}

@end
