//
//  ZYLTools.h
//  myCollectDemo
//
//  Created by 张玉琳 on 2018/3/19.
//  Copyright © 2018年 zyl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZYLTools : NSObject
/**
 *  获取path路径下文件夹的大小
 *
 *  @param path 要获取的文件夹 路径
 *
 *  @return 返回path路径下文件夹的大小
 */
+ (NSString *)getCacheSizeWithFilePath:(NSString *)path;
/**
 *  清除path路径下文件夹的缓存
 *
 *  @param path  要清除缓存的文件夹 路径
 *
 *  @return 是否清除成功
 */
+ (BOOL)clearCacheWithFilePath:(NSString *)path;

// 将JSON串转化为字典或者数组
+ (id)toArrayOrNSDictionary:(NSString *)jsonStr;

// 隐藏导航栏, 设置背景为白色, 设置返回按钮标题为空
+ (void)globalSetting:(UIViewController *)vc
isNavigationBarHidden:(BOOL)yesOrNo
      backgroundColor:(UIColor *)color
                title:(NSString *)title;

// 文字分散对齐
+ (void)labelAlightLeftAndRight:(UILabel *)label;

// 背景颜色渐变
+ (void)gradualBackgroundColor:(UIView *)targetView;
+ (void)gradualBackgroundColorLeftAndRight:(UIView *)targetView firstColor:(UIColor *)firstColor secondColor:(UIColor *)secondColor;

// 弹窗提示
+ (void)showAlert:(NSString *)msg target:(UIViewController *)target;
+ (void)showAlertAndPop:(NSString *)msg target:(UIViewController *)target;
+ (void)showAlertAndPopToRoot:(NSString *)msg target:(UIViewController *)target;

// 时间转换
+ (NSString *)dateConvert:(NSString *)dateadd;

// 16进制颜色
+ (UIColor *)colorWithHexString:(NSString *)color;

@end
