//
//  Dog.h
//  KingRealmLinkTest
//
//  Created by J on 2017/6/22.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Realm/Realm.h>

@interface Dog : RLMObject
@property()NSString *name;
@property()NSString *type;
@property()NSInteger age;
@property(getter=isMale)BOOL male;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<Dog *><Dog>
RLM_ARRAY_TYPE(Dog)
