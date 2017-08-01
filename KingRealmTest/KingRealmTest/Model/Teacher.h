//
//  Teacher.h
//  KingRealmTest
//
//  Created by J on 2017/6/22.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Realm/Realm.h>
#import "Stu.h"
#import "Dog.h"
@interface Teacher : RLMObject
//官方建议 不需要策略
@property NSString *name;
//Realm框架支持存储的数组类 内部存储的对象必须继承自RLMObject
//@property RLMArray<Stu *><Stu>*stus;
@property Dog *pet;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Teacher *><Teacher>
RLM_ARRAY_TYPE(Teacher)
