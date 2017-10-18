//
//  HBasicTableView.m
//  practice_demo
//
//  Created by 胡玉峰 on 2017/10/18.
//  Copyright © 2017年 胡玉峰. All rights reserved.
//

#import "HBasicTableView.h"

@implementation HBasicTableView


-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    if (self =  [super initWithFrame:frame style:style]) {
        self.backgroundView =  [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tableview_bg"]];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
