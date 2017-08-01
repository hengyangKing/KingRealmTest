//
//  Student.m
//  KingRealmLinkTest
//
//  Created by J on 2017/6/22.
//  Copyright © 2017年 J. All rights reserved.
//

#import "Student.h"

@implementation Student
+(NSString *)primaryKey
{
    return @"num";
}
//    需描述反向关联关系

+(NSDictionary<NSString *,RLMPropertyDescriptor *> *)linkingObjectsProperties
{
    return @{
             @"teacher":[RLMPropertyDescriptor descriptorWithClass:NSClassFromString(@"Teacher") propertyName:@"students"]
             };
}


// Specify default values for properties

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

@end
