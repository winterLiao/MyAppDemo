//
//  DefineRequest.h
//  MyApp
//
//  Created by liaowentao on 17/3/27.
//  Copyright © 2017年 Haochuang. All rights reserved.
//
// 各请求的定义(网址都是乱写的）

#ifndef DefineRequest_h
#define DefineRequest_h

//列表一页请求数量
#define REQUEST_MIN_PAGE_NUM 10
//连接超时时间
#define RequestTimeOut 30

#if DEVELOPMENT //***************开发版本*************
//****************测试环境***********
//app服务重构测试
//#define BaseURLString   @"http://www-test.baidu.com/rest/post"//beta
//#define BaseURLString @"http://docker-branch02-web-tomcat.baidu.com:8080/rest/post"//分之域名
//****************开发环境(个人服务器)************
//后台XXX
#define BaseURLString  @"http://192.168.1.175:8080/baidu/rest/post"
#else          //**************生产版本**************
#define BaseURLString @"https://www.baidu.com/rest/post"
#endif

//****************接口说明************
//获取用户信息
#define Request_type_getUserInfo @"getUserInfo"
//首页广告
#define Request_type_queryBannerByType @"queryBannerByType"

#endif /* DefineRequest_h */
