//
//  MyselfViewController.m
//  paipaifan
//
//  Created by YangJie on 16/8/11.
//  Copyright © 2016年 YangJie. All rights reserved.
//

#import "MyselfViewController.h"
#import "Common.h"
#import "GPUImage.h"
#import "PersonViewController.h"



@interface MyselfViewController ()<UITableViewDataSource,UITableViewDelegate>
/**
 *  整个滚动图
 */
@property (nonatomic,weak) UITableView * myselfTableView;
/**
 *  头像背景
 */
@property (nonatomic,weak) UIImageView *headBackground;
/**
 *  头像
 */
@property (nonatomic,weak) UIButton *headButton;
/**
 *  用户名称
 */
@property (nonatomic,weak) UILabel *userName;

@property (nonatomic,assign) BOOL isLogined;
@property (nonatomic,assign) CGSize headImageSize;


//@property (nonatomic,weak) UIVisualEffectView *visualEffectView;
@end

@implementation MyselfViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
    if (_isLogined) {
        
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubView];
    MyNSLog(@"SCREEN_WIDTH  %f,SCREEN_HEIGHT %f",SCREEN_WIDTH,SCREEN_HEIGHT);
}
/**
 *  初始化控件
 */
- (void)initSubView
{
    //tableview
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - TABBAR_HEIGHT)];
    tableview.delegate = self;
    tableview.dataSource = self;
    self.myselfTableView = tableview;
    [_myselfTableView setContentInset:UIEdgeInsetsMake(0, 0, 50, 0)];
    [self.view addSubview:_myselfTableView];
    
    //头像背景
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,HEAD_BACKGROUND_HEIGHT)];
    _headBackground = imageView;
    _headBackground.contentMode = UIViewContentModeScaleToFill;
    //不是添加到headerview上
//    [_myselfTableView addSubview:_headBackground];
    // 与图像高度一样防止数据被遮挡
    self.myselfTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,HEAD_BACKGROUND_HEIGHT)];
    //尝试加到headview上，没出现不良效果
    [_myselfTableView.tableHeaderView addSubview:_headBackground];
    
    //用户头像按钮
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, HEAD_WIDTH, HEAD_HEIGHT)];
    button.center = CGPointMake(self.headImageSize.width * 0.5,self.headImageSize.height *0.35);
    [button setBackgroundImage:[UIImage imageNamed:@"2.jpg"] forState:UIControlStateNormal];
    button.layer.cornerRadius = HEAD_WIDTH * 0.5;
    button.layer.masksToBounds = YES;
    [button addTarget:self action:@selector(pushToUserInfoView) forControlEvents:UIControlEventTouchUpInside];
    _headButton = button;
    [_headBackground addSubview:_headButton];
    
    //用户名称，宽度到时候调整根据获取用户长度调整
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, USER_NAME_HEIGHT)];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.center = CGPointMake(self.headImageSize.width * 0.5,self.headImageSize.height *0.55);
    lable.text = @"到底吃点什么呢";
    lable.textColor = [UIColor blackColor];
    lable.font = [UIFont systemFontOfSize:14];
    _userName = lable;
    [_headBackground addSubview:_userName];
//    [_headBackground setImage:_headButton.currentBackgroundImage];
    _headBackground.alpha = 0.8;
//    [self makeAsyncSetHeadviewImage:_headButton.currentBackgroundImage];
    //直接放到主线程中去。
     UIImage * blurImage = [self applyGaussianBlur:_headButton.currentBackgroundImage];
     [_headBackground setImage:blurImage];
    //设置状态栏显示。整个scroll 的frame
    self.edgesForExtendedLayout = UIRectEdgeNone;
}
/**
 *  创建异步线程高斯处理图片，但是有1秒的处理时间，等待解决
 *
 *  @param image inputImage
 */
- (void)makeAsyncSetHeadviewImage:(UIImage *)image
{
    dispatch_async(
                   dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^(void){
                       UIImage * blurImage = [self applyGaussianBlur:image];
                       dispatch_async(dispatch_get_main_queue(), ^(void){
                           [UIView animateWithDuration:4.00 animations:^{
                               [_headBackground setImage:blurImage];
                               _headBackground.alpha = 1.0;
                           }];
                       });
                   });
}
/**
 *  GPUImage高斯处理
 *
 *  @param image inputImage
 *
 *  @return outputImage
 */
- (UIImage *)applyGaussianBlur:(UIImage *)image
{
    GPUImageGaussianBlurFilter *filter = [[GPUImageGaussianBlurFilter alloc] init];
    filter.texelSpacingMultiplier =3.0;
    filter.blurRadiusInPixels = 7.0;
    [filter forceProcessingAtSize:image.size];
    
    GPUImagePicture *pic = [[GPUImagePicture alloc] initWithImage:image];
    [pic addTarget:filter];
    [pic processImage];
    [filter useNextFrameForImageCapture];
    return [filter imageFromCurrentFramebuffer];
}
/**
 *  get 方法
 *
 *  @return
 */
- (CGSize)headImageSize
{
    return _headBackground.frame.size;
}
/**
 *  跳转到用户信息界面
 */
- (void)pushToUserInfoView
{
    
}

#pragma mark ------------------- tableView dataSource method
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static int i = 0;
//    SquareTableViewCell *cell = [SquareTableViewCell cellWithTableView:tableView];
    static NSString * resuId = @"myself";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:resuId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:resuId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%i行",i++];
    return cell;
}

#pragma mark ------------------- tableView delegate method
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
#pragma mark ------  UIScrollViewDelegate method
/**
 *  scrollView 已经滑动，这里处理headbackground
 *
 *  @param scrollView
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
//    MyNSLog(@"offsetY = %f",offsetY);
    if (offsetY < 0) {
        // 修改头部的frame值
        self.headBackground.frame = CGRectMake(offsetY * 0.5, offsetY, SCREEN_WIDTH - offsetY, HEAD_BACKGROUND_HEIGHT - offsetY);
        self.headButton.center = CGPointMake(self.headImageSize.width *0.5, self.headImageSize.height *0.35 - offsetY *0.5);
        _userName.center = CGPointMake(self.headImageSize.width * 0.5,self.headImageSize.height *0.55 - offsetY *0.5);
    }
    //最大滚动限制
    if (offsetY < MAX_ScroolHeight) {
        scrollView.contentOffset = CGPointMake(0,MAX_ScroolHeight);
    }
    
}
// scrollView 开始拖动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
//    MyNSLog(@"scrollViewWillBeginDragging");
}

// scrollView 结束拖动
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
//    MyNSLog(@"scrollViewDidEndDragging");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
