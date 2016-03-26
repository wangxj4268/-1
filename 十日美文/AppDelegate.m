//
//  AppDelegate.m
//  十日美文
//
//  Created by qianfeng on 16/3/18.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.
//

#import "AppDelegate.h"
#import "MagicalRecord.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor clearColor];
    [self.window makeKeyAndVisible];
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"app.sqlite"];
    //设置友盟分享的appKey
    [UMSocialData setAppKey:@"5616741767e58e7aef001d54"];
    [self createRoot];
    return YES;
}

-(void)createRoot{
    //@"OneViewController",@"TwoViewController",@"ThreeViewController",@"FourViewController"
    NSArray *vcClasses=@[@"OneViewController",@"TwoViewController",@"ThreeViewController",@"FourViewController"];   //注意:""中间不能有空格
    NSArray *titles=@[@"影评",@"美文",@"美图",@"我的"];
    NSArray *barImages=@[@"c-hotusers",@"c-bookmark",@"c-category",@"c-hotapps"];
    NSMutableArray *vcs=[NSMutableArray new];
    for (NSInteger i=0; i<vcClasses.count; i++) {
        //在运行时告诉class，class是包装的哪个类
        Class class=NSClassFromString(vcClasses[i]);
        UIViewController *vc=[[class alloc]init];
        
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];
       // nav.navigationBar.barTintColor=[UIColor redColor];//相当于给导航栏加颜色
        nav.navigationBar.barTintColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"ne6"]];
        nav.tabBarItem.image=[UIImage imageNamed:barImages[i]];
        nav.tabBarItem.title=titles[i];
//        nav.tabBarItem.selectedImage=[UIImage imageNamed:[barImages[i] stringByAppendingString:@"_press"]];
        [vcs addObject:nav];
    }
    UITabBarController *tab=[[UITabBarController alloc]init];
    
   
    tab.tabBar.backgroundImage=[UIImage imageNamed:@"t4"];//给标签栏加背景图片
    
    tab.viewControllers=vcs;
    self.window.rootViewController=tab;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [MagicalRecord cleanUp];
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

//- (void)applicationWillTerminate:(UIApplication *)application {
//    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//}

@end
