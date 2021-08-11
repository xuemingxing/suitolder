//
//  SuitOlderSettingViewController.m
//  SuitOlderSettingViewController
//
//  Created by mac  on 2021/8/2.
//

#import "SuitOlderSettingViewController.h"
#import "AppConfiguration.h"
#import "UIViewController+SwitchAppMode.h"

@interface SuitOlderSettingViewController ()

@property(nonatomic, strong) UILabel *label2;
@property(nonatomic, strong) UILabel *label3;

@end

@implementation SuitOlderSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
        
    UILabel * label1 = [[UILabel alloc] init];
    label1.font = [AppConfiguration sharedConfiguration].appOldMode ? [UIFont boldSystemFontOfSize:30] : [UIFont systemFontOfSize:15];
    label1.text = @"测试的字体_1";
    [self.view addSubview:label1];
    label1.frame = CGRectMake(50, 100, 200, 40);
    
    [self.view addSubview:self.label2];
    self.label2.frame = CGRectMake(50, 150, 200, 40);
    
    [self.view addSubview:self.label3];
    self.label3.frame = CGRectMake(50, 200, 200, 40);
    
    UIButton *old = [UIButton buttonWithType:UIButtonTypeCustom];
    [old setTitle:@"older" forState:UIControlStateNormal];
    [old setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [old addTarget:self action:@selector(older) forControlEvents:UIControlEventTouchUpInside];
    old.frame = CGRectMake(50, 300, 100, 40);
    [self.view addSubview:old];
    
    UIButton *normal = [UIButton buttonWithType:UIButtonTypeCustom];
    [normal setTitle:@"normal" forState:UIControlStateNormal];
    [normal setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [normal addTarget:self action:@selector(normal) forControlEvents:UIControlEventTouchUpInside];
    normal.frame = CGRectMake(50, 350, 100, 40);
    [self.view addSubview:normal];
    
}
- (void)older {
    [AppConfiguration sharedConfiguration].appOldMode = YES;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ViewControllerShouldReloadNotification" object:nil userInfo:nil];
}

- (void)normal {
    [AppConfiguration sharedConfiguration].appOldMode = NO;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ViewControllerShouldReloadNotification" object:nil userInfo:nil];
}

- (UILabel *)label2 {
    if (!_label2) {
        UILabel * label = [[UILabel alloc] init];
        label.font = [AppConfiguration sharedConfiguration].appOldMode ? [UIFont boldSystemFontOfSize:30] : [UIFont systemFontOfSize:15];
        label.text = @"测试的字体_2";
        _label2 = label;
    }
    return _label2;
}

- (UILabel *)label3 {
    if (!_label3) {
        UILabel * label = [[UILabel alloc] init];
        label.font = [AppConfiguration sharedConfiguration].appOldMode ? [UIFont boldSystemFontOfSize:30] : [UIFont systemFontOfSize:15];
        label.text = @"测试的字体_3";
        _label3 = label;
    }
    return _label3;
}


- (NSArray *)excludeSubviews {
    return @[@"label3"];
}
@end
