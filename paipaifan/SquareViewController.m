//
//  SquareViewController.m
//  paipaifan
//
//  Created by YangJie on 16/8/11.
//  Copyright © 2016年 YangJie. All rights reserved.
//

#import "SquareViewController.h"
#import "Common.h"
#import "SquareTableViewCell.h"
#import "SquareInfo.h"
#import "SquareCellFrame.h"
#import "MyNavigationBar.h"
#import "AppDelegate.h"
#import "CustomNavigationBar.h"

@interface SquareViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak) UITableView *mainTableView;

@property (nonatomic,strong) NSArray *showInfoArray;

@property (nonatomic,assign) CGRect navRect;

@property (weak, nonatomic)  UIView *statusBarView;

@property (nonatomic,strong) CustomNavigationBar *customNavigationBar;

@end

@implementation SquareViewController
//设置状态栏的白色，系统自动调用
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (void)viewWillAppear:(BOOL)animated
{

//    [[UIApplication sharedApplication ] setStatusBarStyle:UIStatusBarStyleDefault animated: true];
//    UINavigationBar *bar = [UINavigationBar appearance];
//    bar.barTintColor = CommonColor;
//    self.navRect = self.navigationController.navigationBar.frame;
    
    
//    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"大家都在吃什么";
    self.view.backgroundColor=[UIColor whiteColor];
    [self addMainTableView];
    self.customNavigationBar = [[CustomNavigationBar alloc] initWithFrame:CGRectMake(ZERO, ZERO, SCREEN_WIDTH, CUSTOMNAVBAR_HEIGHT)
                                                                    title:@"大家都在吃什么"
                                                                  bgColor:CommonColor
                                                             leftBtnImage:[UIImage imageNamed:@"nav_ic_back_white"]
                                                             leftBtnTitle:@"上海"
                                                        leftBtnTitleColor:WHITE_COLOR
                                                           reigthBtnTitle:@"预留"
                                                      reightBtnTitleColor:WHITE_COLOR
                                                           reightBtnImage:[UIImage imageNamed:@"nav_ic_notice"]
                                                                leftBlock:^{
                                                                    NSLog(@"左边点击！ Block的回调");
                                                                } reightBlock:^{
                                                                    NSLog(@"右边点击！ Block的回调");
                                                                }];
    [self.view addSubview:_customNavigationBar];
    
//    UIBarButtonItem *leftBarItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageWithContentsOfFile:imgPathLeft] title:@"上海" target:self action:@selector(returnVIew)];
//   UIButton *bu = [[UIButton alloc] init];
//[bu addTarget:self action:@selector(customButton) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.leftBarButtonItem = leftBarItem;

    
    // Do any additional setup after loading the view.
}

- (void)addMainTableView {
    
    CGFloat tableH = SCREEN_HEIGHT - CUSTOMNAVBAR_HEIGHT- TABBAR_HEIGHT;
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,CUSTOMNAVBAR_HEIGHT, SCREEN_WIDTH, tableH)];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.mainTableView = tableView;
    [self.view addSubview:_mainTableView];
    _mainTableView.backgroundColor = [UIColor purpleColor];
    
}
#pragma mark ------------------- 加载数据
- (NSArray *)showInfoArray
{
    if (_showInfoArray == nil) {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"11111" ofType:@"plist"];
        NSArray * dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray * temp = [NSMutableArray new];
        for (NSDictionary *dict in dictArray) {
            SquareInfo * squareInfo = [SquareInfo squareInfoWithDict:dict];
            SquareCellFrame *squareCellFrame = [[SquareCellFrame alloc] init];
            squareCellFrame.squareInfo = squareInfo;
            [temp addObject:squareCellFrame];
        }
        self.showInfoArray = temp;
    }
    return _showInfoArray;
}
#pragma mark ------------------- tableView dataSource method
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.showInfoArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SquareTableViewCell *cell = [SquareTableViewCell cellWithTableView:tableView];
    
    cell.squareCellFrame = self.showInfoArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    return cell;
}
#pragma mark ------------------- tableView delegate method
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SquareCellFrame *squareCellFrame = self.showInfoArray[indexPath.row];
    MyNSLog(@"height = %f",squareCellFrame.cellHeight);
    return squareCellFrame.cellHeight;
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyNSLog(@"tableview -------------------");
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    UIWindow *window = app.window;
    
    [UIView animateWithDuration:1.0f animations:^{
        window.alpha = 0;
        window.frame = CGRectMake(0, window.bounds.size.width, 0, 0);
    } completion:^(BOOL finished) {
        exit(0);
    }];
    //exit(0);
}
/**
 *  设置tableview的分割线
 */
-(void)viewDidLayoutSubviews
{
    if ([self.mainTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.mainTableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.mainTableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.mainTableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
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
