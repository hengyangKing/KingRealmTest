//
//  Pet.m
//  KingRealmLinkTest
//
//  Created by J on 2017/6/22.
//  Copyright © 2017年 J. All rights reserved.
//

#import "Pet.h"

@implementation Pet
+(NSDictionary<NSString *,RLMPropertyDescriptor *> *)linkingObjectsProperties
{
    //    需描述反向关联关系
    //    Person 需关联到Dog中master
    return @{
             @"master":[RLMPropertyDescriptor descriptorWithClass:NSClassFromString(@"Teacher") propertyName:@"pet"],
             @"master":[RLMPropertyDescriptor descriptorWithClass:NSClassFromString(@"Student") propertyName:@"pet"]

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
