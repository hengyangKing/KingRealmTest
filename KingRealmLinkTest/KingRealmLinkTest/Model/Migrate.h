//
//  Migrate.h
//  KingRealmLinkTest
//
//  Created by J on 2017/6/23.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Realm/Realm.h>

@interface Migrate : RLMObject
//@property()NSString *a;
@property()NSString *b;
@property()NSString *aa;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<Migrate *><Migrate>
RLM_ARRAY_TYPE(Migrate)
