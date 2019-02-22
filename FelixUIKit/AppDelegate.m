//
//  AppDelegate.m
//  FelixTableView
//
//  Created by weistek on 2019/2/13.
//  Copyright © 2019 weistek. All rights reserved.
//

#import "AppDelegate.h"
#import "Classes/FelixUIKit.h"
#import "CustomViewController.h"
@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    FelixTabBarController *tc = [[FelixTabBarController alloc] initWithTitles:@[@"主页",@"",@"我的"] titleFont:[UIFont systemFontOfSize:13] titleColor:[UIColor grayColor] selTitleColor:[UIColor redColor] imageNames:@[@"3-0",@"3-0",@"3-0"] selectedImageNames:@[@"3",@"3",@"3"]];
//    tc.tabBarIV.backgroundColor = [UIColor whiteColor];
//    tc.viewControllers = @[[UIViewController new],[UIViewController new],[UIViewController new]];
//    FelixPageViewController *pvc = [[FelixPageViewController alloc] initWithTitles:@[@"hello",@"world",@"dd",@"fs",@"helloword",@"pagecontroller",@"page",@"nice",@"ok",@"te"] titleHeight:80 titleColor:[UIColor lightGrayColor] selTitleColor:[UIColor redColor] controllerClass:[CustomViewController class]];
//    [self.view addSubview:pvc.view];
//    [pvc.view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.bottom.left.right.equalTo(self.view);
//    }];
//    self.window.rootViewController = pvc;
//    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
