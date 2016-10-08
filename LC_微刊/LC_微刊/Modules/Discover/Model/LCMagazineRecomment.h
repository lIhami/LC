//
//  LCMagazineRecomment.h
//  LC_微刊
//
//  Created by Omaiga on 16/9/30.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCMagazineRecomment : NSObject

@property (nonatomic, copy)NSString *title;

@property (nonatomic, assign)NSInteger article_count;

@property (nonatomic, assign)NSInteger subscribe_count;

@property (nonatomic, strong)NSDictionary *img_info;

@property (nonatomic, strong)NSDictionary *user;

+ (LCMagazineRecomment *)magazineRecWithMagazineRecDic:(NSDictionary *)magazineRecDic;


@end
