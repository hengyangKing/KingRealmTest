//
//  Dog.m
//  KingRealmLinkTest
//
//  Created by J on 2017/6/22.
//  Copyright © 2017年 J. All rights reserved.
//

#import "Dog.h"

@implementation Dog

+(NSArray<NSString *> *)requiredProperties
{
    return @[@"name"];
}
// Specify default values for properties
//默认值
+ (NSDictionary *)defaultPropertyValues
{
    return @{@"age":@(1),
             @"male":@(YES)
             };
}

// Specify properties to ignore (Realm won't persist these)
//忽略存入属性
+ (NSArray *)ignoredProperties
{
    return @[@"type"];
}

@end
