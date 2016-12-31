//
//  AppDelegate.m
//  远程推送通知
//
//  Created by ZH on 2016/12/14.
//  Copyright © 2016年 ZH. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    [self requestDeviceToken];
    
    // 判断启动参数,程序通过远程推送启动的时候
    if(launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey]) {
        NSDictionary *dict = launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey];
    }
    
    return YES;
}

// 向苹果请求DeviceToken
- (void)requestDeviceToken
{
    // iOS 8.0之后必须请求授权
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        
        // 1.请求授权
        UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:setting];
        
        // 2.自动获取当前设备的UDID, 以及, app bundle id , 向苹果服务器发送请求, 获取deviceToken
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    } else {
        // iOS 8.0之前不用请求授权
        // 2.自动获取当前设备的UDID, 以及, app bundle id , 向苹果服务器发送请求, 获取deviceToken
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert];
    }
    
    
}

// 4. 苹果返回一个DeviceToken的数据 -> 当我们发送 UUID和 Bundle ID之后苹果返回给我们的一个唯一表示串,能够体现一台设备中APP唯一性
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // 会提交给我们服务器,这样我们服务器就知道发送消息给谁了
    NSLog(@"deviceToken:%@",deviceToken);
    
}

// 程序活着的时候远程推送执行
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(nonnull NSDictionary *)userInfo {
    // 自己解析我们组织的格式
    NSLog(@"userInfo:%@",userInfo);
}


@end
