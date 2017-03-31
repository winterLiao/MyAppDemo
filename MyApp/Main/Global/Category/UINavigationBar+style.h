//
//  UINavigationBar+style.h
//  MyApp
//
//  Created by liaowentao on 17/3/29.
//  Copyright © 2017年 Haochuang. All rights reserved.
//   

#import <UIKit/UIKit.h>

@interface UINavigationBar (style)
- (UIView *)overlay;
- (void)setOverlay:(UIView *)overlay;
- (void)lt_setBackgroundColor:(UIColor *)backgroundColor;
@end
