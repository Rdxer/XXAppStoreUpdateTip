//
//  XXUpdateTip.m
//  Pods
//
//  Created by Rdxer on 2017/2/10.
//
//

#import "XXUpdateTip.h"
#import "XXAppStoreInfo.h"
#import "NSString+XXVersionCompare.h"
//#import "NSDate+dateStamp.h"

@implementation XXUpdateTip

+(void)checkUpdateWithAppid:(NSString *)appid vc:(UIViewController *)vc{
    NSString *urlStr = @"https://itunes.apple.com/lookup?id=";
    urlStr = [urlStr stringByAppendingString:appid];
    
    NSURLSession *s = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[s dataTaskWithURL:[NSURL URLWithString:urlStr] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"%@",error);
            return ;
        }
        
//        NSString *res = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if (error) {
            NSLog(@"%@",error);
            return ;
        }
        
        if ([[jsonObj objectForKey:@"resultCount"] integerValue] < 1) {
            NSLog(@"未找到此app");
            return ;
        }
        
        NSDictionary *dict = [[jsonObj objectForKey:@"results"] firstObject];
        XXAppStoreInfo *appinfo = [[XXAppStoreInfo alloc] init];
        [appinfo setValuesForKeysWithDictionary:dict];
        
        NSString *note = appinfo.releaseNotes;
        NSString *version = appinfo.version;
        NSString *appVersion = [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"];
        
        if ([appVersion compareWithVersionString:version] >= 0) {
            NSLog(@"app 没发现新版..");
            return ;
        }
        
        // =0 相等,>0 当前APP版本大,<0比较版本大
        NSLog(@"aa");
        
//        NSDate *date = [NSDate dateWithString:appinfo.currentVersionReleaseDate formetStr:@"2017-02-10T02:25:06Z"];
//        NSDate *date = [NSDate dateWithString:appinfo.currentVersionReleaseDate formetStr:@"yyyy-MM-ddTHH:mm:ssZ"];
        // yyyy-MM-dd/HH:mm:ss
        
        NSRange range = [appinfo.currentVersionReleaseDate rangeOfString:@"T"];
        
        NSString *msg = @"";//= [NSString stringWithFormat:@"ver:%@\n时间:%@\n%@",version,dateStr,note];
        
        if (range.location == NSNotFound) {
            msg = [NSString stringWithFormat:@"ver:%@\n%@",version,note];
        }else{
            NSString *dateStr = [appinfo.currentVersionReleaseDate substringToIndex:range.location];
            msg = [NSString stringWithFormat:@"ver:%@\n时间:%@\n%@",version,dateStr,note];
        }
        
        //NSString *msg = [NSString stringWithFormat:@"ver:%@\n时间:%@\n%@",version,dateStr,note];
        
        UIAlertController *av = [UIAlertController alertControllerWithTitle:@"发现新版本" message:msg preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        UIAlertAction *download = [UIAlertAction actionWithTitle:@"下载" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSString *urlStr = @"https://itunes.apple.com/app/id";
            urlStr = [urlStr stringByAppendingString:appid];
            [[UIApplication sharedApplication]openURL:[NSURL URLWithString:urlStr]];
        }];
        
        [av addAction:cancel];
        [av addAction:download];
        
        [vc presentViewController:av animated:YES completion:^{
            
        }];
        
    }] resume];
}

@end
