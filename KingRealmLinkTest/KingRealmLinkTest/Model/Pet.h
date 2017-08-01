//
//  Pet.h
//  KingRealmLinkTest
//
//  Created by J on 2017/6/22.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Realm/Realm.h>

@interface Pet : RLMObject
@property()NSString *name;
@property()NSInteger age;
@property(readonly)RLMLinkingObjects *master;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<Pet *><Pet>
RLM_ARRAY_TYPE(Pet)
