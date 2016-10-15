//
//  BHNetTool.m
//  SummerQ
//
//  Created by apple on 16/7/13.
//  Copyright © 2016年 沐沐Seven. All rights reserved.
//

#import "BHNetTool.h"
#import "AFNetworking.h"

@implementation BHNetTool

+(void)GET:(NSString *)url
      Body:(id)body
HeaderFile:(NSDictionary *)headers
  Response:(BHResponseStyle)responseStyle
   Success:(successBlock)success
   Failure:(failureBlock)failure
{
    
    // 1.设置网络管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 2.设置请求头
    if (headers) {
        
        for (NSString *key in headers.allKeys) {
            [manager.requestSerializer setValue:headers[key] forHTTPHeaderField:key];
        }
    }
    
    // 3.创建返回值类型
    switch (responseStyle) {
        case BHJSON:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        case BHXML:
            manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
        case BHDATA:
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        default:
            break;
    }
    
    // 4.设置响应数据类型
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript",@"image/jpeg", @"text/vnd.wap.wml", nil]];
    
    // 5.UTF8转码
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    // 6.使用AFN进行网络请求
    [manager GET:url parameters:body progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 请求成功
        if (responseObject) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 请求失败
        if (error) {
            failure(error);
        }
        
    }];

    
}


+(void)POST:(NSString *)url
       Body:(id)body
  BodyStyle:(BHRequestStyle)bodyStyle
 HeaderFile:(NSDictionary *)headers
   Response:(BHResponseStyle)responseStyle
    Success:(successBlock)success
    Failure:(failureBlock)failure
{
    
    // 1.设置网络管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 2.设置body 数据类型
    switch (bodyStyle) {
        case BHBodyJSON:
            manager.requestSerializer = [AFJSONRequestSerializer serializer];
            break;
        case BHBodyString:
            [manager.requestSerializer setQueryStringSerializationWithBlock:^NSString * _Nonnull(NSURLRequest * _Nonnull request, id  _Nonnull parameters, NSError * _Nullable * _Nullable error) {
                
                return parameters;
                
            }];
            break;
        default:
            break;
    }
    
    // 3.创建返回值类型
    switch (responseStyle) {
        case BHJSON:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        case BHXML:
            manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
        case BHDATA:
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        default:
            break;
    }
    
    // 4.设置响应数据类型
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript",@"image/jpeg", @"text/vnd.wap.wml", nil]];
    
    // 5.UTF8转码
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    // 6.使用AFN进行网络请求
    [manager POST:url parameters:body progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 请求成功
        if (responseObject) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 请求失败
        if (error) {
            failure(error);
        }
        
    }];
    
}


@end
