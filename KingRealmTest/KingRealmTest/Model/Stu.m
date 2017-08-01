//
//  Stu.m
//  KingRealmTest
//
//  Created by J on 2017/6/22.
//  Copyright © 2017年 J. All rights reserved.
//

#import "Stu.h"

@implementation Stu
-(UIImage *)photo
{
    return [UIImage imageWithData:self.photoData];
}


+(NSString *)primaryKey
{
    return @"num";
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
