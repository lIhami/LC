//
//  TaikModel.h
//  LC_微刊
//
//  Created by dllo on 16/9/23.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaikModel : NSObject

@property (nonatomic, retain)NSString *name;

@property (nonatomic, assign)NSInteger article_count;

@property (nonatomic, assign)NSInteger subscribe_count;

@property (nonatomic,strong)NSArray *img_info;

+ (TaikModel *)taikDataWithTaikDic:(NSDictionary *)taikDic;

@end
