//
//  HBasicViewController.m
//  practice_demo
//
//  Created by 胡玉峰 on 2017/10/18.
//  Copyright © 2017年 胡玉峰. All rights reserved.
//

#import "HBasicViewController.h"

@interface HBasicViewController ()

@end

@implementation HBasicViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    if (self.navigationController.viewControllers.count>1) {
        UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [backBtn setFrame:CGRectMake(0, 0, 40, 40)];
        [backBtn setImage:[UIImage imageNamed:@"backspace"] forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(backToPreviousVC) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem * backBtnItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
        self.navigationItem.leftBarButtonItem = backBtnItem;
    }
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:HYFColor(245, 200, 200) size:CGSizeMake(1, 1)] forBarMetrics:UIBarMetricsDefault];

}

-(void)backToPreviousVC{
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
