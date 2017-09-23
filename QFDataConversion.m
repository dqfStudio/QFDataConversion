//
//  QFDataConversion.m
//  TestProject
//
//  Created by dqf on 2017/9/23.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import "QFDataConversion.h"

@implementation NSDictionary (QFJson)
//将json字符串转化成字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)aString {
    return [self dictionaryWithJsonData:[aString dataUsingEncoding:NSUTF8StringEncoding]];
}
//将json data转化成字典
+ (NSDictionary *)dictionaryWithJsonData:(NSData *)data {
    return [NSJSONSerialization JSONObjectWithData:data
                                           options:NSJSONReadingMutableContainers
                                             error:nil];
}
@end

@implementation NSString (QFJson)
//将字典转化成字符串 如：rn=1&tt=3&rr=4
+ (NSString *)linkStringWithDictionary:(NSDictionary *)dict {
    NSMutableString *mutableString = [[NSMutableString alloc] init];
    for (NSString *key in dict.allKeys) {
        NSString *value = dict[key];
        [mutableString appendString:key];
        [mutableString appendString:@"="];
        [mutableString appendString:value];
        [mutableString appendString:@"&"];
    }
    return [mutableString substringToIndex:mutableString.length-1];;
}
//将字典转化成json字符串
+ (NSString *)jsonStringWithDictionary:(NSDictionary *)dict {
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}
//去掉json字符串中的空格和换行符
+ (NSString *)jsonStringWithDictionary2:(NSDictionary *)dict {
    NSString *jsonString = [NSString jsonStringWithDictionary:dict];
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@" " withString:@""];
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return [jsonString mutableCopy];
}
@end

@implementation NSData (QFJson)
//将字典转化成json data
+ (NSData *)jsonDataWithDictionary:(NSDictionary *)dict {
    return [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
}
@end
