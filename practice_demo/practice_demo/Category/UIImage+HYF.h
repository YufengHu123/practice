//
//  UIImage+HYF.h
//  practice_demo
//
//  Created by 胡玉峰 on 2017/10/18.
//  Copyright © 2017年 胡玉峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HYF)
/** 返回一张中间拉伸的图片 */
+ (UIImage *)resizedImageWithName:(NSString *)name;
/** 左边拉伸 */
+ (UIImage *)leftresizedImageWithName:(NSString *)name;
/** 返回一张特定View的截图图片  */
+ (UIImage *)imageFromView:(UIView *)view;
/**  根据颜色生成一张图片 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
/**  压缩图片 */
+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;
@end
