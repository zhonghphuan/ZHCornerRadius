//
//  ViewController.m
//  ZHCornerRadius
//
//  Created by ZH on 2016/12/11.
//  Copyright © 2016年 ZH. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+Addition.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

  
    _imgView.image = [UIImage imageNamed:@"4"];
    _imgView.cornerRadius = 100;

}



@end
