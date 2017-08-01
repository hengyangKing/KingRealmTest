//
//  RealmLinkTests.m
//  KingRealmTest
//
//  Created by J on 2017/6/22.
//  Copyright © 2017年 J. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Teacher.h"
@interface RealmLinkTests : XCTestCase

@end

@implementation RealmLinkTests


- (void)testExample {

    Teacher *teacher=[[Teacher alloc]init];
    [teacher setName:@"teacher_1"];
    
    RLMRealm *realm=[RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:teacher];
    }];

}
@end
