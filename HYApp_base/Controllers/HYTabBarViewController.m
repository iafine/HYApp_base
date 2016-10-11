//
//  HYTabBarViewController.m
//  HYApp_base
//
//  Created by work on 16/10/9.
//  Copyright © 2016年 Hyyy. All rights reserved.
//

#import "HYTabBarViewController.h"
#import "HYHomeViewController.h"
#import "HYLocationViewController.h"
#import "HYMessageViewController.h"
#import "HYMeViewController.h"
#import "HYColorHelper.h"

@interface HYTabBarViewController ()

@property (strong, nonatomic) HYHomeViewController *homeVC;
@property (strong, nonatomic) HYLocationViewController *locationVC;
@property (strong, nonatomic) HYMessageViewController *messageVC;
@property (strong, nonatomic) HYMeViewController *meVC;

@end

@implementation HYTabBarViewController

#pragma mark - lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTabBarAttributes];
    
    // 添加导航分支
    [self setupChildVC:self.homeVC title:@"首页" imageName:@"home" selectedImageName:@"home_selected"];
    [self setupChildVC:self.locationVC title:@"位置" imageName:@"location" selectedImageName:@"location_selected"];
    [self setupChildVC:self.messageVC title:@"提醒" imageName:@"bell" selectedImageName:@"bell_selected"];
    [self setupChildVC:self.meVC title:@"设置" imageName:@"setting" selectedImageName:@"setting_selected"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private method
- (void)setupChildVC:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [self setupNavigationBarAttributes];
    
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.imageInsets = UIEdgeInsetsMake(2, 2, 2, 2);
    [nav.navigationBar setTranslucent:NO];  // 取消导航栏默认透明效果
    
    [self addChildViewController:nav];
    
}

- (void)setupNavigationBarAttributes {
    [[UINavigationBar appearance] setBarTintColor:[HYColorHelper colorWithHexString:@"#92b94a"]];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName]];
}

- (void)setupTabBarAttributes {
    [[UITabBar appearance] setTintColor:[HYColorHelper colorWithHexString:@"#92b94a"]];
}

#pragma mark - setter and getter
- (HYHomeViewController *)homeVC {
    if (!_homeVC) {
        _homeVC = [[HYHomeViewController alloc] init];
    }
    return _homeVC;
}

- (HYLocationViewController *)locationVC {
    if (!_locationVC) {
        _locationVC = [[HYLocationViewController alloc] init];
    }
    return _locationVC;
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
