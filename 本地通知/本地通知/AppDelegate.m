//
//  AppDelegate.m
//  本地通知
//
//  Created by ZH on 2016/12/14.
//  Copyright © 2016年 ZH. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    //创建自定义的面板
    UIMutableUserNotificationCategory *cat1 = [[UIMutableUserNotificationCategory alloc]init];
    cat1.identifier = @"cat1";
    UIMutableUserNotificationAction *action1 = [[UIMutableUserNotificationAction alloc]init];
    action1.identifier = @"action1";
    action1.title = @"action1的title";
    action1.behavior = UIUserNotificationActionBehaviorDefault;
    action1.parameters = @{@"detail":@"parameters内容参数"};
    action1.activationMode = UIUserNotificationActivationModeBackground;
    
    [cat1 setActions:@[action1] forContext:UIUserNotificationActionContextDefault];
    
    NSSet *categories = [NSSet setWithObjects:cat1, nil];
    UIUserNotificationSettings * settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert categories:categories];
    
    
    //启动时允许通知使用,注册通知
    
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    
    if (launchOptions[UIApplicationLaunchOptionsLocalNotificationKey]) {
        
        UILocalNotification *localNotification = launchOptions[UIApplicationLaunchOptionsLocalNotificationKey];
        ((ViewController *)self.window.rootViewController).text = localNotification.userInfo[@"name"];
          [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    }
  
    return YES;
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    ((ViewController *)self.window.rootViewController).textLabel.text = notification.userInfo[@"name"];
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    NSLog(@"notification:%@",notification.userInfo);

    
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void(^)())completionHandler {
    NSLog(@"%s",__func__);
    completionHandler();
}

// 处理通知面板的action动作,如果实现了这个方法,上面将忽略, 一般用于处理用户的输入
- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forLocalNotification:(UILocalNotification *)notification withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void(^)())completionHandler {
    
    if([identifier isEqualToString:@"action1"]) {
        NSLog(@"处理action1动作");
    } else if([identifier isEqualToString:@"action2"]) {
        NSLog(@"处理action2动作");
    } else if([identifier isEqualToString:@"action3"]) {
        NSString *text = responseInfo[UIUserNotificationActionResponseTypedTextKey];
        NSLog(@"处理文本输入的动作%@",text);
    }
    
    
    NSLog(@"identifier:%@",identifier);

    NSLog(@"%@",responseInfo);
    completionHandler();
}

@end
