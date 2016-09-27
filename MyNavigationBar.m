//
//  MyNavigationBar.m
//  paipaifan
//
//  Created by YangJie on 2016/9/22.
//  Copyright © 2016年 YangJie. All rights reserved.
//

#import "MyNavigationBar.h"
#import "Common.h"

@implementation MyNavigationBar
- (instancetype)initMyNavigationWithFrame:(CGRect)frame
{
    if (self = [super init]) {
        self.frame = frame;
        self.backgroundColor = CommonColor;
        
        
        
        CGFloat leftViewW = _leftView.frame.size.width;
        CGFloat centerViewW = SCREEN_WIDTH - 2*leftViewW;
        
        UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(leftViewW, 0, centerViewW, NAV_ITEM_HEIGHT)];
        self.centerView = view2;
        self.centerView.backgroundColor = CommonColor;
        [self addSubview:_centerView];
        
        UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(leftViewW + centerViewW, 0, NAV_ITEM_HEIGHT, NAV_ITEM_HEIGHT)];
        self.rightView = view3;
        self.rightView.backgroundColor = CommonColor;
        [self addSubview:_rightView];
        
        [self initLeftItemButton];
        [self initCenterButton];
        [self initRightItemButton];
    }
    return self;
}
+ (instancetype)myNavigationInitWithFrame:(CGRect)frame
{
   
    return [[self alloc] initMyNavigationWithFrame:frame];
}
- (void)initLeftItemButton
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, NAV_ITEM_WEIGHT, NAV_ITEM_HEIGHT)];
//    button.backgroundColor = CommonColor;
    [button addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.text = @"上海";
    button.titleLabel.textColor = [UIColor whiteColor];
//    button.imageView.image = [UIImage imageNamed:@"icon_city_districts_expand"];
    _leftBtn = button;
    [_leftView addSubview:_leftBtn];
}
- (void)initCenterButton
{
    
}
- (void)initRightItemButton
{
    
}
/**专门用来布局子视图, 别忘了调用super方法*/
- (void)layoutSubviews {
    [super layoutSubviews];
//    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, NAV_ITEM_HEIGHT);
//    self.backgroundColor = CommonColor;
    
//    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, NAV_ITEM_WEIGHT, NAV_ITEM_HEIGHT)];
//    self.leftView = view1;
//    [self addSubview:_leftView];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, NAV_ITEM_WEIGHT, NAV_ITEM_HEIGHT)];
    [button addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.text = @"上海";
    self.leftBtn = button;
    [self addSubview:_leftBtn];
    
    CGFloat leftViewW = _leftView.frame.size.width;
    CGFloat centerViewW = SCREEN_WIDTH - 2*leftViewW;
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(leftViewW, 0, centerViewW, NAV_ITEM_HEIGHT)];
    self.centerView = view2;
    self.centerView.backgroundColor = CommonColor;
    [self addSubview:_centerView];
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(leftViewW + centerViewW, 0, NAV_ITEM_WEIGHT, NAV_ITEM_HEIGHT)];
    self.rightView = view3;
    self.rightView.backgroundColor = CommonColor;
    [self addSubview:_rightView];
    
    [self initLeftItemButton];
    [self initCenterButton];
    [self initRightItemButton];
//
//    int count = (int)self.subviews.count;
//    for (int i = 0; i < count; i++) {
//        //获取到按钮
////        MainTabBarItem *btn = self.subviews[i];
//        btn.tag = i; //设置按钮的标记, 方便来索引当前的按钮,并跳转到相应的视图
//        CGFloat x = i * self.bounds.size.width / count;
//        CGFloat y = 0;
//        CGFloat width = self.bounds.size.width / count;
//        CGFloat height = self.bounds.size.height;
//        btn.frame = CGRectMake(x, y, width, height);
//        [btn initButton:btn];
//    }
}
/**
 *  自定义TabBar的按钮点击事件
 */
- (void)clickBtn:(UIButton *)button {
    MyNSLog(@"clickBTN---------");
//    //1.先将之前选中的按钮设置为未选中
//    self.selectedBtn.selected = NO;
//    //2.再将当前按钮设置为选中
//    button.selected = YES;
//    //3.最后把当前按钮赋值为之前选中的按钮
//    self.selectedBtn = button;
//    //却换视图控制器的事情,应该交给controller来做
//    //最好这样写, 先判断该代理方法是否实现
//    if ([self.delegate respondsToSelector:@selector(tabBar:selectedFrom:to:)]) {
//        [self.delegate tabBar:self selectedFrom:self.selectedBtn.tag to:button.tag];
//    }
    //4.跳转到相应的视图控制器. (通过selectIndex参数来设置选中了那个控制器)
    //self.selectedIndex = button.tag;
}
- (void)addButtonWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage andTitle:(NSString *)title {
//    //    UIButton *btn = [[UIButton alloc] init];
//    
//    //    [btn setImage:image forState:UIControlStateNormal];
//    //    [btn setImage:selectedImage forState:UIControlStateSelected];
//    MainTabBarItem *btn = [[MainTabBarItem alloc] initWithTitle:title andImage:image andSelectImage:selectedImage];
//    
//    [self addSubview:btn];
//    
//    //带参数的监听方法记得加"冒号"
//    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
//    
//    //如果是第一个按钮, 则选中(按顺序一个个添加)
//    if (self.subviews.count == 1) {
//        [self clickBtn:btn];
//    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
