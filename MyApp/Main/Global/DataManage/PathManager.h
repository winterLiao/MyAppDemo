//
//  PathManager.h
//  MyApp
//
//  Created by liaowentao on 17/3/28.
//  Copyright © 2017年 Haochuang. All rights reserved.
//
// 获取文件路径

#import <Foundation/Foundation.h>

@interface PathManager : NSObject
/**
 *  获取Documents文件夹路径
 *
 *  @return 文件夹路径
 */
+ (NSString *)getDocumentsFolderPath;

/**
 *  获取Documents文件路径
 *
 *  @param fileName 文件名称
 *
 *  @return 文件路径
 */
+ (NSString *)getDocumentsFilePath:(NSString *)fileName;

/**
 *  获取一个目录所占的空间大小
 *
 *  @param filePath 文件目录路径
 *
 *  @return 目录空间大小
 */
+ (long long)fileSizeAtPath:(NSString*) filePath;

@end
