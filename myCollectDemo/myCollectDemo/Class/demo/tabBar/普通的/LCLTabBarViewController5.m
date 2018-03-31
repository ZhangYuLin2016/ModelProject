//
//  LCLTabBarViewController5.m
//  ModularDemo
//
//  Created by 张玉琳 on 2018/3/1.
//  Copyright © 2018年 hbweipai. All rights reserved.
//

#import "LCLTabBarViewController5.h"
#import "LCLDemoViewController.h"

@interface LCLTabBarViewController5 ()

@end

@implementation LCLTabBarViewController5

- (void)viewDidLoad {
    [super viewDidLoad];
  
    //默认没有选中的tabbar的字体颜色是黑色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kBlackColor,NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    //默认选中的tabbar的字体颜色是红色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kRedColor,NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
    [self customTabbarItem];
    
}

-(void)customTabbarItem{
    NSArray *titles = @[@"首页",@"分类",@"购物车",@"发布",@"我的"];
    NSArray *normalImages = @[@"tabno", @"tabno",@"tabno", @"tabno", @"tabno"];
    NSArray *selectImages = @[@"tabse",@"tabse",@"tabse",@"tabse",@"tabse"];
    self.viewControllers = @[
                             [LCLDemoViewController new],
                             [LCLDemoViewController new],
                             [LCLDemoViewController new],
                             [LCLDemoViewController new],
                             [LCLDemoViewController new]];
    
    
    for (int i = 0; i < titles.count; i++) {
        UIViewController *vc = self.viewControllers[i];
        UIImage *normalImage = [[UIImage imageNamed:normalImages[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *selectImage = [[UIImage imageNamed:selectImages[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:titles[i] image:normalImage selectedImage:selectImage];
    }
    
    
    
    //设置TabBar的颜色
    [self.tabBar setBarTintColor:kWhiteColor];
}


- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    UIViewController *tbselect=tabBarController.selectedViewController;
    if([tbselect isEqual:viewController]){
        return NO;
    }
    return YES;
}

@end
