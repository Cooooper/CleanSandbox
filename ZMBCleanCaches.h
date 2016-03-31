//
//  ZMBCleanCaches.h
//  ZhongMeBan
//
//  Created by Han Yahui on 16/3/25.
//  Copyright © 2016年 Han Yahui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZMBCleanCaches : NSObject

// 根据路径返回目录或文件的大小
+ (double)sizeWithFilePath:(NSString *)path;

// 得到指定目录下的所有文件
+ (NSArray *)getAllFileNames:(NSString *)dirPath;

// 删除指定目录或文件
+ (BOOL)clearCachesWithFilePath:(NSString *)path;

// 清空指定目录下文件
+ (BOOL)clearCachesFromDirectoryPath:(NSString *)dirPath;

@end
