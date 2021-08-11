//
//  CustomTabBarController.m
//  CustomTabBarController
//
//  Created by mac  on 2021/8/6.
//

#import "CustomTabBarController.h"
#import "AppConfiguration.h"

@interface CustomTabBarController ()

@end

@implementation CustomTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)updateTabBar
{
    [self.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull barItem, NSUInteger idx, BOOL * _Nonnull stop) {
        UIColor *color = [AppConfiguration sharedConfiguration].appOldMode ? [UIColor redColor] : [UIColor greenColor];
        UIFont *font = [AppConfiguration sharedConfiguration].appOldMode ? [UIFont boldSystemFontOfSize:20] : [UIFont systemFontOfSize:14];
        [barItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:color, NSForegroundColorAttributeName, font, NSFontAttributeName,nil] forState:UIControlStateNormal];
    }];

    CGFloat h = [AppConfiguration sharedConfiguration].appOldMode ? 120 : 90;
    UITabBar *tabBar = self.tabBar;
    CGRect frame = tabBar.frame;
    tabBar.backgroundImage = nil;
    frame.size.height = h;
    frame.origin.y = self.view.frame.size.height - h;
    tabBar.frame = frame;
}

@end
