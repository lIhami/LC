//
//  Message.m
//  LC_微刊
//
//  Created by Omaiga on 16/10/10.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "Message.h"

@implementation Message

+ (Message *)messageDataWithMessageDic:(NSDictionary *)messageDic {
    Message *messageData = [[Message alloc] init];
    [messageData setValuesForKeysWithDictionary:messageDic];
    return messageData;
    
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}


@end
