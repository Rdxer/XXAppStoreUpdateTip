//
//  NSString+VersionCompare.m
//  dyss_v2
//
//  Created by LXF on 16/5/17.
//  Copyright © 2016年 First Facility. All rights reserved.
//

#import "NSString+XXVersionCompare.h"

@implementation NSString (XXVersionCompare)

-(NSInteger)compareWithVersionString:(NSString *)versionString{
    
    NSArray *appVerArray = [self componentsSeparatedByString:@"."];
    NSArray *verArray = [versionString componentsSeparatedByString:@"."];
    
    NSInteger i = 0;
    for (; i < (appVerArray.count < verArray.count ? appVerArray.count : verArray.count); i++) {
        NSInteger appVerV = [appVerArray[i] integerValue];
        NSInteger verV = [verArray[i] integerValue];
        if (appVerV - verV != 0) {
            return appVerV - verV;
        }
    }
    
    if (appVerArray.count == verArray.count) {
        return 0;
    }
    
    NSInteger res = 0;
    NSArray *array = appVerArray.count > verArray.count ? appVerArray:verArray;
    for (; i < array.count; i++) {
        res += [array[i] integerValue];
    }
    
    return res;
}

@end
