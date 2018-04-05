//
//  CutomKvoViewController.m
//  practice_demo
//
//  Created by 胡玉峰 on 2017/10/19.
//  Copyright © 2017年 胡玉峰. All rights reserved.
//

#import "CutomKvoViewController.h"
#import "Dog.h"
@interface CutomKvoViewController ()
@property(nonatomic,strong) Dog * mydog;

@property(nonatomic,strong) UIButton * changeAttributeBtn;

@property(nonatomic,strong) UIButton * AddCustomKVO;

@end

@implementation CutomKvoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mydog = [Dog new];
    
    [_mydog addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    
    [self createView];
    
    // Do any additional setup after loading the view.
}
-(void)createView{
    
    _changeAttributeBtn = [UIButton getBtnWithType:UIButtonTypeCustom
                                       buttonTitle:@"system change dog attribute and observe" target:self
                                            andSEL:@selector(changeAttribute:)
                                        andBgColor:HYFColor(151, 151, 151)
                                          andImage:nil];
    [self.view addSubview:self.changeAttributeBtn];
    
    _AddCustomKVO = [UIButton getBtnWithType:UIButtonTypeCustom
                                       buttonTitle:@"remove system KVO add custom KVO" target:self
                                            andSEL:@selector(AddCustomKVO:)
                                        andBgColor:HYFColor(151, 151, 151)
                                          andImage:nil];
    [self.view addSubview:self.AddCustomKVO];
    [self CreateConstraint];
}
-(void)CreateConstraint{
    
    self.changeAttributeBtn
    .sd_layout
    .widthRatioToView(self.view, 0.8)
    .heightIs(40)
    .leftSpaceToView(self.view, KMainWith*0.1)
    .topSpaceToView(self.view, 20);
    
    
    self.AddCustomKVO
    .sd_layout
    .topSpaceToView(self.changeAttributeBtn, 20)
    .heightIs(40)
    .leftEqualToView(self.changeAttributeBtn)
    .widthRatioToView(self.view, 0.8);
}
-(void)changeAttribute:(UIButton *)btn{
    static int index = 0;
    self.mydog.name = [NSString stringWithFormat:@"dog--%d",index];
    index++;
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    [CommonTool showTemporaryMessage:self.mydog.name];
}

-(void)AddCustomKVO:(UIButton *)btn{
    [self.mydog removeObserver:self forKeyPath:@"name"];
    [CommonTool showTemporaryMessage:@"KVO移除成功"];
    
    
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}


@end
