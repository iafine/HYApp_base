//
//  HYColorHelper.h
//  HYApp_base
//
//  Created by work on 2016/10/10.
//  Copyright © 2016年 Hyyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HYColorHelper : NSObject

/**
 通过颜色16进制值(例如：#fff, #ffff, #ff00aa or #ff00aaee)生成一个颜色。
 
 @param hexString 颜色16进制值
 @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;

/**
 通过颜色16进制值(例如：#fff, #ffff, #ff00aa or #ff00aaee)生成一个颜色。
 
 @param hexString 颜色16进制值
 @param alpha 透明度(0 ~ 1)
 @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

/**
 通过RGB值，无需输入R/255.0这样的值，生成一个颜色。
 
 @param red 红色数值(0 ~ 255)
 @param green 绿色数值(0 ~ 255)
 @param blue 蓝色数值(0 ~ 255)
 @return UIColor
 */
+ (UIColor *)colorWith8BitRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;

/**
 通过RGB值，无需输入R/255.0这样的值，生成一个颜色。
 
 @param red 红色数值(0 ~ 255)
 @param green 绿色数值(0 ~ 255)
 @param blue 蓝色数值(0 ~ 255)
 @param alpha 透明度(0 ~ 1)
 @return UIColor
 */
+ (UIColor *)colorWith8BitRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha;

@end
