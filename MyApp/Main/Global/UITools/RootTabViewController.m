//
//  RootTabViewController.m
//  MyApp
//
//  Created by liaowentao on 17/3/29.
//  Copyright © 2017年 Haochuang. All rights reserved.
//

#import "RootTabViewController.h"
#import "LWTNavigationViewController.h"

# define kTabbarSelectTintColor [UIColor brownColor]
# define kTabbarNormalTintColor [UIColor blackColor]

@interface RootTabViewController ()<UITabBarControllerDelegate>

@end

@implementation RootTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildUI];
    // Do any additional setup after loading the view.
}

/**构建视图*/
- (void)buildUI{
    
    self.tabBar.translucent     = NO;
    self.tabBar.backgroundImage = [CommonMethods createImageWithColor:[UIColor clearColor]];
    self.tabBar.shadowImage     = [CommonMethods createImageWithColor:[UIColor grayColor]];
    
    NSArray * normalItems       = @[@"home_gray",@"circle_gray",@"me"];
    NSArray * selectItmes       = @[@"home_blue",@"circle_blue",@"me_blue"];
    
    NSArray * controllClass     = @[@"HomePageViewController",@"MessageViewController",@"MyViewController"];
    self.delegate               = self;
    NSArray * itemTitles        = @[@"首页",@"信息",@"我"];
    NSMutableArray * controllers = [[NSMutableArray alloc]init];
    for (int i = 0; i < normalItems.count; i++)
    {
        UIViewController * homeview =[[NSClassFromString(controllClass[i]) alloc]init];
        LWTNavigationViewController * navigation =[[LWTNavigationViewController alloc]initWithRootViewController:homeview];
        navigation.tabBarItem.image                     = [[UIImage imageNamed:normalItems[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        navigation.tabBarItem.selectedImage             = [[UIImage imageNamed:selectItmes[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        navigation.tabBarItem.titlePositionAdjustment   = UIOffsetMake(0,-3);
        [controllers addObject:navigation];
        
        // 设置文字的样式
        NSMutableDictionary *textAttrs                  = [NSMutableDictionary dictionary];
        textAttrs[NSForegroundColorAttributeName]       = kTabbarNormalTintColor;
        NSMutableDictionary *selectTextAttrs            = [NSMutableDictionary dictionary];
        selectTextAttrs[NSForegroundColorAttributeName] = kTabbarSelectTintColor;
        [homeview.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
        [homeview.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
        // 设置tabbaritem 的title
        navigation.tabBarItem.title                     = itemTitles[i];
    }
    self.viewControllers = controllers;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
