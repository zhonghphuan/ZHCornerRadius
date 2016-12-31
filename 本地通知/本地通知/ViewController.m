//
//  ViewController.m
//  本地通知
//
//  Created by ZH on 2016/12/14.
//  Copyright © 2016年 ZH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textLabel.text = self.text;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //创建本地通知
    UILocalNotification *localNotification = [[UILocalNotification alloc]init];
    
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:3];
    localNotification.alertTitle = @"环环的App本地通知标题";
    localNotification.alertBody = @"环环的App本地通知内容";
    localNotification.alertAction = @"alertAction";
    localNotification.applicationIconBadgeNumber = 5;
    localNotification.userInfo = @{@"msg":@"自定义数据"};
    
    //自定义通知面板category必须设置AppDelegate对应的名称
    localNotification.category = @"cat1";
    
    
    //执行通知
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
  
}

@end
