//
//  PersonViewController.m
//  paipaifan
//
//  Created by YangJie on 16/8/12.
//  Copyright © 2016年 YangJie. All rights reserved.
//

#import "PersonViewController.h"
#import "MyselfViewController.h"

@interface PersonViewController ()

@end

@implementation PersonViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    MyselfViewController *myself = [[MyselfViewController alloc] init];
    [self preferredStatusBarStyle];
    [self pushViewController:myself animated:YES];
}
//设置状态栏的白色
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
