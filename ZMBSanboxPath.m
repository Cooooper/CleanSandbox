//
//  ZMBSanboxPath.m
//  ZhongMeBan
//
//  Created by Han Yahui on 16/3/25.
//  Copyright © 2016年 Han Yahui. All rights reserved.
//

#import "ZMBSanboxPath.h"

@implementation ZMBSanboxPath

+ (NSString *)getDocumentDirectory{
  return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString *)getLibraryDirectory{
  return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString *)getCachesDirectory{
  return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString *)getPreferencePanesDirectory{
  return [NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString *)getTmpDirectory{
  return NSTemporaryDirectory();
}

@end
