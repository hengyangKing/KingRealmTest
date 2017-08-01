//
//  KingRealmUserTests.m
//  KingRealmLinkTest
//
//  Created by J on 2017/6/23.
//  Copyright © 2017年 J. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Realm.h"
#import "Data.h"
@interface KingRealmUserTests : XCTestCase

@end

@implementation KingRealmUserTests

- (void)testExample {
    [self setDefaultRealmForAccountId:1];
    RLMRealm *realm=[RLMRealm defaultRealm];
    Data *data=[Data new];
    [realm transactionWithBlock:^{
        [realm addObject:data];
    }];
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}
//更改存储路径
-(void)setDefaultRealmForAccountId:(NSInteger)accountId
{
    RLMRealmConfiguration *config=[RLMRealmConfiguration defaultConfiguration];
    [config setFileURL:[[[config.fileURL URLByDeletingLastPathComponent]URLByAppendingPathComponent:[NSString stringWithFormat:@"%@",@(accountId)]]URLByAppendingPathExtension:@"realm"]];
    [RLMRealmConfiguration setDefaultConfiguration:config];
}


-(void)readOnly
{
    RLMRealmConfiguration *config=[RLMRealmConfiguration defaultConfiguration];
    config.readOnly=YES;
    [RLMRealmConfiguration setDefaultConfiguration:config];
//    通过config开启 数据库
    RLMRealm *realm=[RLMRealm realmWithConfiguration:config error:nil];
    
}
-(void)deleteAccountId:(NSInteger)accountId
{
    [self setDefaultRealmForAccountId:accountId];
    NSFileManager *manager=[NSFileManager defaultManager];
    RLMRealmConfiguration *config=[RLMRealmConfiguration defaultConfiguration];
    NSArray<NSURL *>*realmFileURLs=@[config.fileURL,
                                     [config.fileURL URLByAppendingPathExtension:@"lock"],
                                     [config.fileURL URLByAppendingPathExtension:@"log_a"],
                                     [config.fileURL URLByAppendingPathExtension:@"log_b"],
                                     [config.fileURL URLByAppendingPathExtension:@"note"]];
    
    
    for (NSURL *url in realmFileURLs ) {
        NSError *error=nil;
        [manager removeItemAtURL:url error:&error];
        if (error) {
            NSLog(@"error");
        }
    }
}



@end
