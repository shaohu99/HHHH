//
//  VedioCollectionViewCell.m
//  LessonVedio
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 ZSH. All rights reserved.
//

#import "VedioCollectionViewCell.h"
@implementation VedioCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setTyep:(int)tyep{
    _tyep = tyep;
    if (_tyep == 1) {
        _btn.hidden = NO;
    }
    else {
        _btn.hidden = YES;
    }
    
}
- (IBAction)playBtnClicked:(UIButton *)sender
{

    if (_vedioDelegate && [_vedioDelegate respondsToSelector:@selector(vedioCollectionViewPlayBtnClicked:)]) {
        [_vedioDelegate vedioCollectionViewPlayBtnClicked:self];
   }
    
    
}
-(void)setVediomode:(VedioModel *)vediomode{
    
    _vediomode = vediomode;
    
    _itmelabel.text = vediomode.time;
    _titlelable.text = vediomode.title;
    _riqilabel.text = vediomode.date;
    
    [_imageviews setImageWithURL:[NSURL URLWithString:vediomode.thumb]];
    
}
@end
