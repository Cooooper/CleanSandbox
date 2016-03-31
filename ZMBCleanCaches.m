//
//  ZMBCleanCaches.m
//  ZhongMeBan
//
//  Created by Han Yahui on 16/3/25.
//  Copyright © 2016年 Han Yahui. All rights reserved.
//

#import "ZMBCleanCaches.h"

@implementation ZMBCleanCaches

+ (double)sizeWithFilePath:(NSString *)path{
  // 1.获得文件夹管理者
  NSFileManager *manger = [NSFileManager defaultManager];
  
  // 2.检测路径的合理性
  BOOL dir = NO;
  BOOL exits = [manger fileExistsAtPath:path isDirectory:&dir];
  if (!exits) return 0;
  
  // 3.判断是否为文件夹
  if (dir) { // 文件夹, 遍历文件夹里面的所有文件
    // 这个方法能获得这个文件夹下面的所有子路径(直接\间接子路径)
    NSArray *subpaths = [manger subpathsAtPath:path];
    int totalSize = 0;
    for (NSString *subpath in subpaths) {
      NSString *fullsubpath = [path stringByAppendingPathComponent:subpath];
      
      BOOL dir = NO;
      [manger fileExistsAtPath:fullsubpath isDirectory:&dir];
      if (!dir) { // 子路径是个文件
        NSDictionary *attrs = [manger attributesOfItemAtPath:fullsubpath error:nil];
        totalSize += [attrs[NSFileSize] intValue];
      }
    }
    return totalSize / (1024 * 1024.0);
  } else { // 文件
    NSDictionary *attrs = [manger attributesOfItemAtPath:path error:nil];
    return [attrs[NSFileSize] intValue] / (1024.0 * 1024.0);
  }
}

+ (NSArray *)getAllFileNames:(NSString *)dirPath{
  NSArray *files = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:dirPath error:nil];
  return files;
}

+ (BOOL)clearCachesWithFilePath:(NSString *)path{
  NSFileManager *mgr = [NSFileManager defaultManager];
  NSError *error;
  BOOL flag = [mgr removeItemAtPath:path error:&error];
  NSLog(@"%@", error);
  return flag;
}

+ (BOOL)clearCachesFromDirectoryPath:(NSString *)dirPath{
  
  //获得全部文件数组
  NSArray *fileAry =  [ZMBCleanCaches getAllFileNames:dirPath];
  //遍历数组
  BOOL flag = NO;
  for (NSString *fileName in fileAry) {
    NSString *filePath = [dirPath stringByAppendingPathComponent:fileName];
    flag = [ZMBCleanCaches clearCachesWithFilePath:filePath];
    
//    if (!flag)
//      break;
  }
  
  return flag;
}


@end
