//
//  LCMagazineNew.m
//  LC_微刊
//
//  Created by dllo on 16/9/26.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCMagazineNew.h"

@implementation LCMagazineNew

+ (LCMagazineNew *)magazineWithMagazineDic:(NSDictionary *)magazineDic {

    LCMagazineNew *magazine = [[LCMagazineNew alloc] init];
    [magazine setValuesForKeysWithDictionary:magazineDic];
    return magazine;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"description"]) {
        self.myDescription = value;
        return;
    }else {
        return;
    }
//        [super setValue:value forUndefinedKey:key];
}



@end
