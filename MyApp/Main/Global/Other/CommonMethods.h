//
//  CommonMethods.h
//  MyApp
//
//  Created by liaowentao on 17/3/27.
//  Copyright © 2017年 Haochuang. All rights reserved.
//  公告方法

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CommonMethods : NSObject

/**判断是否是第一次启动*/
+ (BOOL)isFirstLaunching;
/**根据iPhone6大小适配*/
+ (CGFloat)adaptationIphone6Height:(CGFloat)height;

/********************** NSString Utils ***********************/
/**字符串转换成时间*/
+ (NSDate *)dateFromString:(NSString *)string;
/**判断字符串是否为空*/
+(BOOL)isEmptyOrNull:(NSString *)str;
/**去掉空格*/
+ (NSString *)deleteBlank:(NSString *)string;
/**去掉回车和空格*/
+ (NSString *)deleteBlankAndEnter:(NSString *)string;
/**格式化浮点数（若有一位小数，显示一位；若有两位小数，则显示两位）*/
+(NSString *)formaterDoubleString:(double)doublevalue;

/********************** Verification Utils ***********************/
/**验证该字符串是否是6-16位字母和数字组合*/
+ (BOOL)checkIsDigitalAndLetter:(NSString *)string;
/**利用正则表达式验证手机号码*/
+ (BOOL)checkTel:(NSString *)str;
/**利用正则表达式验证邮箱*/
+ (BOOL)checkEmail:(NSString *)email;
/**颜色转图片*/
+ (UIImage *)createImageWithColor:(UIColor *)color;
@end
