//
//  Message.h
//  LC_微刊
//
//  Created by Omaiga on 16/10/10.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject

@property (nonatomic, copy)NSString *title;

@property (nonatomic, strong)NSArray *images;

@property (nonatomic, strong)NSNumber *view_count;

@property (nonatomic, strong)NSNumber *comment_count;

@property (nonatomic, assign)NSInteger img_status;

@property (nonatomic, copy)NSString *url;

@property (nonatomic, copy)NSString *read_mode_url;

+ (Message *)messageDataWithMessageDic:(NSDictionary *)messageDic;

@end
