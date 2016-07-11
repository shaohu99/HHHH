
//
//  RootViewController.m
//  LessonDB
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 ZSH. All rights reserved.
//

#import "RootViewController.h"


@interface RootViewController ()<VedioTabBarDeleage>

//@property (strong,nonatomic)VedioTabBar *vediotabbar;
@end

@implementation RootViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.tabBar.hidden = YES;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"first_selected.png"] forState:UIControlStateNormal];
    [btn setTitle:@"活动" forState:UIControlStateNormal];
    //btn.backgroundColor = [UIColor redColor];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -60, -30, 0)];
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 15, 0);//偏移量
    [btn setImage:[UIImage imageNamed:@"first_normal.png" ] forState:UIControlStateSelected];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    //btn2.backgroundColor = [UIColor orangeColor];
    [btn2 setImage:[UIImage imageNamed:@"second_selected.png"] forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:@"second_normal.png" ] forState:UIControlStateSelected];
   
    
    self.vediotabbar = [[VedioTabBar alloc]initWithItems:@[btn,btn2]frame:CGRectMake(0, WindowHeight-49, WindownWidth, 49)];
    
    [self.view addSubview:self.vediotabbar];
    self.vediotabbar.vediodeleage = self;
    
    

}
//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    self.vediotabbar.hidden = NO;
//}
-(void)vedioItemDidClicked:(VedioTabBar *)tabBar{
    
   // self.selectedIndex = tabBar.currentSelected;
    
    
}
@end
