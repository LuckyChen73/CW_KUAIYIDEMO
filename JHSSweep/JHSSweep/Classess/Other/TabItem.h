//
//  TabItem.h
//
//  Created by HM09 on 17/1/19.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TabItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *selectedImage;
@property (nonatomic, copy) NSString *navController;
@property (nonatomic, copy) NSString *rootController;


+(instancetype)tabItemWithDic:(NSDictionary *)dic;

@end
