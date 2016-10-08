//
//  LCAllMagazine.h
//  LC_微刊
//
//  Created by Omaiga on 16/9/30.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCAllMagazine : NSObject

@property (nonatomic, copy)NSString *title;

@property (nonatomic, copy)NSString *myDescription;

@property (nonatomic, assign)NSInteger article_count;

@property (nonatomic, assign)NSInteger view_count;

@property (nonatomic, assign)NSInteger subscribe_count;

@property (nonatomic, strong)NSDictionary *img_info;

+ (LCAllMagazine *)allMagazineWithAllDic:(NSDictionary *)allDic;

@end
