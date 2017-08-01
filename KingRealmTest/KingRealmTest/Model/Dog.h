//
//  Dog.h
//  KingRealmTest
//
//  Created by J on 2017/6/22.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Realm/Realm.h>
@interface Dog : RLMObject

@property NSInteger age;
@property NSString *petName;
//反向关系依赖
//@property(readonly)RLMLinkingObjects *master;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<Dog *><Dog>
RLM_ARRAY_TYPE(Dog)
