//
//  HYHomeViewController.m
//  HYApp_base
//
//  Created by work on 16/9/18.
//  Copyright © 2016年 Hyyy. All rights reserved.
//

#import "HYHomeViewController.h"
#import "HYAdvertisingPageViewController.h"
#import "HYFileManager.h"

@interface HYHomeViewController ()

@end

@implementation HYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
    
    [self testFileHelper];
    // 监听广告相关
    [self listenAdNotification];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:DISPATCH_AD_PAGE object:nil];
}

- (void)testFileHelper {
    // 遍历Library目录
    NSArray *libraryArr = [HYFileManager listFilesInLibraryDirectoryByDeep:NO];
    NSLog(@"Library目录: %@", libraryArr);
//    // 创建文件夹
//    NSString *directoryPath = [NSString stringWithFormat:@"%@/test", [HYFileHelper libraryDir]];
//    BOOL isSuccess = [HYFileHelper createDirectoryAtPath:directoryPath];
//    NSLog(@"创建文件夹: %d", isSuccess);
//    // 创建文件
//    NSError *error;
//    NSString *filePath = [NSString stringWithFormat:@"%@/test/hyyy/file.md", [HYFileHelper libraryDir]];
//    BOOL isSuccess = [HYFileHelper createFileAtPath:filePath overwrite:YES];
//    NSLog(@"创建文件: %d", isSuccess);
//    // 复制文件
//    NSError *error;
//    NSString *path = [NSString stringWithFormat:@"%@/test/hyyy", [HYFileHelper libraryDir]];
//    NSString *toPath = [NSString stringWithFormat:@"%@/hyyy", [HYFileHelper libraryDir]];
//    BOOL isSuccess = [HYFileHelper copyItemAtPath:path toPath:toPath overwrite:YES error:&error];
//    NSLog(@"复制文件：%d", isSuccess);
//    // 移动文件
//    NSError *error;
//    NSString *path = [NSString stringWithFormat:@"%@/hyyy", [HYFileManager libraryDir]];
//    NSString *toPath = [NSString stringWithFormat:@"%@/test/hyyy", [HYFileManager libraryDir]];
//    BOOL isSuccess = [HYFileManager moveItemAtPath:path toPath:toPath overwrite:YES error:&error];
//    NSLog(@"移动文件：%d", isSuccess);
}

#pragma mark - 监听广告相关
- (void)listenAdNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushAdViewController) name:DISPATCH_AD_PAGE object:nil];
}

/**
 跳转到广告页面
 */
- (void)pushAdViewController {
    HYAdvertisingPageViewController *adVC = [[HYAdvertisingPageViewController alloc] init];
    [self.navigationController pushViewController:adVC animated:YES];
}

@end
