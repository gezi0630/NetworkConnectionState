//
//  ViewController.m
//  网络连接6-3
//
//  Created by iboka on 16/2/26.
//  Copyright © 2016年 UIstep. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //断网试一试
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(doWork:) name:@"netStatus" object:nil];
    
}


-(void)doWork:(NSNotification*)text
{
    NSString * netVal= text.userInfo[@"netType"];
    
    if ([netVal isEqualToString:@"notReachable"]) {
        NSLog(@"加载本地数据");
    }else{
        NSLog(@"更新网络数据");
    }
    
    
}



@end
