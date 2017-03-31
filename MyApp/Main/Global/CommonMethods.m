//
//  CommonMethods.m
//  MyApp
//
//  Created by liaowentao on 17/3/27.
//  Copyright © 2017年 Haochuang. All rights reserved.
//
// 全局方法定义

#import "CommonMethods.h"
//#import <UserDefaultUtil.h"

@implementation CommonMethods

/**判断是否是第一次启动*/
+ (BOOL)isFirstLaunching
{
    BOOL firstLaunching = false;
    
    NSString *lastAppVersion =  [UserDefaultUtil valueForKey:@"LastAppVersion"];
    NSString *currentAppVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    
    if ([lastAppVersion floatValue] < [currentAppVersion floatValue])
    {
        [UserDefaultUtil setValue:currentAppVersion forKey:@"LastAppVersion"];
        firstLaunching = true;
    }
    
    return firstLaunching;
}

+ (CGFloat)adaptationIphone6Height:(CGFloat)height {
    if (IS_IPHONE6) {
        return height;
    }else if (IS_IPHONE6_PLUS){
        return height * 1.10;
    }else if (IS_IPHONE5){
        return height * 0.85;
    }else if (IS_IPHONE4S){
        return height * 0.72;
    }
    return height;
}

/**字符串转换成时间*/
+ (NSDate *)dateFromString:(NSString *)string
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date               = [formatter dateFromString:string];
    return date;
}

/**判断字符串是否为空*/
+(BOOL)isEmptyOrNull:(NSString *)str
{
    if (!str || [str isKindOfClass:[NSNull class]])
    {
        // null object
        return true;
    } else {
        NSString *trimedString = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([trimedString length] == 0) {
            
            // empty string
            return true;
        }
        else{
            // is neither empty nor null
            return false;
        }
        
    }
}

/**去掉空格*/
+ (NSString *)deleteBlank:(NSString *)string
{
    NSString *newString= [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    return newString;
}

/**去掉空格及空行*/
+ (NSString *)deleteBlankAndEnter:(NSString *)string
{
    NSString *newString= [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    newString= [newString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return newString;
}

/**格式化浮点数*/
+(NSString *)formaterDoubleString:(double)doublevalue{
    NSString *doubleStr = [NSString stringWithFormat:@"%.2f",doublevalue];
    NSRange pointRange = [doubleStr rangeOfString:@"."];
    if (pointRange.length > 0) {
        //包含小数点
        if ([[doubleStr substringWithRange:NSMakeRange(pointRange.location+2, 1)] isEqualToString:@"0"]) {
            //最后一位为0
            if ([[doubleStr substringWithRange:NSMakeRange(pointRange.location+1, 1)] isEqualToString:@"0"]) {
                //小数点后一位为0
                doubleStr = [NSString stringWithFormat:@"%.f",doublevalue];
            }
            else{
                doubleStr = [NSString stringWithFormat:@"%.1f",doublevalue];
            }
        }
    }
    else{
        //整数
        doubleStr = [NSString stringWithFormat:@"%.f",doublevalue];
    }
    return doubleStr;
}

/**验证该字符串是否是6-16位字母和数字组合*/
+ (BOOL)checkIsDigitalAndLetter:(NSString *)string
{
    if (string.length < 6 || string.length > 16)
    {
        return NO;
    }
    NSString *regex = @"^[A-Za-z0-9]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if ([predicate evaluateWithObject:string]) {
        if ([self hasDigital:string] && [self hasLetter:string]) {
            return YES;
        }else{
            return NO;
        }
    }else{
        return NO;
    }
}

/**
 *  是否有数字
 *
 *  @param string 字符串
 *
 *  @return YES 有数字 ，NO 没有数字
 */
+ (BOOL)hasDigital:(NSString *)string
{
    for(int i = 0; i < string.length ; i++){
        unichar a = [string characterAtIndex:i];
        if ((a >= '0' && a <= '9' )) {
            return YES;
        }
    }
    return NO;
}

/**
 *  是否有字母
 *
 *  @param string 字符串
 *
 *  @return YES 有字母 ，NO 没有字母
 */
+ (BOOL)hasLetter:(NSString *)string
{
    for(int i = 0; i < string.length ; i++){
        unichar a = [string characterAtIndex:i];
        if ((a >= 'A' && a <= 'Z' ) || (a >= 'a' && a <= 'z')) {
            return YES;
        }
    }
    return NO;
}

/**利用正则表达式验证手机号码*/
+ (BOOL)checkTel:(NSString *)str
{
    if ([str length] != 11) {
        return NO;
    }
    //修改电话号码限制规则
    //    NSString *regex = @"0{0,1}(13[0-9]|14[0-9]|15[0-9]|18[0-9])[0-9]{8}$";
    NSString *regex = @"0{0,1}1[0-9]{10}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:str];
    if (!isMatch) {
        return NO;
    }
    
    return YES;
}

/**邮箱有效性检查*/
+ (BOOL)checkEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+ (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

@end
