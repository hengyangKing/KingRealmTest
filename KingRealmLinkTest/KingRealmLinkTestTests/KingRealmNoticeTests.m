//
//  KingRealmNoticeTests.m
//  KingRealmLinkTest
//
//  Created by J on 2017/6/22.
//  Copyright © 2017年 J. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NoticeModel.h"

@interface KingRealmNoticeTests : XCTestCase
@property(nonatomic,strong)RLMNotificationToken *token;
@property(nonatomic,strong)RLMNotificationToken *token2;

@end

@implementation KingRealmNoticeTests

- (void)setUp {
    [super setUp];
    //对域监听
    RLMRealm *realm=[RLMRealm defaultRealm];
    self.token=[realm addNotificationBlock:^(RLMNotification  _Nonnull notification, RLMRealm * _Nonnull realm) {
//        接到通知的回调
        NSLog(@"realm==%@",realm);
    }];
    //对结果集合监听
    RLMResults *results=[NoticeModel allObjects];
    self.token2=[results addNotificationBlock:^(RLMResults * _Nullable results, RLMCollectionChange * _Nullable change, NSError * _Nullable error) {
        NSLog(@"change===%@",change.deletions);
    }];
    
    


}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [self.token stop];//停止监听通知
    [self.token2 stop];//停止监听通知

    [super tearDown];
}

- (void)testExample {
    
    NoticeModel *model=[[NoticeModel alloc]initWithValue:@{@"noticeName":@"foo2"}];
    RLMRealm *realm=[RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:model];
    }];
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
}



@end
