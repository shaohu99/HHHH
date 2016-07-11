//
//  PlayerView.m
//  LessonVedio
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 ZSH. All rights reserved.
//

#import "PlayerView.h"

@implementation PlayerView

-(id)initWithUrl:(NSString *)url frame:(CGRect)frame{
    if ( self = [super init]) {
        self.frame = frame;
        _palyeritme = [[AVPlayerItem alloc]initWithURL:[NSURL URLWithString:url]];
        _players = [[AVPlayer alloc]initWithPlayerItem:_palyeritme];
        _playerlayer = [AVPlayerLayer playerLayerWithPlayer:_players];
        [self.layer addSublayer:_playerlayer];
        _playerlayer.frame = self.bounds;
        [_players addObserver:self forKeyPath:@"status" options: NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew|NSKeyValueObservingOptionInitial context:nil];
    }
    return self;
}
//添加观察者
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"status"]) {
        //当状态变为readytoplayer
        //NSLog(@"change = %@",change);
        if (_players.status == AVPlayerStatusReadyToPlay) {
            [_players play];
        }
    }
}
//执行完 移除观察者
-(void)dealloc{
    [_players removeObserver:self forKeyPath:@"status" context:nil];
}

@end
