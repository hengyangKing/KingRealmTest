//
//  Teacher.h
//  KingRealmLinkTest
//
//  Created by J on 2017/6/22.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Realm/Realm.h>
#import "Student.h"
#import "Pet.h"
@interface Teacher : RLMObject
@property()NSInteger Id;
@property()NSString *name;
@property()RLMArray<Student *><Student> *students;
@property()Pet *pet;




@end

// This protocol enables typed collections. i.e.:
// RLMArray<Teacher *><Teacher>
RLM_ARRAY_TYPE(Teacher)
