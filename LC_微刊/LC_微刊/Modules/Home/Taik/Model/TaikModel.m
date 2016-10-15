//
//  TaikModel.m
//  LC_微刊
//
//  Created by dllo on 16/9/23.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "TaikModel.h"

@implementation TaikModel

+ (TaikModel *)taikDataWithTaikDic:(NSDictionary *)taikDic {
    TaikModel *taikData = [[TaikModel alloc] init];
    [taikData setValuesForKeysWithDictionary:taikDic];
    return taikData;
  
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (id)valueForUndefinedKey:(NSString *)key {
    return nil;
}


@end
