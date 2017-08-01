//
//  NoticeModel.h
//  KingRealmLinkTest
//
//  Created by J on 2017/6/22.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Realm/Realm.h>

@interface NoticeModel : RLMObject
@property()NSString *noticeName;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<NoticeModel *><NoticeModel>
RLM_ARRAY_TYPE(NoticeModel)
