//
//  HttpClient.h
//  EAKit
//
//  Created by Eiwodetianna on 16/9/20.
//  Copyright © 2016年 Eiwodetianna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpClient : NSObject

+ (NSURLSessionDataTask *)GET:(NSString *)urlString success:(void (^)(NSURLSessionDataTask *dataTask, id result))success failure:(void (^)(NSURLSessionDataTask *dataTask, NSError *error))failure;

+ (NSURLSessionDataTask *)POST:(NSString *)urlString HTTPBody:(NSString *)body success:(void (^)(NSURLSessionDataTask *dataTask, id result))success failure:(void (^)(NSURLSessionDataTask *dataTask, NSError *error))failure;


@end
