//
//  LCMagazineRecomment.m
//  LC_微刊
//
//  Created by Omaiga on 16/9/30.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCMagazineRecomment.h"

@implementation LCMagazineRecomment

+ (LCMagazineRecomment *)magazineRecWithMagazineRecDic:(NSDictionary *)magazineRecDic {
    LCMagazineRecomment *magazineRec = [[LCMagazineRecomment alloc] init];
    [magazineRec setValuesForKeysWithDictionary:magazineRecDic];
    return magazineRec;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    
}

@end
