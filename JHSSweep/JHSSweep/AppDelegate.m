//
//  AppDelegate.m
//  JHSSweep
//
//  Created by YanYaxing on 2017/3/22.
//  Copyright © 2017年 YanYaxing. All rights reserved.
//

#import "AppDelegate.h"
#import "TabItem.h"
#import "ICSDrawerController.h"
#import "JHSLeftBarViewController.h"
#import "JHSTabBarController.h"

@interface AppDelegate ()


@end

@implementation AppDelegate

//程序第一次完成启动
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 获取plist文件的路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"TabItem.plist" ofType:nil];
    // 从plist文件字典数组
    NSArray<NSDictionary *> *tabItemDics = [NSArray arrayWithContentsOfFile:path];
    // 保存模型数组
    NSMutableArray *tabItems = [NSMutableArray arrayWithCapacity:tabItemDics.count];
    
    // 保存标签控制器的子控制器
    NSMutableArray *viewControllers = [NSMutableArray arrayWithCapacity:tabItems.count];
    
    // 创建子控制器,并设置子控制器的相关属性
    [tabItemDics enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull dic, NSUInteger idx, BOOL * _Nonnull stop) {
        
        // 字典转换为模型
        TabItem *tabItem = [TabItem tabItemWithDic:dic];
        [tabItems addObject:tabItem];
        Class rootCls = NSClassFromString(tabItem.rootController);
        UIViewController *rootController = [[rootCls alloc] init];
        rootController.title = tabItem.title;
        // 根据类名创建类
        Class navCls = NSClassFromString(tabItem.navController);
        UINavigationController *navController = [[navCls alloc] initWithRootViewController:rootController];
        //设置属性
        navController.tabBarItem.image = [[UIImage imageNamed:tabItem.image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        navController.tabBarItem.selectedImage = [[UIImage imageNamed:tabItem.selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        navController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
        navController.navigationBar.translucent = NO;
        navController.navigationBar.barTintColor=[UIColor colorWithRed:78 / 255.0 green:194 / 255.0 blue:156 / 255.0 alpha:1.0];
        navController.navigationBar.shadowImage = [[UIImage alloc]init];
        [navController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
        navController.tabBarItem.title = tabItem.title;
        [viewControllers addObject:navController];
    }];
    
    // 创建标签控制器
    JHSTabBarController *tabBarJHSController = [[JHSTabBarController alloc] init];
    tabBarJHSController.viewControllers = viewControllers;
    //设置选中的标签项的字体颜色
    tabBarJHSController.tabBar.tintColor=[UIColor colorWithRed:78 / 255.0 green:194 / 255.0 blue:156 / 255.0 alpha:1.0];
    JHSLeftBarViewController *leftController =[[JHSLeftBarViewController alloc]init];
    ICSDrawerController *drawerController =[[ICSDrawerController alloc]initWithLeftViewController:leftController centerViewController:tabBarJHSController];
    
    // 创建window,并显示
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.rootViewController = drawerController;
    [_window makeKeyAndVisible];
    
    
    return YES;
}







@end
