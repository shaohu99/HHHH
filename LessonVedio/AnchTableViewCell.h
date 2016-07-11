//
//  AnchTableViewCell.h
//  LessonVedio
//
//  Created by lanou3g on 16/7/7.
//  Copyright © 2016年 ZSH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthorMode.h"

#define AnchTableViewCell_ID @"AnchTableViewCell_ID"
@interface AnchTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *myimage;
@property (weak, nonatomic) IBOutlet UILabel *namelabel;//名字
@property (weak, nonatomic) IBOutlet UILabel *datelabel;//日期
@property (weak, nonatomic) IBOutlet UILabel *rangelabel;//排名
@property (strong ,nonatomic) AuthorMode *mode;

@end
