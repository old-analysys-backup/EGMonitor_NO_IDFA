//
//  AppDelegate.m
//  EGMonitor_Idfa_SDK_Demo
//
//  Created by sysylana on 2016/11/23.
//  Copyright © 2016年 Analysys. All rights reserved.
//

#import "EGAppDelegate.h"
#import "RootViewController.h"
#import "EGMonitor.h"


@interface EGAppDelegate ()

@end

@implementation EGAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    RootViewController *rootVC = [[RootViewController alloc]initWithNibName:@"RootViewController" bundle:nil];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:rootVC];
    self.window.rootViewController = nav;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [EGMonitor setLogEnabled:YES];      //记得release产品时要设置回NO.
    [EGMonitor setDebugEnabled:YES];    //记得release产品时要设置回NO.
    [EGMonitor startWithAppkey:@"9478288532565589s" channelId:nil];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url NS_DEPRECATED_IOS(2_0, 9_0, "Please use application:openURL:options:") __TVOS_PROHIBITED{
    
    if ([EGMonitor wakeupInfoStatEnterWithOpenURL:url]){
        return YES;//统计成功处理
    }
    return NO;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options NS_AVAILABLE_IOS(9_0){
    
    if ([EGMonitor wakeupInfoStatEnterWithOpenURL:url]){
        return YES;//统计成功处理
    }
    return NO;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
