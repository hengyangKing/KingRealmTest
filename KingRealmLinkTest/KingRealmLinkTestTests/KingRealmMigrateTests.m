//
//  KingRealmMigrateTests.m
//  KingRealmLinkTest
//
//  Created by J on 2017/6/23.
//  Copyright © 2017年 J. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Migrate.h"
#import "Realm.h"
@interface KingRealmMigrateTests : XCTestCase

@end

@implementation KingRealmMigrateTests

- (void)setUp {
    [super setUp];
    [self migrate];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
-(void)migrate
{
    //1.数据迁移
//    建议在didFinishLaunchingwithOptions:中配置
    RLMRealmConfiguration *config=[RLMRealmConfiguration defaultConfiguration];
    //设置新的构架版本，需高于之前设置构架版本 若未设置过则为0
    config.schemaVersion=2;
    //设置block 将会在打开低于上面设置的版本号的realm数据库到时候自动调用
    config.migrationBlock = ^(RLMMigration * _Nonnull migration, uint64_t oldSchemaVersion) {
        if (oldSchemaVersion<2) {
            NSLog(@"什么都不用做,realm会自动新增活删除，然后更新架构");
        }
//        2.（执行更名动作 way 1 if need）
//        [migration enumerateObjects:@"Migrate" block:^(RLMObject * _Nullable oldObject, RLMObject * _Nullable newObject) {
//            NSLog(@"newObj==%@",newObject);
//            NSLog(@"oldObj==%@",oldObject);
//            //删除旧字段 添加新字段的迁移
//            newObject[@"aa"]=[NSString stringWithFormat:@"i'm new obj aa -----%@",oldObject[@"a"]];
//        }];
        
//        （执行更名动作 way 2 if need）
        [migration renamePropertyForClass:@"Migrate" oldName:@"a" newName:@"aa"];
        
        
    };
    [RLMRealmConfiguration setDefaultConfiguration:config];
    
    [RLMRealm defaultRealm];
}


- (void)testExample {
    // This is an example of a functional test case.
    Migrate *migrate=[[Migrate alloc]initWithValue:@{@"a":@"我是数据c",@"b":@"我是新增数据"}];
    RLMRealm *realm=[RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:migrate];
    }];
}


@end
