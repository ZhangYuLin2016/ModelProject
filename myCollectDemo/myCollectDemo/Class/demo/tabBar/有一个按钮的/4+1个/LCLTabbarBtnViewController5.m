//
//  LCLTabbarBtnViewController5.m
//  ModularDemo
//
//  Created by 张玉琳 on 2018/3/2.
//  Copyright © 2018年 hbweipai. All rights reserved.
//

#import "LCLTabbarBtnViewController5.h"
#import "LCLMyTabBar.h"
#import "LCLDemoViewController.h"

@interface LCLTabbarBtnViewController5 ()<LCLMyTabBarDelegate>

@end

@implementation LCLTabbarBtnViewController5

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    //默认没有选中的tabbar的字体颜色是黑色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kBlackColor,NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    //默认选中的tabbar的字体颜色是红色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kRedColor,NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
    //创建自己的tabbar，然后用kvc将自己的tabbar和系统的tabBar替换下
    LCLMyTabBar *tabbar = [[LCLMyTabBar alloc] init];
    tabbar.mycount = 5;
    tabbar.myDelegate = self;
    //kvc实质是修改了系统的_tabBar
    [self setValue:tabbar forKeyPath:@"tabBar"];

    [self tabBarView];
    
}
- (void)tabBarView{
    
    NSArray *titles = @[@"首页",@"我的",@"首页",@"我的"];
    NSArray *normalImages = @[@"tabno", @"tabno",@"tabno", @"tabno"];
    NSArray *selectImages = @[@"tabse",@"tabse",@"tabse",@"tabse"];
    self.viewControllers = @[
                             [LCLDemoViewController new],
                             [LCLDemoViewController new],
                             [LCLDemoViewController new],
                             [LCLDemoViewController new]
                             ];
    
    for (int i = 0; i < titles.count; i++) {
        UIViewController *vc = self.viewControllers[i];
        UIImage *normalImage = [[UIImage imageNamed:normalImages[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *selectImage = [[UIImage imageNamed:selectImages[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:titles[i] image:normalImage selectedImage:selectImage];
    }
    
    
    
    //设置TabBar的颜色
    [self.tabBar setBarTintColor:kWhiteColor];
    
    
}
- (void)tabBarPlusBtnClick:(LCLMyTabBar *)tabBar{
    
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:[[LCLDemoViewController alloc] init]] animated:YES completion:nil];
    
}


@end



