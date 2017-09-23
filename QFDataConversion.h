//
//  QFDataConversion.h
//  TestProject
//
//  Created by dqf on 2017/9/23.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (QFJson)
//将json字符串转化成字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)aString;
//将json data转化成字典
+ (NSDictionary *)dictionaryWithJsonData:(NSData *)data;
@end

@interface NSString (QFJson)
//将字典转化成字符串 如：rn=1&tt=3&rr=4
+ (NSString *)linkStringWithDictionary:(NSDictionary *)dict;
//将字典转化成json字符串
+ (NSString *)jsonStringWithDictionary:(NSDictionary *)dict;
//去掉json字符串中的空格和换行符
+ (NSString *)jsonStringWithDictionary2:(NSDictionary *)dict;
@end

@interface NSData (QFJson)
//将字典转化成json data
+ (NSData *)jsonDataWithDictionary:(NSDictionary *)dict;
@end
