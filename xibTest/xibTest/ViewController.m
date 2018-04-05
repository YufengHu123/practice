//
//  ViewController.m
//  xibTest
//
//  Created by 胡玉峰 on 2017/11/1.
//  Copyright © 2017年 胡玉峰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ScrollerViewContentViewHeight;
@property (weak, nonatomic) IBOutlet UIView *ContentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _ScrollerViewContentViewHeight.constant = 500;
    UIView * view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 300)];
    view1.backgroundColor = [UIColor redColor];
    
    [_ContentView addSubview:view1];
    
    UIView * view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 300, 200, 300)];
    view2.backgroundColor = [UIColor orangeColor];
    
    [_ContentView addSubview:view2];
    _ContentView.clipsToBounds = YES;
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)updateViewConstraints{
    [super updateViewConstraints];

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
