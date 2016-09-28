//
//  AppDelegate.m
//  HYApp_base
//
//  Created by Hyyy on 16/8/19.
//  Copyright © 2016年 Hyyy. All rights reserved.
//

#import "AppDelegate.h"
#import "HYHomeViewController.h"
#import "HYAdHelper.h"
#import "HYAdvertisingView.h"

@interface AppDelegate ()

@property (strong, nonatomic) HYAdvertisingView *advertisingView;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    // 初始化网络
    // 初始化数据库
    HYHomeViewController *homeVC = [[HYHomeViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    self.window.rootViewController = nav;
    
    [self.window makeKeyAndVisible];
    
    // 加载广告
    if ([HYAdHelper isNeedShow]) {
        self.advertisingView.imageFieldPath = [HYAdHelper adImagePath];
        [self.advertisingView show];
    }
    // 更新广告
    [HYAdHelper refreshAdvertisingImage];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - setter and getter
- (HYAdvertisingView *)advertisingView {
    if (!_advertisingView) {
        _advertisingView = [[HYAdvertisingView alloc] initWithFrame:self.window.bounds];
    }
    return _advertisingView;
}

@end
