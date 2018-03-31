//
//  ZYLYanZhengMaViewController.m
//  myCollectDemo
//
//  Created by 张玉琳 on 2018/3/21.
//  Copyright © 2018年 zyl. All rights reserved.
//

#import "ZYLYanZhengMaViewController.h"
#import "ZYLTxtVCodeView.h"

@interface ZYLYanZhengMaViewController ()
@property (nonatomic, strong) ZYLTxtVCodeView *tv;

@property (nonatomic, strong) UILabel *label;
@end

@implementation ZYLYanZhengMaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kWhiteColor;
    //发送验证码-倒计时验证
    
    //滑动图片到指定位置验证
    
    //生成随机汉字-按顺序点击验证
    [self txtVcode];

}
- (void)txtVcode{
    
    self.tv = [[ZYLTxtVCodeView alloc] initWithFrame:CGRectMake(30, 100, 200, 50)];
    self.tv.lineNum = 100;
    // 如果 设置 textNum 和 textTotal 属性 请执行 change 方法
    self.tv.textNum = 4;
    self.tv.textTotal = 6;
    self.tv.viewColor = [UIColor redColor];
    [self.view addSubview:self.tv];
    [self.tv change];
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(30, 150, 200, 30)];
    
    [self.view addSubview:self.label];
    
    self.label.adjustsFontSizeToFitWidth = YES;
    
    self.label.text = [NSString stringWithFormat:@"按 %@ 顺序点击",self.tv.textString];
    
    __weak typeof(self) weakSelf = self;
    
    self.tv.successBlock = ^(BOOL is) {
        if (is) {
            weakSelf.label.text = @"验证成功";
        }else{
            weakSelf.label.text = @"验证失败";
        }
        
    };
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(30, 340, 100, 30)];
    [button setTitle:@"刷新" forState:UIControlStateNormal];
    [self.view addSubview:button];
    button.backgroundColor = [UIColor darkGrayColor];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)buttonClick{
    
    [self.tv change];
    
    self.label.text = [NSString stringWithFormat:@"按 %@ 顺序点击",self.tv.textString];
    
}

@end
