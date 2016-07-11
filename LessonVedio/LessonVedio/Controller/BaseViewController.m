//
//  BaseViewController.m
//  LessonDB
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 ZSH. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController

-(void)viewDidLoad{
    
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.rootVC = (RootViewController *)[[[UIApplication sharedApplication]windows]objectAtIndex:0].rootViewController;
}
@end
