//
//  NSString+VersionCompare.h
//  dyss_v2
//
//  Created by LXF on 16/5/17.
//  Copyright © 2016年 First Facility. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XXVersionCompare)

///  版本比较
///  =0 相等,>0 当前APP版本大,<0比较版本大
///  this 当前 app 版本
///  @param version    比较的版本
///
///  @return =0 相等,>0 当前APP版本大,<0比较版本大
- (NSInteger)compareWithVersionString:(NSString *)versionString;

@end
