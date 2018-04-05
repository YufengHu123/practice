//
//  ViewController.m
//  jianbian
//
//  Created by 胡玉峰 on 2017/10/31.
//  Copyright © 2017年 胡玉峰. All rights reserved.
//

#import "ViewController.h"
#import "test.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    test *te = [[test alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 400)];
    te.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:te];
//    CGContextRef context=UIGraphicsGetCurrentContext();
//
//    //创建颜色空间
//
//    CGColorSpaceRef colorSpaceRef=CGColorSpaceCreateDeviceRGB();
//
//    //渐变的色谱
//
//    CGFloat colors[8]={1.0,0.0,0.0,1.0,1.0,1.0,1.0,1.0};
//
//    //渐变的开始到结束比例0-－1
//
//    CGFloat locations[2]={0.0,1.0};
//
//    //创建渐变
//
//    CGGradientRef gradient=CGGradientCreateWithColorComponents(colorSpaceRef, colors, locations, 2);
//
//    CGRect rct=CGRectMake(0,40,320,100);
//
//    CGContextClipToRect(context, rct);
//
//    CGContextDrawLinearGradient(context, gradient,CGPointMake(0,0),CGPointMake(320,0),kCGGradientDrawsAfterEndLocation);
//
//    CGColorSpaceRelease(colorSpaceRef);
//
//    CGGradientRelease(gradient);
//
//    // Do any additional setup after loading the view.
//
//    //创建CGContextRef
//    UIGraphicsBeginImageContext(self.view.bounds.size);
//    CGContextRef gc = UIGraphicsGetCurrentContext();
//
//    //创建CGMutablePathRef
//    CGMutablePathRef path = CGPathCreateMutable();
//
//    //绘制Path
//    CGRect rect = CGRectMake(0, 100, 300, 200);
//    CGPathMoveToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMinY(rect));
//    CGPathAddLineToPoint(path, NULL, CGRectGetMidX(rect), CGRectGetMaxY(rect));
//    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(rect), CGRectGetMaxY(rect));
//    CGPathCloseSubpath(path);
//
//    //绘制渐变
//    [self drawLinearGradient:gc path:path startColor:[UIColor greenColor].CGColor endColor:[UIColor redColor].CGColor];
//
//    //注意释放CGMutablePathRef
//    CGPathRelease(path);
//
//    //从Context中获取图像，并显示在界面上
//    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//
//    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
//    [self.view addSubview:imgView];

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)drawLinearGradient:(CGContextRef)context
                      path:(CGPathRef)path
                startColor:(CGColorRef)startColor
                  endColor:(CGColorRef)endColor
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    
    NSArray *colors = @[(__bridge id) startColor, (__bridge id) endColor];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    
    
    CGRect pathRect = CGPathGetBoundingBox(path);
    
    //具体方向可根据需求修改
    CGPoint startPoint = CGPointMake(CGRectGetMinX(pathRect), CGRectGetMidY(pathRect));
    CGPoint endPoint = CGPointMake(CGRectGetMaxX(pathRect), CGRectGetMidY(pathRect));
    
    CGContextSaveGState(context);
    CGContextAddPath(context, path);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
