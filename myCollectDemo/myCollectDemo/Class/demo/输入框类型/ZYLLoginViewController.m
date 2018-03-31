//
//  ZYLLoginViewController.m
//  myCollectDemo
//
//  Created by 张玉琳 on 2018/3/21.
//  Copyright © 2018年 zyl. All rights reserved.
//

#import "ZYLLoginViewController.h"
#import "ZYLAnimTFView.h"

@interface ZYLLoginViewController ()
{
    UITextField *_moneyTF;
}
@property (nonatomic, strong) NSArray *arr;

@end

@implementation ZYLLoginViewController
//登陆style1
- (void)viewDidLoad {
    [super viewDidLoad];

    _arr = @[@"输入框类型style1",@"输入金钱"];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"keycell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"keycell"];
    }
    if (indexPath.row == 0) {
        [self tableViewCell:cell];
    }else if (indexPath.row == 1){
        [self tableViewMoneyCell:cell];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 200;
    }else{
        return 100;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - cell subView
- (void)tableViewCell:(UITableViewCell *)cell{
    ZYLAnimTFView *usernameTF = [[ZYLAnimTFView alloc] initWithFrame:CGRectMake(20, 20, self.view.frame.size.width - 40, 70)];
    [usernameTF setPlaceHolderText:@"请输入用户名"];
    [cell addSubview:usernameTF];
    
    ZYLAnimTFView *passwordTF = [[ZYLAnimTFView alloc] initWithFrame:CGRectMake(20, 110, self.view.frame.size.width - 40, 70)];
    [passwordTF setTipsIcon:[UIImage imageNamed:@"tabsend"]];
    [passwordTF setPlaceHolderIcon:[UIImage imageNamed:@"1"]];
    [passwordTF setPlaceHolderText:@"请输入密码"];
    [passwordTF setInputType:ZYLAnimTextFieldInputTypePassword];
    [cell addSubview:passwordTF];
}

- (void)tableViewMoneyCell:(UITableViewCell *)cell{
    UITextField * tf = [UITextField new];
    tf.frame = CGRectMake(20, 0, kScreenWidth-40, 50);
    tf.textAlignment = NSTextAlignmentCenter;
    tf.placeholder = @"点击输入任务金额";
    tf.font = [UIFont systemFontOfSize:17];
    [cell addSubview:tf];
    tf.backgroundColor = kWhiteColor;
    tf.keyboardType = UIKeyboardTypeDecimalPad;
    _moneyTF = tf;
}

@end
