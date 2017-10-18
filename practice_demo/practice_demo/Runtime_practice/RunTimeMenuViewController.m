//
//  ViewController.m
//  practice_demo
//
//  Created by 胡玉峰 on 2017/10/17.
//  Copyright © 2017年 胡玉峰. All rights reserved.
//

#import "RunTimeMenuViewController.h"
#import "SDAutoLayout.h"

@interface RunTimeMenuViewController  ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) HBasicTableView * tableView;
@property(nonatomic,strong) NSArray * dataArr;


@end

@implementation RunTimeMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)createTableView{
    [self.view addSubview:self.tableView];
    self.title = @"Runtime_Menu";
}

#pragma mark tableView-delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * customCell = @"customCell";
    
    
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:customCell];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:customCell];
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
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

-(NSArray*)dataArr{
    
    if (!_dataArr) {
        _dataArr = @[@"runtime_practice",
                     @"runLoop_practice",
                     @"animationi_practice"
                     ];
    }
    
    return _dataArr;
}


@end

