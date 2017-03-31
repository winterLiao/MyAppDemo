//
//  HttpManager.m
//  MyApp
//
//  Created by liaowentao on 17/3/28.
//  Copyright © 2017年 Haochuang. All rights reserved.
//

#import "HttpManager.h"

@implementation HttpManager

+ (AFHTTPSessionManager *)httpManager{
    //获取请求对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 设置请求格式
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 设置返回格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    manager.requestSerializer.timeoutInterval = RequestTimeOut;
    return manager;
}
+ (void)postParameters:(id)parameters
               success:(void (^)(NSDictionary *resDict))success
               failure:(void (^)(NSError *error))failure
{
    
    //    if ([[AFNetworkReachabilityManager sharedManager] networkReachabilityStatus] <= 0) {
    //        [MBProgressHUD showMessageInWindow:@"网络无连接" afterDelayHide:AfterDelayHide];
    //        return;
    //    }
    AFHTTPSessionManager *manager = [self httpManager];
    //开始请求
    [manager POST:BaseURLString
       parameters:parameters
         progress:^(NSProgress * _Nonnull uploadProgress) {
         }
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NSMutableDictionary *resDict = (NSMutableDictionary *)[responseObject mj_JSONObject];
//              NSDictionary *dict = [HttpManager checkResultVaild:resDict withFunction:parameters[@"function"]];
              
              NSLog(@"\n接口：%@\n返回数据：%@",parameters[@"function"],[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
              
              success(resDict);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failure(error);
              NSLog(@"\n当前接口：%@\n错误信息：%@",parameters[@"function"],error);
          }];
}

+ (void)getUrl:(NSString *)urlStr
    Parameters:(id)parameters
       success:(void (^)(id))success
       failure:(void (^)(NSError *error))failure{
    AFHTTPSessionManager *manager = [self httpManager];
    //开始请求
    [manager  GET:BaseURLString
       parameters:parameters
         progress:^(NSProgress * _Nonnull uploadProgress) {
             
         }
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              //              NSString *result = [[NSString alloc] initWithData:responseObject
              //                                                       encoding:NSUTF8StringEncoding];
              //              DDLogInfo(@"返回数据--%@",result);
              NSMutableDictionary *resDict = (NSMutableDictionary *)[responseObject mj_JSONObject];
//              NSDictionary *dict = [HttpManager checkResultVaild:resDict withFunction:parameters[@"function"]];
              success(resDict);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failure(error);
              NSLog(@"%@",error);
          }];
}


/**
 *  检查返回的内容是否有效
 *
 *  @param dict        返回数据
 *  @param functionStr 接口名称
 *
 *  @return 正常的返回数据
 */
//+ (NSDictionary *)checkResultVaild:(NSDictionary *)dict withFunction:(NSString *)functionStr
//{
//    
//}

@end
