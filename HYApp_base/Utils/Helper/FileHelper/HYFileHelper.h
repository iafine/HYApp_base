//
//  HYFileHelper.h
//  HYApp_base(沙盒目录中文件操作)
//
//  Created by work on 16/9/30.
//  Copyright © 2016年 Hyyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYFileHelper : NSObject

#pragma mark - 沙盒目录相关
// 沙盒的主目录路径
+ (NSString *)homeDir;

// 沙盒中Documents的目录路径
+ (NSString *)documentsDir;

// 沙盒中Library的目录路径
+ (NSString *)libraryDir;

// 沙盒中Libarary/Preferences的目录路径
+ (NSString *)preferencesDir;

// 沙盒中Library/Caches的目录路径
+ (NSString *)cachesDir;

// 沙盒中tmp的目录路径
+ (NSString *)tmpDir;

#pragma mark - 根据文件名获取文件路径
// 根据文件名获取文件路径 (Document目录下)
+ (NSString *)filePathAtDocumentDirectory:(NSString *)fileName;

// 根据文件名获取文件路径 (Resource目录下)
+ (NSString *)filePathAtResourceDirectory:(NSString *)fileName;

// 根据文件名、文件类型获取文件路径 (Resource目录下)
+ (NSString *)filePathAtResourceDirectory:(NSString *)fileName type:(NSString *)type;

// 根据文件名获取文件路径 (Library目录下)
+ (NSString *)filePathAtLibraryDirectory:(NSString *)fileName;

// 根据文件名获取文件路径 (Caches目录下)
+ (NSString *)filePathAtCacheDirecroty:(NSString *)fileName;

// 根据文件名获取文件路径 (tmp目录下)
+ (NSString *)filePathAtTmpDirectory:(NSString *)fileName;

@end
