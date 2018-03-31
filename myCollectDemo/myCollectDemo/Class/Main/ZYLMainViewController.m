//
//  ZYLMainViewController.m
//  myCollectDemo
//
//  Created by 张玉琳 on 2018/3/19.
//  Copyright © 2018年 zyl. All rights reserved.
//

#import "ZYLMainViewController.h"
#import "ZYLCTViewController.h"//collectionView嵌套tableview置顶
#import "ZYLTCViewController.h"//tableview嵌套collectionView置顶
#import "LCLTabBarStyleViewController.h"//tabbar style
#import "ZYLKeyTableViewController.h"//键盘类型
#import "ZYLYanZhengMaViewController.h"//验证码系列
#import "ZYLLoginViewController.h"//输入框类型
#import "ZYLQianDaoViewController.h"//签到

@interface ZYLMainViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray *titleArr;
@end

@implementation ZYLMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    _titleArr = @[@"tableview嵌套collectionView置顶",@"collectionView嵌套tableview置顶",@"tabbar style",@"键盘类型",@"验证码系列",@"输入框类型",@"签到"];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell
    =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] init];
    }
    cell.textLabel.text = _titleArr[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row==0) {
        [self.navigationController pushViewController:[ZYLCTViewController new] animated:YES];

    }else if (indexPath.row == 1){
        [self.navigationController pushViewController:[ZYLTCViewController new] animated:YES];
        
    }else if (indexPath.row==2){
        [self.navigationController pushViewController:[LCLTabBarStyleViewController new] animated:YES];
    }else if (indexPath.row == 3){
        [self.navigationController pushViewController:[ZYLKeyTableViewController new] animated:YES];
    }else if (indexPath.row == 4){
        [self.navigationController pushViewController:[ZYLYanZhengMaViewController new] animated:YES];

    }else if (indexPath.row == 5){
        [self.navigationController pushViewController:[ZYLLoginViewController new] animated:YES];
        
    }else if (indexPath.row == 6){
        [self.navigationController pushViewController:[ZYLQianDaoViewController new] animated:YES];
        
    }
    
    
    
}
@end
