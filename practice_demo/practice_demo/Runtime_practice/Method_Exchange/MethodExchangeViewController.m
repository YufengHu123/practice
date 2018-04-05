//
//  MethodExchangeViewController.m
//  practice_demo
//
//  Created by 胡玉峰 on 2017/10/19.
//  Copyright © 2017年 胡玉峰. All rights reserved.
//

#import "MethodExchangeViewController.h"
#import <objc/runtime.h>

@interface MethodExchangeViewController ()<SDCycleScrollViewDelegate>

@property(nonatomic,strong) UIButton * funOneBtn;
@property(nonatomic,strong) UIButton * funTwoBtn;
@property (nonatomic,strong)UIButton * exchangeBtn;

@end

@implementation MethodExchangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    [self createView];
    [self createCyc];
    // Do any additional setup after loading the view.
}
-(void)createView{
    
    UIButton * funcOne = [UIButton getBtnWithType:UIButtonTypeCustom
                                      buttonTitle:@"func1"
                                           target:self
                                           andSEL:@selector(functionOne:)
                                       andBgColor:HYFColor(151, 151, 151)
                                         andImage:nil];
    [self.view addSubview:funcOne];
    self.funOneBtn = funcOne;
    
    UIButton * funcTwo = [UIButton getBtnWithType:UIButtonTypeCustom
                                      buttonTitle:@"func2"
                                           target:self
                                           andSEL:@selector(functionTwo:)
                                       andBgColor:HYFColor(151, 151, 151)
                                         andImage:nil];
    [self.view addSubview:funcTwo];
    self.funTwoBtn = funcTwo;
    
    UIButton * changeBtn = [UIButton getBtnWithType:UIButtonTypeCustom
                                      buttonTitle:@"clicking exchange func1 and func2"
                                           target:self
                                           andSEL:@selector(exchange:)
                                       andBgColor:HYFColor(151, 151, 151)
                                         andImage:nil];
    [self.view addSubview:changeBtn];
    self.exchangeBtn = changeBtn;

    
    [self createContrant];

}
-(void)createCyc{
    
    NSArray *titles = @[@"新建交流QQ群：185534916 ",
                        @"disableScrollGesture可以设置禁止拖动",
                        @"感谢您的支持，如果下载的",
                        @"如果代码在使用过程中出现问题",
                        @"您可以发邮件到gsdios@126.com"
                        ];
    
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];

    [[SDCycleScrollView alloc]init];
//    SDCycleScrollView *cycleScrollView4 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(20, 150, KMainWith, 40) delegate:nil placeholderImage:nil];
    
    
    SDCycleScrollView *cycleScrollView4 =  [[SDCycleScrollView alloc]init];;
    [cycleScrollView4 setFrame:CGRectMake(20, 150, KMainWith, 40)];
    cycleScrollView4.backgroundColor = [UIColor whiteColor];
    
    cycleScrollView4.scrollDirection = UICollectionViewScrollDirectionVertical;
    cycleScrollView4.onlyDisplayText = YES;
//    cycleScrollView4.imageURLStringsGroup = imagesURLStrings;
    
    NSMutableArray *titlesArray = [NSMutableArray new];
    [titlesArray addObject:@"纯文字上下滚动轮播"];
    [titlesArray addObject:@"纯文字上下滚动轮播 -- demo轮播图4"];
    [titlesArray addObjectsFromArray:titles];
    cycleScrollView4.titleLabelBackgroundColor = [UIColor whiteColor];
    cycleScrollView4.titleLabelTextColor = [UIColor blackColor];
    cycleScrollView4.titlesGroup = [titlesArray copy];
    [cycleScrollView4 disableScrollGesture];
    
    [self.view addSubview:cycleScrollView4];
    
}
-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    
    
}

-(void)createContrant{
    self.funOneBtn
    .sd_layout
    .leftSpaceToView(self.view, 20)
    .widthIs(100)
    .topSpaceToView(self.view, 20)
    .heightIs(40);
    
    self.funTwoBtn
    .sd_layout
    .rightSpaceToView(self.view, 20)
    .widthIs(100)
    .topSpaceToView(self.view, 20)
    .heightIs(40);
    
    self.exchangeBtn
    .sd_layout
    .topSpaceToView(self.funTwoBtn, 20)
    .widthRatioToView(self.view, 0.8)
    .heightIs(40)
    .leftSpaceToView(self.view, KMainWith*0.1);
}
-(void)exchange:(UIButton *)btn{
    /*runtime 方法交换核心代码 */
    Method funcOne = class_getInstanceMethod([self class], @selector(functionOne:));
    
    Method funcTwo = class_getInstanceMethod([self class], @selector(functionTwo:));
    
    method_exchangeImplementations(funcTwo, funcOne);
    
    [CommonTool showTemporaryMessage:@"方法交换成功,请重新点击上面按钮"];
    
}
-(void)functionOne:(UIButton*)btn{
    [CommonTool showAlertMessage:@"方法一执行"];
}
-(void)functionTwo:(UIButton*)btn{
    [CommonTool showAlertMessage:@"方法二执行"];
}

@end
