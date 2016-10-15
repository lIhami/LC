//
//  LCAllMagazine.m
//  LC_微刊
//
//  Created by Omaiga on 16/9/30.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCAllMagazine.h"

@implementation LCAllMagazine

+ (LCAllMagazine *)allMagazineWithAllDic:(NSDictionary *)allDic {
    LCAllMagazine *allMag = [[LCAllMagazine alloc] init];
    [allMag setValuesForKeysWithDictionary:allDic];
    return allMag;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"description"]) {
        self.myDescription = value;
        return;
    }else {
        return;
    }
}


@end
