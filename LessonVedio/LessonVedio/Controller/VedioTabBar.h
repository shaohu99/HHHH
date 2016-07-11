//
//  DouBanTabBar.h
//  LwssonDB
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VedioTabBar;
@protocol VedioTabBarDeleage <NSObject>

-(void)vedioItemDidClicked:(VedioTabBar *)tabBar;

@end

@interface VedioTabBar : UITabBar

@property(nonatomic,assign)int currentSelected;//当前选中的tabbar的下标
@property(nonatomic,strong) UIButton *currentSelectedItem;//当前选中的item
@property(nonatomic,strong)NSArray *allItem;//tabbar上面所有的item

@property(nonatomic,weak) id <VedioTabBarDeleage>vediodeleage;

//初始化方法 根据item初始化items
-(id)initWithItems:(NSArray *)items frame:(CGRect)frame;

@end
