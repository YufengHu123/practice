//
//  UIButton+HYF.m
//  practice_demo
//
//  Created by 胡玉峰 on 2017/10/19.
//  Copyright © 2017年 胡玉峰. All rights reserved.
//

#import "UIButton+HYF.h"

@implementation UIButton (HYF)

+(UIButton *)getBtnWithType:(UIButtonType)type
                buttonTitle:(NSString *)titile
                     target:(id)target
                     andSEL:(SEL)method
                 andBgColor:(UIColor *)color
                   andImage:(UIImage *)image
{
    
    UIButton * btn = [UIButton buttonWithType:type];
    [btn setTitle:titile forState:UIControlStateNormal];
    [btn addTarget:target action:method forControlEvents:UIControlEventTouchUpInside];
    if (color) {
        [btn setBackgroundColor:color];
    }
    if (image) {
        [btn setImage:image forState:UIControlStateNormal];
    }
    
    return btn;
}
@end
