//
//  VediosViewController.h
//  LessonVedio
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 ZSH. All rights reserved.
//

#import "BaseViewController.h"

@interface VediosViewController : BaseViewController
@property(nonatomic,strong)NSString *autID;
//判断是从dota主播界面进来 还是从
@property(nonatomic,assign)int sourcefrom;
@end
