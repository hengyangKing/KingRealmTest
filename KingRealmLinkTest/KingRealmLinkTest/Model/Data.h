//
//  Data.h
//  KingRealmLinkTest
//
//  Created by J on 2017/6/23.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Realm/Realm.h>

@interface Data : RLMObject
@property()NSString *data;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<Data *><Data>
RLM_ARRAY_TYPE(Data)
