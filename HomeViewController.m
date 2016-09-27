//
//  HomeViewController.m
//  paipaifan
//
//  Created by YangJie on 16/8/12.
//  Copyright © 2016年 YangJie. All rights reserved.
//

#import "HomeViewController.h"
#import "SquareViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SquareViewController *square = [[SquareViewController alloc] init];
//    square.title = @"大家都在吃什么~";
//    square.navigationController.title = @"test";
//    self.title = @"大家都在吃什么";
    [self preferredStatusBarStyle];
    [self pushViewController:square animated:YES];
    // Do any additional setup after loading the view.
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
