//
//  AnchTableViewCell.m
//  LessonVedio
//
//  Created by lanou3g on 16/7/7.
//  Copyright © 2016年 ZSH. All rights reserved.
//

#import "AnchTableViewCell.h"

@implementation AnchTableViewCell


-(void)setMode:(AuthorMode *)mode{
    _mode = mode;
    [self.myimage setImageWithURL:[NSURL URLWithString:mode.icon] ];
    self.namelabel.text = mode.name;
    self.datelabel.text = mode.detail;
    self.rangelabel.text = [NSString stringWithFormat:@"排名:%@",mode.pop];
    
}

- (void)awakeFromNib {
    self.myimage.layer.masksToBounds = YES;
    self.myimage.layer.cornerRadius = self.myimage.bounds.size.width / 2.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
