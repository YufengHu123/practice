//
//  UIButton+HYF.h
//  practice_demo
//
//  Created by 胡玉峰 on 2017/10/19.
//  Copyright © 2017年 胡玉峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (HYF)
+(UIButton *)getBtnWithType:(UIButtonType)type
                buttonTitle:(NSString *)titile
                     target:(id)target
                     andSEL:(SEL)method
                 andBgColor:(UIColor *)color
                   andImage:(UIImage *)image;
@end
