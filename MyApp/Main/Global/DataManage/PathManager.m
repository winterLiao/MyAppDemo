//
//  PathManager.m
//  MyApp
//
//  Created by liaowentao on 17/3/28.
//  Copyright © 2017年 Haochuang. All rights reserved.
//

#import "PathManager.h"

@implementation PathManager
/**
 *  获取Documents文件夹路径
 *
 *  @return 文件夹路径
 */
+ (NSString *)getDocumentsFolderPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

/**
 *  获取Documents文件路径
 *
 *  @param fileName 文件名称
 *
 *  @return 文件路径
 */
+ (NSString *)getDocumentsFilePath:(NSString *)fileName
{
    return [[self getDocumentsFolderPath] stringByAppendingPathComponent:fileName];
}

/**
 *  获取一个目录所占的空间大小
 *
 *  @param filePath 文件目录路径
 *
 *  @return 目录空间大小
 */
+ (long long)fileSizeAtPath:(NSString*) filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    else{
        return 0;
    }
} 

@end
