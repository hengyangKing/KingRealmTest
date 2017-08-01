//
//  Student.h
//  KingRealmLinkTest
//
//  Created by J on 2017/6/22.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Realm/Realm.h>
#import "Pet.h"
@interface Student : RLMObject
@property()NSInteger num;
@property()NSString *name;
@property()Pet *pet;
@property(readonly)RLMLinkingObjects *teacher;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Student *><Student>
RLM_ARRAY_TYPE(Student)
