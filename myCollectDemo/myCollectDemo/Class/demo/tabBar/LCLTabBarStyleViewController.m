//
//  LCLTabBarStyleViewController.m
//  ModularDemo
//
//  Created by 张玉琳 on 2018/3/1.
//  Copyright © 2018年 hbweipai. All rights reserved.
//

#import "LCLTabBarStyleViewController.h"

#import "LCLSidewaysViewController.h"

#import "LCLTabbarViewController2.h"
#import "LCLTabbarViewController3.h"
#import "LCLTabBArViewController4.h"
#import "LCLTabBarViewController5.h"

#import "LCLTabBarBtnViewController3.h"
#import "LCLTabbarBtnViewController5.h"

@interface LCLTabBarStyleViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView * _tableView;
    NSArray * _dataSource;
    NSArray * _titles;
}

@end

@implementation LCLTabBarStyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 创建视图
    [self initView];
    
    // 加载数据
    [self loadNewData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [ZYLTools globalSetting:self isNavigationBarHidden:NO backgroundColor:kGlobalColor title:@"tabBarStyle"];
}

#pragma mark - 创建视图
- (void)initView {
    UITableView * tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    _tableView = tableView;
}

#pragma mark - 加载数据
- (void)loadNewData {
    _titles = @[
                
                /**
                 
                 */
                @"侧滑",
                
                /**
                 普通的tabbar，只需要把对应的.h  .m文件拉进自己的项目里面去，然后把LCLDemeVC修改成自己的VC，tanbar的title和image修改成自己要修改的内容
                 */
                @"普通的2个tabbar",
                @"普通的3个tabbar",
                @"普通的4个tabbar",
                @"普通的5个tabbar",
                
                /**
                 
                 */
                @"2+1个按钮",
                @"4+1个按钮",
                @"向上滑动_tabbar隐藏"];
    
    _dataSource = @[[LCLSidewaysViewController class],
                    
                    [LCLTabbarViewController2 class],
                    [LCLTabbarViewController3 class],
                    [LCLTabBArViewController4 class],
                    [LCLTabBarViewController5 class],

                    [LCLTabBarBtnViewController3 class],
                    [LCLTabbarBtnViewController5 class],
                    [LCLTabbarBtnViewController5 class]

                    ];

}

#pragma mark - UITableViewDataSource UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView * v = [UIView new];
    v.frame = CGRectMake(0, 0, kScreenWidth, 0.01);
    v.backgroundColor = [UIColor groupTableViewBackgroundColor];
    return v;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView * v = [UIView new];
    v.frame = CGRectMake(0, 0, kScreenWidth, 0.01);
    v.backgroundColor = [UIColor groupTableViewBackgroundColor];
    return v;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titles.count;
}

#pragma warning

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = _titles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Class class = _dataSource[indexPath.row];
    [self.navigationController pushViewController:[class new] animated:YES];

}


@end
