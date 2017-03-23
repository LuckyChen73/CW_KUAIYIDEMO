//
//  JHSLeftBarViewController.m
//  JHSSweep
//
//  Created by YanYaxing on 2017/3/23.
//  Copyright © 2017年 JHDS. All rights reserved.
//

#import "JHSLeftBarViewController.h"

@interface JHSLeftBarViewController ()

@end

@implementation JHSLeftBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:116 / 255.0 green:191 / 255.0 blue:159 / 255.0 alpha:1.0]];
    
}

//改变bar的样式
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma mark - ICSDrawerController方法实现
- (void)skipViewController:(UIViewController *)viewController andTitle:(NSString *)title{
    //设置title
    viewController.title = title;
    //通过drawer获取导航条
    UITabBarController *tab = (UITabBarController *)self.drawer.centerViewController;
    UINavigationController *nav = tab.selectedViewController;
    [nav popToRootViewControllerAnimated:NO];
    //关闭抽屉效果
    [self.drawer close];
    [nav pushViewController:viewController animated:NO];
}


@end
