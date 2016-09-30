//
//  LCNewSpecial.m
//  LC_微刊
//
//  Created by Omaiga on 16/9/30.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCNewSpecial.h"

@implementation LCNewSpecial

+ (LCNewSpecial *)specialNewWithSpeNewDic:(NSDictionary *)speNewDic {
    LCNewSpecial *speNew = [[LCNewSpecial alloc] init];
    [speNew setValuesForKeysWithDictionary:speNewDic];
    return speNew;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    
}


@end
