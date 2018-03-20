//
//  LCLDemoViewController.m
//  ModularDemo
//
//  Created by 张玉琳 on 2018/3/1.
//  Copyright © 2018年 hbweipai. All rights reserved.
//

#import "LCLDemoViewController.h"

@interface LCLDemoViewController ()

@end

@implementation LCLDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [self randomColor];
}

- (UIColor *)randomColor{
    CGFloat r = arc4random_uniform(256);
    CGFloat g = arc4random_uniform(256);
    CGFloat b = arc4random_uniform(256);
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
