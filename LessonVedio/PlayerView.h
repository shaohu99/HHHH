//
//  PlayerView.h
//  LessonVedio
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 ZSH. All rights reserved.
//
/*播放视频*/
#import <UIKit/UIKit.h>
//引入视频播放框架
#import <AVFoundation/AVPlayer.h>
#import <AVFoundation/AVFoundation.h>
@interface PlayerView : UIView

@property(nonatomic,strong)AVPlayerItem *palyeritme;//播放单元
@property(nonatomic,strong)AVPlayer *players;
@property(nonatomic,strong)AVPlayerLayer *playerlayer;

-(id)initWithUrl:(NSString *)url frame:(CGRect)frame;

@end
