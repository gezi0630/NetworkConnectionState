//
//  AppDelegate.m
//  网络连接6-3
//
//  Created by iboka on 16/2/26.
//  Copyright © 2016年 UIstep. All rights reserved.
//

#import "AppDelegate.h"
#import "Reachability.h"
@interface AppDelegate ()
@property(nonatomic,strong)Reachability *reachability;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //创建通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(internetConnection) name:kReachabilityChangedNotification object:nil];
    
    //初始化可达性
    self.reachability =[Reachability reachabilityForInternetConnection];
    
    //开始监听
    [self.reachability startNotifier];
    
   
    
    [self internetConnection];
    
    
    
    
    
    
    return YES;
}
-(void)internetConnection
{   //网络连接现状
    NetworkStatus status =[self.reachability currentReachabilityStatus];
    switch (status) {
        case NotReachable:
            
            NSLog(@"没有网络");
            [[NSNotificationCenter defaultCenter]postNotificationName:@"netStatus" object:nil userInfo:@{@"netType":@"notReachable"}];
            
            break;
        case ReachableViaWiFi:
            
            NSLog(@"wifi连接");
            [[NSNotificationCenter defaultCenter]postNotificationName:@"netStatus" object:nil userInfo:@{@"netType":@"reachableViaWiFi"}];

            
            break;
        case ReachableViaWWAN:
            
            NSLog(@"移动蜂窝网络");
            [[NSNotificationCenter defaultCenter]postNotificationName:@"netStatus" object:nil userInfo:@{@"netType":@"reachableViaWWAN"}];

            
            break;
        default:
            break;
    }
   
    
    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
