//
//  ViewController.m
//  shadowNavgationBar
//
//  Created by shengxinwei on 16/7/24.
//  Copyright © 2016年 shengxinwei. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationBar+XWShadowNavBar.h"

@interface ViewController ()
@property (nonatomic,strong) UIColor *color;

@end

static NSString *cellID = @"cellID";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];

    [self.navigationController.navigationBar changeNavgationBarAlphaWithColor:[self.color colorWithAlphaComponent:0]];
    
    UIEdgeInsets contentInset =  self.tableView.contentInset;
    contentInset.top = -64;
    self.tableView.contentInset = contentInset;

}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = @"i is cell";
    return cell;
}

#pragma mark - 代理方法

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat scrollY = scrollView.contentOffset.y;

    //获取透明度比例
    CGFloat scale =  (scrollY) / 64 ;

    if (scrollY > 0) {
        [self.navigationController.navigationBar changeNavgationBarAlphaWithColor:[self.color colorWithAlphaComponent:scale]];
    }else if(scrollY == 0) {
        [self.navigationController.navigationBar changeNavgationBarAlphaWithColor:[self.color colorWithAlphaComponent:0]];
    }
}


#pragma mark - 懒加载
- (UIColor *)color {
    if (_color == nil) {
        _color = [UIColor redColor];
    }
    return _color;
}

@end
