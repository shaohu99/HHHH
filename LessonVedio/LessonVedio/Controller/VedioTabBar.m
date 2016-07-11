//
//  DouBanTabBar.m
//  LwssonDB
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "VedioTabBar.h"

@implementation VedioTabBar

-(id)initWithItems:(NSArray *)items frame:(CGRect)frame{
    
    if (self = [super init]) {
        
        self.frame = frame;
        for (int i = 0; i <items.count; i++) {
            UIButton *btn = (UIButton *)items[i];
            CGFloat with  = self.bounds.size.width/items.count;
            CGFloat height = self.bounds.size.height;
            btn.frame = CGRectMake(i*with, 0, with, height);
            [self addSubview:btn];
            [btn addTarget:self action:@selector(btnClicked:) forControlEvents:(UIControlEventTouchUpInside)];
            
        }
        self.currentSelected = 0;
        self.currentSelectedItem = items[0];
        self.allItem = items;
    }
     return self;
}

-(void)btnClicked:(UIButton *)sender{
    self.currentSelectedItem = sender;
 
    for (int i = 0; i < self.allItem.count; i++) {
        UIButton *tempbtn = (UIButton *)self.allItem[i];
        if (sender == tempbtn) {
            self.currentSelected = i;
            tempbtn.selected = YES;
        }else{
            tempbtn.selected = NO;
        }
    }
    //
    if (_vediodeleage) {
        [_vediodeleage vedioItemDidClicked:self];
    }
}

@end
