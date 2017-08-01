//
//  ReamlSupportTypeTests.m
//  KingRealmTest
//
//  Created by J on 2017/6/22.
//  Copyright © 2017年 J. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Stu.h"
#import "Person.h"
@interface ReamlSupportTypeTests : XCTestCase

@end

@implementation ReamlSupportTypeTests

//支持的数据类型
//BOOL bool int  NSInteger long long long float double NSString NSData NSDate NSNumber

//不支持
//NSDictionary NSArray
- (void)testsaveImage {
    
    NSData *photoData=[NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"640" ofType:@"jpg"]];
    Stu *stu=[[Stu alloc]init];
    [stu setName:@"三狗"];
    [stu setNum:2];
    [stu setPhotoData:photoData];
    RLMRealm *realm=[RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:stu];
    }];
}
-(void)testSaveArray
{
    
    
    Person *person=[[Person alloc]init];
    person.name=@"foo_1";
    person.age=18;
    for (NSInteger i=1; i<=10; i++) {
        Stu *stu=[[Stu alloc]init];
        [stu setName:[NSString stringWithFormat:@"stu_%@",@(i)]];
        [stu setNum:i];
        NSData *photoData=[NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"640" ofType:@"jpg"]];
        [stu setPhotoData:photoData];
        [person.stus addObject:stu];
    }
    RLMRealm *realm=[RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:person];
    }];
}








@end
