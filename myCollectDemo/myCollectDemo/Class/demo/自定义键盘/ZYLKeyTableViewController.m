//
//  ZYLKeyTableViewController.m
//  myCollectDemo
//
//  Created by 张玉琳 on 2018/3/21.
//  Copyright © 2018年 zyl. All rights reserved.
//

#import "ZYLKeyTableViewController.h"
#import "ZYLKeyStyleOne.h"

@interface ZYLKeyTableViewController ()
@property (nonatomic, strong) NSArray *arr;
@end

@implementation ZYLKeyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _arr = @[@"车牌号类型的键盘"];
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;
}

//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"keycell"];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"keycell"];
    }
    if (indexPath.row == 0) {
        [self tableViewCell:cell];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - cell subView
- (void)tableViewCell:(UITableViewCell *)cell{
    ZYLKeyStyleOne *keyboard = [[ZYLKeyStyleOne alloc]initWithFrame:CGRectMake(0, 0, 375, 240)];
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 0, kScreenWidth-40, CGRectGetHeight(cell.frame))];
    textField.placeholder = @"请输入车牌号";
    textField.inputView = keyboard;
    [cell addSubview:textField];
}
@end
