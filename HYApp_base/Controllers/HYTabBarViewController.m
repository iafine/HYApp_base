//
//  HYTabBarViewController.m
//  HYApp_base
//
//  Created by work on 16/10/9.
//  Copyright © 2016年 Hyyy. All rights reserved.
//

#import "HYTabBarViewController.h"
#import "HYHomeViewController.h"
#import "HYGroupViewController.h"
#import "HYMessageViewController.h"
#import "HYMeViewController.h"

@interface HYTabBarViewController ()

@property (strong, nonatomic) HYHomeViewController *homeVC;
@property (strong, nonatomic) HYGroupViewController *groupVC;
@property (strong, nonatomic) HYMessageViewController *messageVC;
@property (strong, nonatomic) HYMeViewController *meVC;

@end

@implementation HYTabBarViewController

#pragma mark - lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加导航分支
    [self setupChildVC:self.homeVC title:@"首页" imageName:@"" selectedImageName:@""];
    [self setupChildVC:self.groupVC title:@"群组" imageName:@"" selectedImageName:@""];
    [self setupChildVC:self.messageVC title:@"消息" imageName:@"" selectedImageName:@""];
    [self setupChildVC:self.meVC title:@"我" imageName:@"" selectedImageName:@""];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private method
- (void)setupChildVC:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:imageName];
    nav.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    
    [self addChildViewController:nav];
}

#pragma mark - setter and getter
- (HYHomeViewController *)homeVC {
    if (!_homeVC) {
        _homeVC = [[HYHomeViewController alloc] init];
    }
    return _homeVC;
}

- (HYGroupViewController *)groupVC {
    if (!_groupVC) {
        _groupVC = [[HYGroupViewController alloc] init];
    }
    return _groupVC;
}

- (HYMessageViewController *)messageVC {
    if (!_messageVC) {
        _messageVC = [[HYMessageViewController alloc] init];
    }
    return _messageVC;
}

- (HYMeViewController *)meVC {
    if (!_meVC) {
        _meVC = [[HYMeViewController alloc] init];
    }
    return _meVC;
}

@end
