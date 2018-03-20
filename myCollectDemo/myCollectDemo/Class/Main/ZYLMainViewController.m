//
//  ZYLMainViewController.m
//  myCollectDemo
//
//  Created by 张玉琳 on 2018/3/19.
//  Copyright © 2018年 zyl. All rights reserved.
//

#import "ZYLMainViewController.h"
#import "ZYLCTViewController.h"
#import "ZYLTCViewController.h"

#import "LCLTabBarStyleViewController.h"

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
    _titleArr = @[@"tableview嵌套collectionView置顶",@"collectionView嵌套tableview置顶",@"tabbar style"];

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
    }
    
}
@end
