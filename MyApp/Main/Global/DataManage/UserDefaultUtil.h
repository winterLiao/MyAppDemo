//
//  UserDefaultUtil.h
//  MyApp
//
//  Created by liaowentao on 17/3/28.
//  Copyright © 2017年 Haochuang. All rights reserved.
//
// NSUserDefault

#import <Foundation/Foundation.h>

@interface UserDefaultUtil : NSObject

+(void)saveValue:(id) value forKey:(NSString *)key;

+(id)valueForKey:(NSString *)key;

+(id)StringForKey:(NSString *)key;

+(void)saveBoolValue:(BOOL)value forKey:(NSString *)key;

+(BOOL)boolValueForKey:(NSString *)key;


+(void)printAllUserDefault;

@end
