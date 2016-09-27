//
//  ViewController.m
//  UICollectionViewDemo
//
//  Created by admin on 16/9/27.
//  Copyright © 2016年 thomas. All rights reserved.
//

#import "ViewController.h"
#import "UserCenterViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)userCenterButtonWasPressed:(UIButton *)sender {
    UserCenterViewController *viewController = [[UserCenterViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}


@end
