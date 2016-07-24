//
//  UINavigationBar+XWShadowNavBar.m
//  shadowNavgationBar
//
//  Created by shengxinwei on 16/7/24.
//  Copyright © 2016年 shengxinwei. All rights reserved.
//


#import "UINavigationBar+XWShadowNavBar.h"
#import <objc/runtime.h>

const void* aView;

@implementation UINavigationBar (XWShadowNavBar)

- (void)setAlphaView:(UIView *)alphaView {
    objc_setAssociatedObject(self, aView, alphaView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)alphaView {
    return objc_getAssociatedObject(self, aView);
}

- (void)changeNavgationBarAlphaWithColor:(UIColor *)color {
    if (self.alphaView == nil) {
        
        //实例一个image对象
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        
        //创建透明度view
        self.alphaView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, 64)];
        //设置层级结构
        [self insertSubview:self.alphaView atIndex:0];
    }
    
    self.alphaView.backgroundColor = color;
    
    
    
}

@end
