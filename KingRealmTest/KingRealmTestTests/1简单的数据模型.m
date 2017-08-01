//
//  1简单的数据模型.m
//  KingRealmTest
//
//  Created by J on 2017/6/21.
//  Copyright © 2017年 J. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Person.h"
#import <Realm/Realm.h>

@interface ModelOperation : XCTestCase

@end

@implementation ModelOperation

- (void)testSaveModelExample {

    Person *person=[[Person alloc]initWithValue:@{@"name":@"二狗",@"age":@(18)}];
    RLMRealm *realm=[RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:person];
    }];
}

-(void)testSaveModelExample1 {

    RLMRealm *realm=[RLMRealm defaultRealm];
    Person *person=[[Person alloc]initWithValue:@{@"name":@"三狗",@"age":@(18)}];
    [realm beginWriteTransaction];
    [realm addObject:person];
    [realm commitWriteTransaction];
}
-(void)testSaveModelExample2 {
    
    RLMRealm *realm=[RLMRealm defaultRealm];
    
    [realm transactionWithBlock:^{
        [Person createInRealm:realm withValue:@{@"name":@"四狗",@"age":@(18)}];
    }];
}

-(void)testUpdateModelExample
{
    Person *person=[[Person alloc]initWithValue:@{@"name":@"二狗",@"age":@(18)}];
    RLMRealm *realm=[RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:person];
    }];
    [realm transactionWithBlock:^{
        person.name=@"八狗";
    }];

    
}
-(void)testUpdateModelExample1
{
    RLMResults *results=[Person objectsWhere:@"name='八狗'"];
    RLMRealm *realm=[RLMRealm defaultRealm];

    for (NSInteger i=0; i<results.count; i++) {
        Person *p=[results objectAtIndex:i];
        [realm transactionWithBlock:^{
            p.name=[NSString stringWithFormat:@"八狗--%ld",(long)i];
        }];
    }
}
-(void)testUpdateModelExample2
{
//    依赖主键进行更新 改变或者新增主键需要进行数据迁移
    RLMRealm *realm=[RLMRealm defaultRealm];
    
    [realm transactionWithBlock:^{
        [Person createOrUpdateInRealm:realm withValue:@{@"name":@"二狗",@"age":@(19)}];
    }];
    
}

-(void)testDeleteModelExample
{
    //    依赖主键进行更新 改变或者新增主键需要进行数据迁移
//    RLMResults *results=[Person objectsWhere:@"name='八狗'"];

    RLMRealm *realm=[RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm deleteObjects:[Person objectsWhere:@"name='二狗'"]];
    }];
    
}
-(void)testDeleteModelExample2
{
    //根据主键删除
    RLMRealm *realm=[RLMRealm defaultRealm];
    
    Person *person=[Person objectInRealm:realm forPrimaryKey:@"primaryKey=foo"];
    [realm deleteObject:person];
}

-(void)testQuery
{
    //查询 所有的查询包括查询和属性访问在realm中都是延时加载的，只有当属性被用到时才加载，即为懒加载
//    查询结果并不是数据的copy，而是数据的映射 修改查询结果写在事务中，会直接修改表中的数据
    RLMResults *results=[Person allObjects];
    NSLog(@"%@",results);
    Person *person=[[Person alloc]initWithValue:@{@"name":@"冬瓜",@"age":@(5)}];
    RLMRealm *realm=[RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:person];
    }];
    NSLog(@"%@",results);
    
    //    一旦索引执行之后 RLMResults 随时会保持更新
}
-(void)testQueryAndSorted
{
    RLMResults *results=[Person allObjects];
    NSLog(@"%@",results);
    RLMResults *sorted=[results sortedResultsUsingKeyPath:@"age" ascending:YES];
    NSLog(@"%@",sorted);
    
}




@end
