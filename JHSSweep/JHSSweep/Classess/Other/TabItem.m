//
//  TabItem.m
//  黑马微信
//
//  Created by HM09 on 17/1/19.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "TabItem.h"

@implementation TabItem

// 字典转模型
+(instancetype)tabItemWithDic:(NSDictionary *)dic{
    TabItem *tabItem = [[TabItem alloc] init];
    // 把字典的key和value转化成模型的属性和属性的值
    [tabItem setValuesForKeysWithDictionary:dic];
    return tabItem;
}

@end
