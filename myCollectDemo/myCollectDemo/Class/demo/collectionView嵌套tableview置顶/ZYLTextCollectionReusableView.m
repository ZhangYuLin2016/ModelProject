//
//  ZYLTextCollectionReusableView.m
//  myCollectDemo
//
//  Created by 张玉琳 on 2018/3/20.
//  Copyright © 2018年 zyl. All rights reserved.
//

#import "ZYLTextCollectionReusableView.h"

@implementation ZYLTextCollectionReusableView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:self.bounds];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
    }
    return self;
}

- (void)setText:(NSString *)text{
    _text = text;
    
    ((UILabel *)self.subviews[0]).text = text;
}
@end
