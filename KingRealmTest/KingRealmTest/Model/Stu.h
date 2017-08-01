//
//  Stu.h
//  KingRealmTest
//
//  Created by J on 2017/6/22.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Realm/Realm.h>
#import <UIKit/UIKit.h>
@interface Stu : RLMObject
@property()NSString *name;
@property()NSData *photoData;
//readonly 时，自动忽略字段
@property(readonly)UIImage *photo;
@property()NSInteger num;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<Stu *><Stu>
RLM_ARRAY_TYPE(Stu)
