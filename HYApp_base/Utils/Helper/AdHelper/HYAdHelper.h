//
//  HYAdHelper.h
//  HYApp_base(广告工具)
//
//  Created by work on 16/9/22.
//  Copyright © 2016年 Hyyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYAdHelper : NSObject

/**
 是否需要显示广告
 */
+ (BOOL)isNeedShow;


/**
 广告图片目录地址
 */
+ (NSString *)adImagePath;


/**
 更新广告图片
 */
+ (void)refreshAdvertisingImage;

@end
