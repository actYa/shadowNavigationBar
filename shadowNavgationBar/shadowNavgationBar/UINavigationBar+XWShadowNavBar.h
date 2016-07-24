//
//  UINavigationBar+XWShadowNavBar.h
//  shadowNavgationBar
//
//  Created by shengxinwei on 16/7/24.
//  Copyright © 2016年 shengxinwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (XWShadowNavBar)

//自定义改变透明度的view
@property (nonatomic,strong) UIView *alphaView;

//通过颜色改变透明度
- (void)changeNavgationBarAlphaWithColor: (UIColor *)color;

@end
