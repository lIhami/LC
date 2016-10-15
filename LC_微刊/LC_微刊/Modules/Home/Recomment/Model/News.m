//
//  News.m
//  LC_微刊
//
//  Created by dllo on 16/9/24.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "News.h"

@implementation News

+ (News *)newsWithTitleDic:(NSDictionary *)titleDic {
    News *title = [[News alloc] init];
    [title setValuesForKeysWithDictionary:titleDic];
    return title;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}


@end
