//
//  AppDelegate.m
//  paipaifan
//
//  Created by YangJie on 16/8/11.
//  Copyright © 2016年 YangJie. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabBarViewController.h"
#import "Common.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //1.创建Window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //加载tabBar控制器
//    MainTabBarViewController *mainController= [[MainTabBarViewController alloc] initWithChildController];
     MainTabBarViewController *mainController= [[MainTabBarViewController alloc] init];
  
    MyNSLog(@"  mainController.viewControllers  = %lu",mainController.viewControllers.count);
    
    //设置控制器为Window的根控制器
    self.window.rootViewController=mainController;

//    [application setStatusBarStyle:UIStatusBarStyleLightContent];//设置全局状态栏颜色
//    UIViewController *currentViewController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
//    currentViewController.preferredStatusBarStyle = UIStatusBarStyleLightContent;
//    [application setStatusBarHidden:NO]; //启动的时候设置显示, 启动后要打开
    
    //2.设置Window为主窗口并显示出来
    [self.window makeKeyAndVisible];
    
    return YES;
}
- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity
 restorationHandler:(void (^)(NSArray *restorableObjects))restorationHandler {
    if ([[userActivity activityType] isEqualToString:NSUserActivityTypeBrowsingWeb]) {
        NSURL *url = [userActivity webpageURL];
        
        // url object contains your universal link content
    }
    
    // Apply your logic to determine the return value of this method
    return YES;
    // or
    // return NO;
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
