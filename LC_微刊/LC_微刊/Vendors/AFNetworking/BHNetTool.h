//
//  BHNetTool.h
//  SummerQ
//
//  Created by apple on 16/7/13.
//  Copyright © 2016年 沐沐Seven. All rights reserved.
//

#import <Foundation/Foundation.h>

// 成功回调
typedef void (^successBlock) (id result);
// 失败回调
typedef void (^failureBlock) (NSError *error);

// 响应模式
typedef NS_ENUM(NSUInteger, BHResponseStyle) {
    BHJSON,
    BHDATA,
    BHXML,
};
// 请求风格
typedef NS_ENUM(NSUInteger, BHRequestStyle) {
    BHBodyString,
    BHBodyJSON,
};


@interface BHNetTool : NSObject

+(void)GET:(NSString *)url
      Body:(id)body
HeaderFile:(NSDictionary *)headers
  Response:(BHResponseStyle)responseStyle
   Success:(successBlock)success
   Failure:(failureBlock)failure;

+(void)POST:(NSString *)url
      Body:(id)body
  BodyStyle:(BHRequestStyle)bodyStyle
HeaderFile:(NSDictionary *)headers
  Response:(BHResponseStyle)responseStyle
   Success:(successBlock)success
   Failure:(failureBlock)failure;


@end
