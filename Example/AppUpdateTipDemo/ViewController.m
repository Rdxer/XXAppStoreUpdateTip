//
//  ViewController.m
//  AppUpdateTipDemo
//
//  Created by Rdxer on 2017/2/10.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

#import "ViewController.h"

#import "XXUpdateTip.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [XXUpdateTip checkUpdateWithAppid:@"1046347789" vc:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
