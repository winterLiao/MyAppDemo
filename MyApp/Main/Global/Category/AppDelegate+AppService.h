//
//  AppDelegate+AppService.h
//  MyApp
//
//  Created by liaowentao on 17/3/29.
//  Copyright © 2017年 Haochuang. All rights reserved.
//  Appservice

#import "AppDelegate.h"

@interface AppDelegate (AppService)
- (void)registerBugly;

/**
 *  系统配置
 */
- (void)systemConfigration;

/**
 *  友盟注册
 */
- (void)registerUmeng;
/**
 *  个推注册
 */

- (void)registerGeiTui;

/**
 *  检查更新
 */
- (void)checkAppUpDataWithshowOption:(BOOL)showOption;

/**
 *  获取用户信息
 */
- (void)getUserData;

@end
