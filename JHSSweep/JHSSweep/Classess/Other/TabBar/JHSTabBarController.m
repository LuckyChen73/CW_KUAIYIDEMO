//
//  JHSTabBarController.m
//  JHSSweep
//
//  Created by YanYaxing on 2017/3/23.
//  Copyright © 2017年 JHDS. All rights reserved.
//

#import "JHSTabBarController.h"

@interface JHSTabBarController ()

@end

@implementation JHSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark - ICSDrawerController方法实现
-(void)leftItemClick{
    [self.drawer open];
}
- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}



@end
