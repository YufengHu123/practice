//
//  test.m
//  jianbian
//
//  Created by 胡玉峰 on 2017/10/31.
//  Copyright © 2017年 胡玉峰. All rights reserved.
//

#import "test.h"

@implementation test

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setNeedsLayout];
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    CGContextRef context=UIGraphicsGetCurrentContext();
    
    //创建颜色空间
    CGColorSpaceRef colorSpaceRef=CGColorSpaceCreateDeviceRGB();
    //渐变的谱
    CGFloat colors[8]={1.0,0.0,0.0,1.0,1.0,1.0,1.0,1.0};
    //渐变的开始到结束比例0-－1
    CGFloat locations[2]={0.0,1.0};
    //创建渐变
    CGGradientRef gradient=CGGradientCreateWithColorComponents(colorSpaceRef, colors, locations, 2);
    CGRect rct=CGRectMake(0,40,320,2);
    CGContextClipToRect(context, rct);
    CGContextDrawLinearGradient(context, gradient,CGPointMake(0,0),CGPointMake(320,0),kCGGradientDrawsAfterEndLocation);
    CGColorSpaceRelease(colorSpaceRef);
    CGGradientRelease(gradient);
}


@end
