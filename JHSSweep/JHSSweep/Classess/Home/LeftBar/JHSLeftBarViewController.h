//
//  JHSLeftBarViewController.h
//  JHSSweep
//
//  Created by YanYaxing on 2017/3/23.
//  Copyright © 2017年 JHDS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICSDrawerController.h"


@interface JHSLeftBarViewController : UIViewController<ICSDrawerControllerChild,ICSDrawerControllerPresenting>
@property(nonatomic, weak) ICSDrawerController *drawer;


@end
