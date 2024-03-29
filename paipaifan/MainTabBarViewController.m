//
//  MainTabBarViewController.m
//  paipaifan
//
//  Created by YangJie on 16/8/11.
//  Copyright © 2016年 YangJie. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "MainTabBarItem.h"
#import "MainTabBarView.h"
#import "NearbyViewController.h"
#import "FoodCircleViewController.h"
#import "PersonViewController.h"
#import "SquareViewController.h"

@interface MainTabBarViewController () <MainTabBarViewDelegate>
@property (nonatomic, weak) UIButton *selectedBtn;
@end

@implementation MainTabBarViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    //下面两个方法在开发中是经常会用到的
        MyNSLog(@"%s",__func__);
        MyNSLog(@"%@",self.view.subviews); //能打印出所有子视图,和其frame
    [self initChildViewController];
    [self addTabBarItem];
    
//    NSArray *filters = [CIFilter filterNamesInCategory:kCICategoryBuiltIn];
//    MyNSLog(@"%@", filters);
//    [filters count];
//    MyNSLog(@"一共有 %lu 种 CIFilter 滤镜效果", (unsigned long)[filters count]);
    
    //  LogFun;
    //  LogSubviews(self.view);
    //删除现有的tabBar
    //    //添加按钮
    //  for (int i = 0; i < 5; i++) {
    //      //UIButton *btn = [[UIButton alloc] init];
    //        XNTabBarButton *btn = [[XNTabBarButton alloc] init];
    //
    //      NSString *imageName = [NSString stringWithFormat:@"TabBar%d", i + 1];
    //      NSString *imageNameSel = [NSString stringWithFormat:@"TabBar%dSel", i + 1];
    //
    //      [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    //      [btn setImage:[UIImage imageNamed:imageNameSel] forState:UIControlStateSelected];
    //
    //      CGFloat x = i * myView.frame.size.width / 5;
    //      btn.frame = CGRectMake(x, 0, myView.frame.size.width / 5, myView.frame.size.height);
    //
    //      [myView addSubview:btn];
    //
    //        btn.tag = i;//设置按钮的标记, 方便来索引当前的按钮,并跳转到相应的视图
    //
    //      //带参数的监听方法记得加"冒号"
    //      [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    //
    //      //设置刚进入时,第一个按钮为选中状态
    //      if (0 == i) {
    //          btn.selected = YES;
    //          self.selectedBtn = btn;  //设置该按钮为选中的按钮
    //      }
    //  }
}
/**
 *  添加item
 */
- (void)addTabBarItem
{
    CGRect rect = self.tabBar.bounds; //这里要用bounds来加, 否则会加到下面去.看不见
    //    LogFrame(self.tabBar);
    //    [self.tabBar removeFromSuperview];  //移除TabBarController自带的下部的条
    
    //测试添加自己的视图
    MainTabBarView *myView = [[MainTabBarView alloc] init]; //设置代理必须改掉前面的类型,不能用UIView
    myView.delegate = self; //设置代理
    myView.frame = rect;
    [self.tabBar addSubview:myView]; //添加到系统自带的tabBar上, 这样可以用的的事件方法. 而不必自己去写
    NSArray *array = @[@"square",@"nearby",@"foodcircle",@"myself"];
    NSArray *titleArray = @[@"广场",@"附近的美食",@"美食圈",@"我的拍饭"];
    //为控制器添加按钮
    for (int i=0; i<self.viewControllers.count; i++) { //根据有多少个子视图控制器来进行添加按钮
        NSString *imageName = [NSString stringWithFormat:@"%@", array[i]];
        NSString *imageNameSel = [NSString stringWithFormat:@"%@_select",array[i]];
//        MyNSLog(@"array = %@",array[i]);
        UIImage *image = [UIImage imageNamed:imageName];
        UIImage *imageSel = [UIImage imageNamed:imageNameSel];
        [myView addButtonWithImage:image selectedImage:imageSel andTitle:titleArray[i]];
    }
}
/**
 *  初始化四个自控制器
 */
- (void)initChildViewController
{
    //首页导航控制器
    SquareViewController *square = [[SquareViewController alloc] init];
//    HomeViewController *homeView = [[HomeViewController alloc] init];
    //附近的人
    NearbyViewController *nearbyView = [[NearbyViewController alloc] init];
    FoodCircleViewController *foodCircleView = [[FoodCircleViewController alloc] init];
    PersonViewController *personView = [[PersonViewController alloc] init];

    self.viewControllers = @[square,nearbyView,foodCircleView,personView];
}
/**永远别忘记设置代理*/
- (void)tabBar:(MainTabBarView *)tabBar selectedFrom:(NSInteger)from to:(NSInteger)to {
    MyNSLog(@"delegate ---- from %li   to %li  ",(long)from,(long)to);
    self.selectedIndex = to;
}

/**
 *  自定义TabBar的按钮点击事件
 */
//- (void)clickBtn:(UIButton *)button {
//  //1.先将之前选中的按钮设置为未选中
//  self.selectedBtn.selected = NO;
//  //2.再将当前按钮设置为选中
//  button.selected = YES;
//  //3.最后把当前按钮赋值为之前选中的按钮
//  self.selectedBtn = button;
//  
//    //4.跳转到相应的视图控制器. (通过selectIndex参数来设置选中了那个控制器)  
//    self.selectedIndex = button.tag;  
//}

@end
