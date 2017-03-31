//
//  LWTSegementViewController.h
//  SegementViewControllerDemo
//
//  Created by liaowentao on 17/3/9.
//  Copyright © 2017年 Haochuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LWTSegementViewController : UIViewController


@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSMutableArray *controllerArray;
@property (nonatomic, strong) UIScrollView *scroll;

- (void)setTheTextColor:(UIColor *)textColor sliderColor:(UIColor *)sliderColor;
-(void)scrollViewDidScroll:(UIScrollView *)scrollView;
- (void)scrollViewSelectToIndex:(UIButton *)button;
- (void)selectButton:(NSInteger)index;


@end
