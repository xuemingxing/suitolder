//
//  InnerViewController.m
//  InnerViewController
//
//  Created by mac  on 2021/8/6.
//

#import "InnerViewController.h"
#import "AppConfiguration.h"

@interface InnerViewController ()

@end

@implementation InnerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel * label = [[UILabel alloc] init];
    label.font = [AppConfiguration sharedConfiguration].appOldMode ? [UIFont boldSystemFontOfSize:30] : [UIFont systemFontOfSize:15];
    label.text = @"测试的字体_inner";
    [self.view addSubview:label];
    label.frame = CGRectMake(50, 100, 200, 40);
}




@end
