//
//  ViewController.m
//  practice_demo
//
//  Created by 胡玉峰 on 2017/10/17.
//  Copyright © 2017年 胡玉峰. All rights reserved.
//

#import "ViewController.h"
#import "SDAutoLayout.h"
//#import <objc/runtime.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) HBasicTableView * tableView;
@property(nonatomic,strong) NSArray * dataArr;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
    
    //多线程练习
//    [self practiceThread];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)practiceThread{
    //主队列 是一个特殊的串行队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    //系统提供的并行队列
    dispatch_queue_t xitongbing = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //创建串行队列
    dispatch_queue_t chuanxing = dispatch_queue_create("chuan1", DISPATCH_QUEUE_SERIAL);
    //创建并行队列
    dispatch_queue_t bingxing  = dispatch_queue_create("bing", DISPATCH_QUEUE_CONCURRENT);
    
    //创建任务
    //同步任务
    NSLog(@"执行前");
    dispatch_async(dispatch_get_main_queue(), ^{
             NSLog(@"%@",[NSThread currentThread]);
    });
    NSLog(@"执行了");
    //异步任务
//
//    dispatch_async(xitongbing, ^{
//      NSLog(@"%@",[NSThread currentThread]);
//    });
//    //延迟执行
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//        NSLog(@"异步执行了这段代码吗---%@", [NSThread currentThread]);
//    });
    
}
-(void)test{
    NSLog(@"执行前");
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"%@",[NSThread currentThread]);
    });
    NSLog(@"执行了");
}
-(void)createTableView{
    [self.view addSubview:self.tableView];
    self.title = @"Main menu";
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
    NSDictionary * dict =self.dataArr[indexPath.row];
    cell.textLabel.text = dict.allKeys[0] ;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
//    [self practiceThread];
//    return;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:[CommonTool getVCFunc:self.dataArr[indexPath.row]]
                                         animated:YES];
    
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
//      hyfWeak
//        _tableView = [HBasicTableView getTableViewWithFrame:KMainBounds
//                                                   andStyle:UITableViewStylePlain
//                                                 andDataNum:^NSInteger{
//
//                                                 } andCellForRow:^UITableViewCell *(NSIndexPath *indexPath) {
//                                                     static NSString * customCell = @"customCell";
//                                                     UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:customCell];
//                                                     if (!cell) {
//                                                         cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:customCell];
//                                                     }
//                                                     NSDictionary * dict =self.dataArr[indexPath.row];
//                                                     cell.textLabel.text = dict.allKeys[0] ;
//                                                     return cell;
//
//                                                 } andCellHeightForRow:^CGFloat(NSIndexPath *indexPath) {
//                                                     return 50;
//                                                 } andViewForHeader:^UIView *(NSInteger section) {
//                                                     return nil;
//                                                 } andViewForFooder:^UIView *(NSInteger section) {
//                                                     return nil;
//                                                 }];
        
    }
    return _tableView;
}

-(NSArray*)dataArr{
    
    if (!_dataArr) {
        _dataArr = @[@{@"runtime_practice":@"RunTimeMenuViewController"},
                     @{@"runLoop_practice":@"RunloopMenuViewController"},
                     @{@"animation_practice":@"AnimationMenuViewController"},
                     @{@"sd_practce":@"SDPracticeRootVC"},
                     @{@"GCD":@"GCDRootVC"},
                     ];
    }
    return _dataArr;
}


@end
