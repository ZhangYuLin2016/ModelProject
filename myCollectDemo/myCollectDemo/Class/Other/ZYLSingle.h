//
//  ZYLSingle.h
//  myCollectDemo
//
//  Created by 张玉琳 on 2018/3/19.
//  Copyright © 2018年 zyl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZYLSingle : NSObject
@property (nonatomic, strong) UIColor * globalColor;
+ (instancetype)shareInstance;

@end
