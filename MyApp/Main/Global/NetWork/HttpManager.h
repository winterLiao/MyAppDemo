//
//  HttpManager.h
//  MyApp
//
//  Created by liaowentao on 17/3/28.
//  Copyright © 2017年 Haochuang. All rights reserved.
//  网络请求

#import <Foundation/Foundation.h>

@interface HttpManager : NSObject
/**
 *  网络请求
 *
 *  @param parameters  请求封装的参数
 *  @param success     请求成功后回调block
 *  @param failure     请求失败后回调block
 *
 *  @return void
 */
+ (void)postParameters:(id)parameters
               success:(void (^)(NSDictionary *resDict))success
               failure:(void (^)(NSError *error))failure;
/**
 *  GET网络请求
 *
 *  @param urlStr     url
 *  @param parameters 参数
 *  @param success    请求成功回调
 *  @param failure    请求失败回调
 */
+ (void)getUrl:(NSString *)urlStr
    Parameters:(id)parameters
       success:(void (^)(id))success
       failure:(void (^)(NSError *error))failure;

@end
