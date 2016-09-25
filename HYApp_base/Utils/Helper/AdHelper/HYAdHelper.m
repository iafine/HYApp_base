//
//  HYAdHelper.m
//  HYApp_base
//
//  Created by work on 16/9/22.
//  Copyright © 2016年 Hyyy. All rights reserved.
//

#import "HYAdHelper.h"

static NSString *const ad_image_name = @"AD_IMAGE_NAME";

@implementation HYAdHelper

#pragma mark - public methods
+ (BOOL)isNeedShow {
    NSString *filePath = [self getFilePathWithImageName:[kUserDefaults valueForKey:adImageName]];
    
    BOOL isExist = [self isFileExistWithFilePath:filePath];
}

#pragma mark - private methods
- (NSString *)adImagePathWithImageName:(NSString *)imageName {
    if (imageName) {
        // 获取Cache目录
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES);
        // 图片路径
        NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:imageName];
        return filePath;
    }
    return nil;
}

- (BOOL)isFileExistWithFilePath:(NSString *)filePath {
    NSFileManager *fileManage = [NSFileManager defaultManager];
    BOOL isDirectory = false;
    
}
@end
