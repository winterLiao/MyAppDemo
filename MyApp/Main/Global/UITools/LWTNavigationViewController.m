//
//  LWTNavigationViewController.m
//  MyApp
//
//  Created by liaowentao on 17/3/29.
//  Copyright © 2017年 Haochuang. All rights reserved.
//

#import "LWTNavigationViewController.h"

@interface LWTNavigationViewController ()<UINavigationControllerDelegate>

@property (nonatomic, weak) id popDelegate;

@end

@implementation LWTNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.popDelegate = self.interactivePopGestureRecognizer.delegate;
    self.delegate = self;

    //navigationBar样式设置
    self.navigationBar.barTintColor = MAIN_GROUNDCOLOR;
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : WHITCOLOR, NSFontAttributeName : [UIFont boldSystemFontOfSize:18]}];
    [self.navigationBar setTintColor:WHITCOLOR];    // Do any additional setup after loading the view.
}

//解决手势失效问题
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController == self.viewControllers[0]) {
        self.interactivePopGestureRecognizer.delegate = self.popDelegate;
    }else{
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}

//push时隐藏tabbar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

//设置样式
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

//设置返回按钮样式
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backBarButtonItemAction)];
    viewController.navigationItem.backBarButtonItem = backBarButtonItem;
    
}

- (void)backBarButtonItemAction
{
    [self popViewControllerAnimated:YES];
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
