//
//  RealmConnectionTests.m
//  KingRealmTest
//
//  Created by J on 2017/6/22.
//  Copyright © 2017年 J. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Teacher.h"

@interface RealmConnectionTests : XCTestCase

@end

@implementation RealmConnectionTests

//realm 的关系维护
//一对一关系
//正向关系
//反向关系
-(void)testConnectio
{
    Teacher *teacher=[[Teacher alloc]init];
    teacher.name=@"teacher_1";
    Dog *dog=[[Dog alloc]init];
    dog.petName=@"kaka";
    dog.age=6;
    teacher.pet=dog;
    
//    for (NSInteger i=1; i<=10; i++) {
//        Stu *stu=[[Stu alloc]init];
//        [stu setName:[NSString stringWithFormat:@"stu_%@",@(i)]];
//        [stu setNum:i];
//        NSData *photoData=[NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"640" ofType:@"jpg"]];
//        [stu setPhotoData:photoData];
//        [teacher.stus addObject:stu];
//    }

    
    RLMRealm *realm=[RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:teacher];
    }];
}



@end
