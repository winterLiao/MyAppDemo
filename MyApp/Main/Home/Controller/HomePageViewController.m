//
//  HomePageViewController.m
//  MyApp
//
//  Created by liaowentao on 17/3/22.
//  Copyright © 2017年 Haochuang. All rights reserved.
//

#import "HomePageViewController.h"
#import "LWTSegementViewController.h"
#import "NewsViewController.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buidUI];

    // Do any additional setup after loading the view.
}

- (void)buidUI
{
    self.title = @"首页";
    self.view.backgroundColor = WHITCOLOR;
    
    UIButton *navButton = [[UIButton alloc] init];
    [navButton setTitle:@"看新闻吧" forState:UIControlStateNormal];
    [navButton addTarget:self action:@selector(pushTheNewsMainViewController:) forControlEvents:UIControlEventTouchUpInside];
    [navButton setTitleColor:MAIN_GROUNDCOLOR forState:UIControlStateNormal];
    [self.view addSubview:navButton];
    
    WeakSelf(self);
    [navButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakself.view);
        make.left.equalTo(weakself.view).offset(-10);
        make.right.equalTo(weakself.view).offset(-10);
        make.height.mas_equalTo(Button_Height);
    }];

}



/**看新闻*/
- (void)pushTheNewsMainViewController:(UIButton *)button
{
    LWTSegementViewController *segVC = [[LWTSegementViewController alloc] init];
    segVC.titleArray = @[@"头条",@"生活",@"科技",@"社会",@"美女",@"汽车"];
    segVC.title = @"新闻事件";
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (NSString *titleStirng in segVC.titleArray) {
        NewsViewController *vc = [[NewsViewController alloc] init];
        vc.title = titleStirng;
        [array addObject:vc];
    }
    
    [self.navigationController pushViewController:segVC animated:YES];
    segVC.controllerArray = array;
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
