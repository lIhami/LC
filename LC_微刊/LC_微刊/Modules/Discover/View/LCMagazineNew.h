//
//  LCMagazineNew.h
//  LC_微刊
//
//  Created by dllo on 16/9/26.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCMagazineNew : NSObject

@property (nonatomic, copy)NSString *magNewTitle;

@property (nonatomic, copy)NSString *magNewDesc;

@property (nonatomic, assign)NSInteger *magNewArticleCount;

@property (nonatomic, assign)NSInteger *magNewSubscribeCount;

+ (LCMagazineNew *)magazineWithMagazineDic:(NSDictionary *)magazineDic;

@end
