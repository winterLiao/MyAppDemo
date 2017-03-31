//
//  AppDelegate+ViewController.m
//  MyApp
//
//  Created by liaowentao on 17/3/29.
//  Copyright © 2017年 Haochuang. All rights reserved.
//

#import "AppDelegate+ViewController.h"
#import "RootTabViewController.h"

@implementation AppDelegate (ViewController)

- (void)setAppWindows
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    [self.window makeKeyAndVisible];

}

- (void)setRootViewController
{
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    app.window.rootViewController = [[RootTabViewController alloc] init];

}
@end
