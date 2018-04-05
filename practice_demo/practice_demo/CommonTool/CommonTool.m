//
//  CommonTool.m
//  practice_demo
//
//  Created by 胡玉峰 on 2017/10/19.
//  Copyright © 2017年 胡玉峰. All rights reserved.
//

#import "CommonTool.h"

@implementation CommonTool
+(UIViewController *)getVCFunc:(NSDictionary *)dict{
    
    NSString * className = dict.allValues[0];
    Class  VCclass = NSClassFromString(className);
    UIViewController* VC = [[VCclass alloc]init];
    return VC;
    
}
+(void)showAlertMessage:(NSString *)msg{
    [LEEAlert alert]
    .config
    .LeeContent(msg)
    .LeeAction(@"确定", nil)
    .LeeShow();
}


+(void)showTemporaryMessage:(NSString *)msg{
    [SVProgressHUD setBorderColor:HYFColor(151, 151, 151)];
    [SVProgressHUD setBackgroundColor:HYFColor(241, 241, 241)];

    [SVProgressHUD showSuccessWithStatus:msg];
    [SVProgressHUD dismissWithDelay:0.5];
}
@end
