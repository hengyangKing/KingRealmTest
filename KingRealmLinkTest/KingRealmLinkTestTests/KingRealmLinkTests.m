//
//  KingRealmLinkTestTests.m
//  KingRealmLinkTestTests
//
//  Created by J on 2017/6/22.
//  Copyright © 2017年 J. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Realm.h"
#import "Teacher.h"
@interface KingRealmLinkTestTests : XCTestCase

@end

@implementation KingRealmLinkTestTests



//一对一 一对多 反向
- (void)testExample {
    Teacher *teacher=[Teacher new];
    [teacher setId:1];
    [teacher setName:@"刘文福"];
    Pet *dog=[Pet new];
    [dog setName:[NSString stringWithFormat:@"%@_dog",teacher.name]];
    [dog setAge:3];
    [teacher setPet:dog];
    
    for (NSInteger i=1; i<=10; i++) {
        Student *stu=[[Student alloc]init];
        [stu setName:[NSString stringWithFormat:@"%@_stu_%@",teacher.name,@(i)]];
        [stu setNum:i];
        [teacher.students addObject:stu];
        
        Pet *dog=[Pet new];
        [dog setName:[NSString stringWithFormat:@"%@_dog",stu.name]];
        [dog setAge:3];
        [stu setPet:dog];
    }
    
    RLMRealm *realm=[RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addOrUpdateObject:teacher];
    }];
}
-(void)testWhere
{
    RLMRealm *realm=[RLMRealm defaultRealm];
    RLMResults *results= [Teacher objectsInRealm:realm where:@"Id=1"];
    NSLog(@"%@",results);
    if (results.count&&[results.firstObject isKindOfClass:[Teacher class]]) {
        Teacher *teacher=results.firstObject;
        NSLog(@"teacher is %@",teacher);
        NSLog(@"master is %@",teacher.pet.master);
        NSLog(@"student teacher is %@",teacher.students.firstObject.teacher);
    }
    
}





@end
