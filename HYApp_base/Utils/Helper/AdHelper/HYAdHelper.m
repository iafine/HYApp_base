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
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *imageName = [defaults valueForKey:ad_image_name];
    NSString *filePath = [self adImagePathWithImageName:imageName];
    BOOL isExist = [self isFileExistWithFilePath:filePath];
    return isExist;
}

+ (NSString *)adImagePath {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *imageName = [defaults valueForKey:ad_image_name];
    NSString *filePath = [self adImagePathWithImageName:imageName];
    return filePath;
}

+ (void)refreshAdvertisingImage {
    // 请求广告内容(先用一些图片代替)
    NSString *imageUrl = @"http://media.idownloadblog.com/wp-content/uploads/2013/09/116@2xiphone.png";
    // 获取图片名
    NSString *imageName = [[imageUrl componentsSeparatedByString:@"/"] lastObject];
    // 先判断本地是否有这张图片
    NSString *filePath = [self adImagePathWithImageName:imageName];
    BOOL isExist = [self isFileExistWithFilePath:filePath];
    if (!isExist) {
        // 图片不存在，删除旧的广告图片，替换新的广告图片
        [self downloadAdImageWithUrl:imageUrl imageName:imageName];
    }
}

#pragma mark - private methods

// 广告文件目录
+ (NSString *)adImagePathWithImageName:(NSString *)imageName {
    if (imageName) {
        // 获取Cache目录
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES);
        // 图片路径
        NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:imageName];
        return filePath;
    }
    return nil;
}

+ (BOOL)isFileExistWithFilePath:(NSString *)filePath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDirectory = false;
    return [fileManager fileExistsAtPath:filePath isDirectory:&isDirectory];
}

// 下载广告图片
+ (void)downloadAdImageWithUrl:(NSString *)imageUrl imageName:(NSString *)imageName {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
        UIImage *image = [UIImage imageWithData:imageData];
        NSString *filePath = [self adImagePathWithImageName:imageName];
        if ([UIImagePNGRepresentation(image) writeToFile:filePath atomically:YES]) {
            NSLog(@"保存广告图片成功");
            // 删除旧图片，将广告图片名称缓存起来
            [self deleteOldAdImageFile];
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:imageName forKey:ad_image_name];
            [defaults synchronize];
        }else {
            NSLog(@"保存广告图片失败，请检查图片URL链接");
        }
    });
}

+ (void)deleteOldAdImageFile {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *imageName = [defaults valueForKey:ad_image_name];
    if (imageName) {
        NSString *filePath = [self adImagePathWithImageName:imageName];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager removeItemAtPath:filePath error:nil];
    }
}

@end
