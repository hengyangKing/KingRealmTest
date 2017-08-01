//
//  可空属性&默认属性&忽略属性.m
//  KingRealmLinkTest
//
//  Created by J on 2017/6/22.
//  Copyright © 2017年 J. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Dog.h"
@interface KingRealmPropertyTestTests : XCTestCase

@end

@implementation KingRealmPropertyTestTests

-(void)testNil{
    //可空属性
    Dog *kaka=[Dog new];
    [kaka setName:@"kaka"];
    RLMRealm *realm=[RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:kaka];
    }];
    
}
- (void)testExample {
    // This is an example of a functional test case.
}
@end
