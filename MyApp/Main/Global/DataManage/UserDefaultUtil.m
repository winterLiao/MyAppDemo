//
//  UserDefaultUtil.m
//  MyApp
//
//  Created by liaowentao on 17/3/28.
//  Copyright © 2017年 Haochuang. All rights reserved.
//

#import "UserDefaultUtil.h"

@implementation UserDefaultUtil

+(void)saveValue:(id) value forKey:(NSString *)key{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:value forKey:key];
    [userDefaults synchronize];
}

+(id)valueForKey:(NSString *)key{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:key];
}

+(id)StringForKey:(NSString *)key{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults stringForKey:key];
}


+(BOOL)boolValueForKey:(NSString *)key{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults boolForKey:key];
}

+(void)saveBoolValue:(BOOL)value forKey:(NSString *)key{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:value forKey:key];
    [userDefaults synchronize];
}

+(void)printAllUserDefault{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [userDefaults dictionaryRepresentation];
    NSLog(@"%@",dic);
}

@end
