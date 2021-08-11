//
//  AppDelegate.m
//  SuitOlderDemo
//
//  Created by mac  on 2021/8/2.
//

#import "AppDelegate.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "SuitOlderSettingViewController.h"
#import "CustomTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    CustomTabBarController *rootVC = [[CustomTabBarController alloc] init];

    UIViewController *one = [self getVC:[[OneViewController alloc] init]];
    one.title = @"one";
    UIViewController *two = [self getVC:[[TwoViewController alloc] init]];
    two.title = @"two";
    UIViewController *setting = [self getVC:[[SuitOlderSettingViewController alloc] init]];
    setting.title = @"title";
    rootVC.viewControllers = @[one, two, setting];

    self.window.rootViewController = rootVC;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (UIViewController *)getVC:(UIViewController *)controller
{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
    nav.hidesBottomBarWhenPushed = NO;
    return nav;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
