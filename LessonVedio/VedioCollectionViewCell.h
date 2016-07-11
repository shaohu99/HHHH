//
//  VedioCollectionViewCell.h
//  LessonVedio
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 ZSH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VedioModel.h"
@class VedioCollectionViewCell;
@protocol VedioCollectionViewCellDelegate <NSObject>

-(void)vedioCollectionViewPlayBtnClicked:(VedioCollectionViewCell *)cell;

@end


#define VedioCollectionViewCell_ID @"VedioCollectionViewCell_ID"
@interface VedioCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageviews;
@property (weak, nonatomic) IBOutlet UILabel *itmelabel;
@property (weak, nonatomic) IBOutlet UILabel *titlelable;
@property (weak, nonatomic) IBOutlet UILabel *riqilabel;
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property(assign ,nonatomic) int tyep;


@property(weak ,nonatomic)id<VedioCollectionViewCellDelegate> vedioDelegate;
@property(nonatomic,strong)VedioModel *vediomode;
@end
