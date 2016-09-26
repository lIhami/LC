//
//  HttpClient.m
//  EAKit
//
//  Created by Eiwodetianna on 16/9/20.
//  Copyright © 2016年 Eiwodetianna. All rights reserved.
//

#import "HttpClient.h"

@interface HttpClient ()

@property (nonatomic, retain)id result;

@end

@implementation HttpClient

+ (NSURLSessionDataTask *)GET:(NSString *)urlString success:(void (^)(NSURLSessionDataTask *dataTask, id result))success failure:(void (^)(NSURLSessionDataTask *dataTask, NSError *error))failur {
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
   
    NSDate *datenow =[NSDate date];//现在时间
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:datenow];
    NSDate *localeDate = [datenow  dateByAddingTimeInterval: interval];
    NSString *timeStamp = [NSString stringWithFormat:@"%ld", (long)[localeDate timeIntervalSince1970]];
    
    
    NSString *userStr = @"uuid=0869CBB6-D82C-4B7F-BDF9-AF62C4F95FAB&version=19&screenwidth=375.000000&screenheight=667.000000&time=timeStamp&api_version=v2.0.0&lat=38.882700&lng=121.539460&os_version=9.3.2&network=1&os_type=2&carrier=46007";
    
    NSLog( @"%@", timeStamp);
    NSDictionary *headerDic = @{@"Host":@"v20.tp.wkread.com",
                                @"Cookie": @"PHPSESSID=tesjd4lu5fqn4lo6usga9d7ic2",
                                @"Connection": @"keep-alive",
                                @" X-Device-Info": userStr,
                                @"User-Agent": @"vKan/1.9.5 (iPhone; iOS 10.0.1; Scale/2.00)",
                                @"Accept-Language": @"zh-Hans-CN;q=1, en-CN;q=0.9, ja-JP;q=0.8",
                                @"Token": @"H1CCMBBL8781ZPJY",
                                @"Accept-Encoding": @"gzip, deflate"};
    [request setValuesForKeysWithDictionary:headerDic];
    
    
    
    __block NSURLSessionDataTask *dataTask = nil;
    dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!error) {
                id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                success(dataTask, result);
            } else {
                failur(dataTask, error);
            }
        });
    }];
    [dataTask resume];
    
    return dataTask;
}


+ (NSURLSessionDataTask *)POST:(NSString *)urlString HTTPBody:(NSString *)body success:(void (^)(NSURLSessionDataTask *dataTask, id result))success failure:(void (^)(NSURLSessionDataTask *dataTask, NSError *error))failure {
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPBody = [body dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSession *session = [NSURLSession sharedSession];
    request.HTTPMethod = @"POST";
    
    __block NSURLSessionDataTask *dataTask = nil;
    dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!error) {
                id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                success(dataTask, result);
            } else {
                failure(dataTask, error);
            }
        });
    }];
    [dataTask resume];
    
    return dataTask;
}


@end
