//
//  CommonTool.h
//  practice_demo
//
//  Created by 胡玉峰 on 2017/10/19.
//  Copyright © 2017年 胡玉峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#define  hyfWeak (__weak typeof(self) * weakSelf = self;)
@interface CommonTool : NSObject

+(UIViewController *)getVCFunc:(NSDictionary *)dict;

+(void)showAlertMessage:(NSString *)msg;

+(void)showTemporaryMessage:(NSString *)msg;

@end
