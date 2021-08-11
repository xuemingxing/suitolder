//
//  OneViewController.m
//  OneViewController
//
//  Created by mac  on 2021/8/6.
//

#import "OneViewController.h"
#import "AppConfiguration.h"


@interface CustomCell : UITableViewCell

@property(nonatomic, strong) UILabel *label;

@end

@implementation CustomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.label];
        self.label.frame = CGRectMake(50, 10, 300, 30);
    }
    return  self;
}

- (UILabel *)label {
    if (!_label) {
        UILabel * label = [[UILabel alloc] init];
        label.font = [AppConfiguration sharedConfiguration].appOldMode ? [UIFont boldSystemFontOfSize:30] : [UIFont systemFontOfSize:15];
        label.text = @"测试的字体_table";
        _label = label;
    }
    return _label;
}

@end

@interface OneViewController () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@end

@implementation OneViewController

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[CustomCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    
    
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.bounds;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [AppConfiguration sharedConfiguration].appOldMode ? 80 : 40;
}


@end







