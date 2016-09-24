//
//  HYHomeViewController.m
//  HYApp_base
//
//  Created by work on 16/9/18.
//  Copyright © 2016年 Hyyy. All rights reserved.
//

#import "HYHomeViewController.h"
#import "HYAdvertisingPageViewController.h"

@interface HYHomeViewController ()

@end

@implementation HYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
    
    // 监听广告跳转通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushAdViewController) name:DISPATCH_AD_PAGE object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:DISPATCH_AD_PAGE object:nil];
}

#pragma mark - events

/**
 跳转到广告页面
 */
- (void)pushAdViewController {
    HYAdvertisingPageViewController *adVC = [[HYAdvertisingPageViewController alloc] init];
    [self.navigationController pushViewController:adVC animated:YES];
}

@end
