//
//  ZYLTools.m
//  myCollectDemo
//
//  Created by 张玉琳 on 2018/3/19.
//  Copyright © 2018年 zyl. All rights reserved.
//

#import "ZYLTools.h"
#import <UIKit/UIKit.h>
#pragma mark - 字典输出
@implementation NSDictionary (Log)

//- (NSString *)description{
//    
//    return [super description];
//}

- (NSString *)descriptionWithLocale:(NSString *)locale
{
    NSMutableString *string = [NSMutableString string];
    
    // 开头有个{
    [string appendString:@"{\n"];
    
    // 遍历所有的键值对
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [string appendFormat:@"\t%@", key];
        [string appendString:@" : "];
        [string appendFormat:@"%@,\n", obj];
    }];
    
    // 结尾有个}
    [string appendString:@"}"];
    
    // 查找最后一个逗号
    NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
    if (range.location != NSNotFound)
        [string deleteCharactersInRange:range];
    
    return string;
}
@end
@implementation NSArray (Log)
- (NSString *)descriptionWithLocale:(NSString *)locale
{
    NSMutableString *string = [NSMutableString string];
    
    // 开头有个[
    [string appendString:@"[\n"];
    
    // 遍历所有的元素
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [string appendFormat:@"\t%@,\n", obj];
    }];
    
    // 结尾有个]
    [string appendString:@"]"];
    
    // 查找最后一个逗号
    NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
    if (range.location != NSNotFound)
        [string deleteCharactersInRange:range];
    
    return string;
}
@end

@implementation ZYLTools

// 颜色转换：iOS中（以#开头）十六进制的颜色转换为UIColor(RGB)
+ (UIColor *)colorWithHexString:(NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}


#pragma mark - 移除该视图的所有子视图

// 将JSON串转化为字典或者数组
+ (id)toArrayOrNSDictionary:(NSString *)jsonStr {
    NSData * jsonData = [jsonStr dataUsingEncoding:NSASCIIStringEncoding];
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData
                                                    options:NSJSONReadingAllowFragments
                                                      error:&error];
    
    if (jsonObject != nil && error == nil) {
        return jsonObject;
    }else{
        // 解析错误
        return nil;
    }
}

#pragma mark - 隐藏导航栏, 设置背景为白色, 设置返回按钮标题为空
+ (void)globalSetting:(UIViewController *)vc
isNavigationBarHidden:(BOOL)yesOrNo
      backgroundColor:(UIColor *)color
                title:(NSString *)title {
    // 隐藏导航栏
    vc.navigationController.navigationBarHidden = yesOrNo;
    
    // 设置控制器视图的背景色
    vc.view.backgroundColor = color;
    
    // 设置标题
    vc.title = title;
    
    // 返回按钮
    UIBarButtonItem * backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"";
    vc.navigationItem.backBarButtonItem = backItem;
}

#pragma mark - 文字分散对齐
+ (void)labelAlightLeftAndRight:(UILabel *)label
{
    [self labelAlightLeftAndRightWithWidth:label];
}

+ (void)labelAlightLeftAndRightWithWidth:(UILabel *)label
{
    //自适应高度
    CGSize textSize = [label.text boundingRectWithSize:CGSizeMake(label.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine| NSStringDrawingUsesFontLeading  attributes:@{NSFontAttributeName :label.font} context:nil].size;
    CGFloat margin = (label.frame.size.width - textSize.width)/(label.text.length - 1);
    NSNumber *number = [NSNumber numberWithFloat:margin];
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:label.text];
    
    //字间距 :NSKernAttributeName
    [attribute addAttribute:NSKernAttributeName value:number range:NSMakeRange(0, label.text.length - 1)];
    label.attributedText = attribute;
}

#pragma makr - 颜色渐变
+ (void)gradualBackgroundColor:(UIView *)targetView {
    
    //初始化CAGradientlayer对象，使它的大小为UIView的大小
    CAGradientLayer * gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = targetView.bounds;
    
    //将CAGradientlayer对象添加在我们要设置背景色的视图的layer层
    [targetView.layer insertSublayer:gradientLayer atIndex:1];
    
    //设置渐变区域的起始和终止位置（范围为0-1）
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    
    //设置颜色数组
    gradientLayer.colors = @[(__bridge id)kColor(0xD00014).CGColor,
                             (__bridge id)kColor(0x900500).CGColor];
    
    //设置颜色分割点（范围：0-1）
    gradientLayer.locations = @[@(0.0f), @(1.0f)];
}

+ (void)gradualBackgroundColorLeftAndRight:(UIView *)targetView firstColor:(UIColor *)firstColor secondColor:(UIColor *)secondColor {
    
    //初始化CAGradientlayer对象，使它的大小为UIView的大小
    CAGradientLayer * gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = targetView.bounds;
    
    //将CAGradientlayer对象添加在我们要设置背景色的视图的layer层
    [targetView.layer insertSublayer:gradientLayer atIndex:0];
    
    //设置渐变区域的起始和终止位置（范围为0-1）
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    
    //设置颜色数组
    gradientLayer.colors = @[(__bridge id)firstColor.CGColor,
                             (__bridge id)secondColor.CGColor];
    
    //设置颜色分割点（范围：0-1）
    gradientLayer.locations = @[@(0.0f), @(1.0f)];
}


#pragma mark - 弹窗提示
+ (void)showAlert:(NSString *)msg target:(UIViewController *)target {
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:msg preferredStyle:UIAlertControllerStyleAlert];
    [target presentViewController:alert animated:YES completion:nil];
    [alert addAction:[UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil]];
}

#pragma mark - 弹窗提示并返回根控制器
+ (void)showAlertAndPopToRoot:(NSString *)msg target:(UIViewController *)target {
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:msg preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [target.navigationController popToRootViewControllerAnimated:YES];
        });
    }]];
    [target presentViewController:alert animated:YES completion:nil];
}

#pragma mark - 弹窗提示并返回上级控制器
+ (void)showAlertAndPop:(NSString *)msg target:(UIViewController *)target {
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:msg preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [target.navigationController popViewControllerAnimated:YES];
        });
    }]];
    [target presentViewController:alert animated:YES completion:nil];
}

#pragma mark - 时间转换
+ (NSString *)dateConvert:(NSString *)dateadd
{
    NSDate * date = [NSDate date];
    int timeInterval = [date timeIntervalSince1970];
    int dateAdd = [dateadd intValue];
    int differ = timeInterval - dateAdd;
    NSString * dateString = nil;
    
    if (differ > 0 && differ < 60)
    {
        dateString = @"刚刚";
    }
    else if (differ >= 60 && differ < 3600)
    {
        dateString = [NSString stringWithFormat:@"%d分钟前", differ/60];
    }
    else if (differ >= 3600 && differ < 3600*24)
    {
        dateString = [NSString stringWithFormat:@"%d小时前", differ/3600];
    }
    else if(differ >= 3600*24 && differ < 3600*48)
    {
        dateString = @"昨天";
    }
    else
    {
        NSDate * date = [NSDate dateWithTimeIntervalSince1970:[dateadd doubleValue]];
        NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        dateString = [formatter stringFromDate:date];
    }
    return dateString;
}

#pragma mark - 获取path路径下文件夹大小
+ (NSString *)getCacheSizeWithFilePath:(NSString *)path{
    
    // 获取“path”文件夹下的所有文件
    NSArray *subPathArr = [[NSFileManager defaultManager] subpathsAtPath:path];
    
    NSString *filePath  = nil;
    NSInteger totleSize = 0;
    
    for (NSString *subPath in subPathArr){
        
        // 1. 拼接每一个文件的全路径
        filePath =[path stringByAppendingPathComponent:subPath];
        // 2. 是否是文件夹，默认不是
        BOOL isDirectory = NO;
        // 3. 判断文件是否存在
        BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDirectory];
        
        // 4. 以上判断目的是忽略不需要计算的文件
        if (!isExist || isDirectory || [filePath containsString:@".DS"]){
            // 过滤: 1. 文件夹不存在  2. 过滤文件夹  3. 隐藏文件
            continue;
        }
        
        // 5. 指定路径，获取这个路径的属性
        NSDictionary *dict = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
        /**
         attributesOfItemAtPath: 文件夹路径
         该方法只能获取文件的属性, 无法获取文件夹属性, 所以也是需要遍历文件夹的每一个文件的原因
         */
        
        // 6. 获取每一个文件的大小
        NSInteger size = [dict[@"NSFileSize"] integerValue];
        
        // 7. 计算总大小
        totleSize += size;
    }
    
    //8. 将文件夹大小转换为 M/KB/B
    NSString *totleStr = nil;
    
    if (totleSize > 1000 * 1000){
        totleStr = [NSString stringWithFormat:@"%.2fM",totleSize / 1000.00f /1000.00f];
        
    }else if (totleSize > 1000){
        totleStr = [NSString stringWithFormat:@"%.2fKB",totleSize / 1000.00f ];
        
    }else{
        totleStr = [NSString stringWithFormat:@"%.2fB",totleSize / 1.00f];
    }
    
    return totleStr;
}


#pragma mark - 清除path文件夹下缓存大小
+ (BOOL)clearCacheWithFilePath:(NSString *)path{
    
    //拿到path路径的下一级目录的子文件夹
    NSArray *subPathArr = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
    
    NSString *filePath = nil;
    
    NSError *error = nil;
    
    for (NSString *subPath in subPathArr)
    {
        filePath = [path stringByAppendingPathComponent:subPath];
        
        //删除子文件夹
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:&error];
        if (error) {
            return NO;
        }
    }
    return YES;
}

@end

