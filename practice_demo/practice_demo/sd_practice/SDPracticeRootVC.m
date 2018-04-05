//
//  SDPracticeRootVC.m
//  practice_demo
//
//  Created by 胡玉峰 on 2018/4/4.
//  Copyright © 2018年 胡玉峰. All rights reserved.
//

#import "SDPracticeRootVC.h"
#import  "UIImageView+WebCache.h"

#define  imageUrl @"http://koala-app.oss-cn-hangzhou.aliyuncs.com/img/woman.png"
@interface SDPracticeRootVC ()
@property(nonatomic,strong) UIImageView * centerImageView;
@end

@implementation SDPracticeRootVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setUpView];
    // Do any additional setup after loading the view.
}
-(void)setUpView{
    UIButton * topBtn = [UIButton  buttonWithType:UIButtonTypeCustom];
    topBtn.frame = CGRectMake(100, 20, 100, 40);
    [topBtn setTitle:@"start" forState:UIControlStateNormal];
    [topBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [topBtn addTarget:self action:@selector(beginLoadImage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:topBtn];
   
    [self.view addSubview:self.centerImageView];
    
        [self.centerImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"NAN"]];

 
}
-(void)beginLoadImage:(UIButton *)btn{
   
    
    static NSInteger index = 0;
    if (index %2 == 0) {
        [UIView animateWithDuration:0.5 animations:^{
            self.centerImageView.layer.anchorPoint = CGPointMake(0.8,0);
            self.centerImageView.transform = CGAffineTransformMakeRotation(M_PI);
        }];
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            self.centerImageView.transform = CGAffineTransformIdentity;
        }];
    }
    index++;
      [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
    dispatch_async(dispatch_queue_create("nihao", DISPATCH_QUEUE_CONCURRENT), ^{
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
    });
}
-(void)timeAction:(NSTimer *)time{
    NSLog(@"zhixingle ");
}
-(UIImageView*)centerImageView{
    if (!_centerImageView) {
        _centerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.centerX - 100, 200, 200, 200)];
        _centerImageView.backgroundColor = [UIColor redColor];
    }
    return _centerImageView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
