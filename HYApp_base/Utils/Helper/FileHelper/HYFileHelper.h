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

#pragma mark - 遍历文件夹
/**
 文件遍历

 @param path 目录的绝对路径
 @param deep 是否深遍历 (1. 浅遍历：返回当前目录下的所有文件和文件夹；
                       2. 深遍历：返回当前目录下及子目录下的所有文件和文件夹)
 @return 遍历结果数组
 */
+ (NSArray *)listFilesInDirectoryAtPath:(NSString *)path deep:(BOOL)deep;
// 遍历沙盒主目录
+ (NSArray *)listFilesInHomeDirectoryByDeep:(BOOL)deep;
// 遍历Documents目录
+ (NSArray *)listFilesInDocumentDirectoryByDeep:(BOOL)deep;
// 遍历Library目录
+ (NSArray *)listFilesInLibraryDirectoryByDeep:(BOOL)deep;
// 遍历Caches目录
+ (NSArray *)listFilesInCachesDirectoryByDeep:(BOOL)deep;
// 遍历tmp目录
+ (NSArray *)listFilesInTmpDirectoryByDeep:(BOOL)deep;

#pragma mark - 获取文件属性
// 根据key获取文件某个属性
+ (id)attributeOfItemAtPath:(NSString *)path forKey:(NSString *)key;
// 根据key获取文件某个属性(错误信息error)
+ (id)attributeOfItemAtPath:(NSString *)path forKey:(NSString *)key error:(NSError **)error;
// 获取文件属性集合
+ (NSDictionary *)attributesOfItemAtPath:(NSString *)path;
// 获取文件属性集合(错误信息error)
+ (NSDictionary *)attributesOfItemAtPath:(NSString *)path error:(NSError **)error;

#pragma mark - 创建文件(夹)
// 创建文件夹
+ (BOOL)createDirectoryAtPath:(NSString *)path;
// 创建文件夹(错误信息error)
+ (BOOL)createDirectoryAtPath:(NSString *)path error:(NSError **)error;
// 创建文件
+ (BOOL)createFileAtPath:(NSString *)path;
// 创建文件(错误信息error)
+ (BOOL)createFileAtPath:(NSString *)path error:(NSError **)error;
// 创建文件，是否覆盖
+ (BOOL)createFileAtPath:(NSString *)path overwrite:(BOOL)overwrite;
// 创建文件，是否覆盖(错误信息error)
+ (BOOL)createFileAtPath:(NSString *)path overwrite:(BOOL)overwrite error:(NSError **)error;
// 创建文件，文件内容
+ (BOOL)createFileAtPath:(NSString *)path content:(NSObject *)content;
// 创建文件，文件内容(错误信息error)
+ (BOOL)createFileAtPath:(NSString *)path content:(NSObject *)content error:(NSError **)error;
// 创建文件，文件内容，是否覆盖
+ (BOOL)createFileAtPath:(NSString *)path content:(NSObject *)content overwrite:(BOOL)overwrite;
// 创建文件，文件内容，是否覆盖(错误信息error)
+ (BOOL)createFileAtPath:(NSString *)path content:(NSObject *)content overwrite:(BOOL)overwrite error:(NSError **)error;
// 获取创建文件时间
+ (NSDate *)creationDateOfItemAtPath:(NSString *)path;
// 获取创建文件时间(错误信息error)
+ (NSDate *)creationDateOfItemAtPath:(NSString *)path error:(NSError **)error;
// 获取文件修改时间
+ (NSDate *)modificationDateOfItemAtPath:(NSString *)path;
// 获取文件修改时间(错误信息error)
+ (NSDate *)modificationDateOfItemAtPath:(NSString *)path error:(NSError **)error;

#pragma mark - 删除文件(夹)
// 删除文件
+ (BOOL)removeItemAtPath:(NSString *)path;
// 删除文件(错误信息error)
+ (BOOL)removeItemAtPath:(NSString *)path error:(NSError **)error;
// 清空Caches文件夹
+ (BOOL)clearCachesDirectory;
// 清空tmp文件夹
+ (BOOL)clearTmpDirectory;

#pragma mark - 复制文件(夹)
// 复制文件
+ (BOOL)copyItemAtPath:(NSString *)path toPath:(NSString *)toPath;
// 复制文件(错误信息error)
+ (BOOL)copyItemAtPath:(NSString *)path toPath:(NSString *)toPath error:(NSError **)error;
// 复制文件，是否覆盖
+ (BOOL)copyItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite;
// 复制文件，是否覆盖(错误信息error)
+ (BOOL)copyItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite error:(NSError **)error;

#pragma mark - 移动文件(夹)
// 移动文件
+ (BOOL)moveItemAtPath:(NSString *)path toPath:(NSString *)toPath;
// 移动文件(错误信息error)
+ (BOOL)moveItemAtPath:(NSString *)path toPath:(NSString *)toPath error:(NSError **)error;
// 移动文件，是否覆盖
+ (BOOL)moveItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite;
// 移动文件，是否覆盖(错误信息error)
+ (BOOL)moveItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite error:(NSError **)error;

#pragma mark - 根据URL获取文件名
// 根据文件路径获取文件名称，是否需要后缀
+ (NSString *)fileNameAtPath:(NSString *)path suffix:(BOOL)suffix;
// 获取文件所在的文件夹路径
+ (NSString *)directoryAtPath:(NSString *)path;
// 根据文件路径获取文件扩展类型
+ (NSString *)suffixAtPath:(NSString *)path;

#pragma mark - 判断文件(夹)是否存在
// 判断文件路径是否存在
+ (BOOL)isExistsAtPath:(NSString *)path;

#pragma mark - 写入文件内容
// 写入文件内容
+ (BOOL)writeFileAtPath:(NSString *)path content:(NSObject *)content;
// 写入文件内容(错误信息error)
+ (BOOL)writeFileAtPath:(NSString *)path content:(NSObject *)content error:(NSError **)error;

@end
