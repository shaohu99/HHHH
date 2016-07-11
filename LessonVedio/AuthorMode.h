//
//  AuthorMode.h
//  LessonVedio
//
//  Created by lanou3g on 16/7/7.
//  Copyright © 2016年 ZSH. All rights reserved.
//

#import "BaseModel.h"

@interface AuthorMode : BaseModel
@property(nonatomic,assign)BOOL watchable;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *youku_id;
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *detail;
@property(nonatomic,copy)NSString *authorID;
@property(nonatomic,copy)NSString *pop;
@property(nonatomic,copy)NSString *icon;





+(NSMutableArray *)parseAuthorsWithDic:(NSDictionary *)dic;
//@property(nonatomic,copy)NSString *
//"watchable":false,
//"name":"最近更新",
//"youku_id":"none",
//"url":"http://dotaly.com",
//"detail":"2016-07-07",
//"id":"all",
//"pop":-1,
//"icon":"http://api.
@end
