//
//  XXAppStoreInfo.m
//  Pods
//
//  Created by Rdxer on 2017/2/10.
//
//

#import "XXAppStoreInfo.h"

@implementation XXAppStoreInfo

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
   
}
-(void)setValue:(id)value forKey:(nonnull NSString *)key{
    if ([key isEqualToString:@"description"]) {
        self._app_description = value;
    }else{
        [super setValue:value forKey:key];
    }
}

-(void)setNilValueForKey:(NSString *)key{
    
}

@end
