//
//  HBasicViewController.m
//  practice_demo
//
//  Created by 胡玉峰 on 2017/10/18.
//  Copyright © 2017年 胡玉峰. All rights reserved.
//

#import "HBasicViewController.h"
#import "HBasicTableView.h"

@interface HBasicViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) HBasicTableView * tableView;
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
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view setBackgroundColor:HYFColor(210, 160, 140)];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;

}

-(void)backToPreviousVC{
    
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark tableView-delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

-(HBasicTableView*)tableView{
    if (!_tableView) {
        _tableView = [[HBasicTableView alloc]initWithFrame:KMainBounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor redColor];
        _tableView.tableFooterView = [UIView new];
        [_tableView setFrame:KMainBounds];
        
    }
    return _tableView;
}
@end
