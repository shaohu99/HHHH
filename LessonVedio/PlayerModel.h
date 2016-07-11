//
//  PlayerModel.h
//  LessonVedio
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 ZSH. All rights reserved.
//

#import "BaseModel.h"

@interface PlayerModel : BaseModel
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *message;
@property(nonatomic,copy)NSString *code;

@end
