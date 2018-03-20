//
//  LCLMyTabBar.h
//  ModularDemo
//
//  Created by 张玉琳 on 2018/3/2.
//  Copyright © 2018年 hbweipai. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIView (LCLextension)
@property (nonatomic, assign)CGFloat x;
@property (nonatomic, assign)CGFloat y;
@property (nonatomic, assign)CGFloat width;
@property (nonatomic, assign)CGFloat height;
@property (nonatomic, assign)CGFloat centerX;
@property (nonatomic, assign)CGFloat centerY;
@property (nonatomic, assign)CGSize size;
@property(nonatomic, assign) IBInspectable CGFloat borderWidth;
@property(nonatomic, assign) IBInspectable UIColor *borderColor;
@property(nonatomic, assign) IBInspectable CGFloat cornerRadius;

/**
 *  水平居中
 */
- (void)alignHorizontal;
/**
 *  垂直居中
 */
- (void)alignVertical;
/**
 *  判断是否显示在主窗口上面
 *
 *  @return 是否
 */
- (BOOL)isShowOnWindow;

- (UIViewController *)parentController;
@end


@class LCLMyTabBar;
@protocol LCLMyTabBarDelegate <NSObject>

- (void)tabBarPlusBtnClick:(LCLMyTabBar *)tabBar;

@end

@interface LCLMyTabBar : UITabBar
@property (nonatomic, assign) NSInteger mycount;
@property (nonatomic,weak) id<LCLMyTabBarDelegate> myDelegate;

@end
