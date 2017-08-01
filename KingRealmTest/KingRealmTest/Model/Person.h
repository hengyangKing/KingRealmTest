//
//  Person.h
//  KingRealmTest
//
//  Created by J on 2017/6/21.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Realm/Realm.h>
#import "Stu.h"
#import "Dog.h"
@interface Person : RLMObject
//官方建议 不需要策略
@property NSString *name;
@property NSInteger age;
@property NSInteger num;
//Realm框架支持存储的数组类 内部存储的对象必须继承自RLMObject
@property RLMArray<Stu *><Stu>*stus;
@property Dog *dog;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Person *><Person>
RLM_ARRAY_TYPE(Person)
