//
//  LCMagazineNew.h
//  LC_微刊
//
//  Created by dllo on 16/9/26.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCMagazineNew : NSObject

@property (nonatomic, copy)NSString *title;

@property (nonatomic, copy)NSString *myDescription;

@property (nonatomic, assign)NSInteger article_count;

@property (nonatomic, assign)NSInteger subscribe_count;

@property (nonatomic, assign)NSInteger view_count;

@property (nonatomic, strong)NSDictionary *img_info;

@property (nonatomic, strong)NSNumber *id;

@property (nonatomic, strong)NSNumber *s_score;

@property (nonatomic, strong)NSDictionary *user;

+ (LCMagazineNew *)magazineWithMagazineDic:(NSDictionary *)magazineDic;

@end
