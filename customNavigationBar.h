//
//  customNavigationBar.h
//  paipaifan
//
//  Created by YangJie on 2016/9/23.
//  Copyright © 2016年 YangJie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Common.h"
#import "UIView+UIView_TapBlock.m"
typedef void(^ItemBlock)(void);


@interface customNavigationBar : UIView
- (void)addBottomLineLabelWithFrame:(CGRect)frame color:(UIColor *)mycolor;
/**
 *  CustomTabBar bottomLineLabel
 */
@property (nonatomic, strong) UILabel *bottomLineLabel;
/**
 *  CustomTabBar leftItem
 */
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *leftBtn2;
/**
 *  CustomTabBar reightItem
 */
@property (nonatomic, strong) UIButton *reightBtn;
@property (nonatomic, strong) UIButton *reightBtn2;
/**
 *  CustomTabBar title
 */
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *titleBtn;
/**
 *  增大 item 的可触控范围 View
 */
@property (nonatomic, strong) UIView *clearView_LEFT;
@property (nonatomic, strong) UIView *clearView_LEFT2;
/**
 *  增大 item 的可触控范围 View
 */
@property (nonatomic, strong) UIView *clearView_REIGHT;
@property (nonatomic, strong) UIView *clearView_REIGHT2;
/**
 *  左边 button 的 title
 */
@property (nonatomic, strong) UILabel *leftLabel;
/**
 *  右边 button 的 title
 */
@property (nonatomic, strong) UILabel *reightLabel;
/**
 *  自定义导航栏 初始化方法 -- Block 处理事件  加 buttonTitle
 *
 *  @param frame
 *  @param title
 *  @param bgColor
 *  @param leftImage
 *  @param leftBtnTitle        左边 button title
 *  @param leftBtnTitleColor   左边 button titleColor
 *  @param reightBtnTitle      右边 button title
 *  @param reightBtnTitleColor 右边 button titleColor
 *  @param reightImage
 *  @param leftBlock
 *  @param reightBlock
 *
 *  @return
 */
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title bgColor:(UIColor *)bgColor leftBtnImage:(UIImage *)leftImage leftBtnTitle:(NSString *)leftBtnTitle leftBtnTitleColor:(UIColor *)leftBtnTitleColor reigthBtnTitle:(NSString *)reightBtnTitle reightBtnTitleColor:(UIColor *)reightBtnTitleColor reightBtnImage:(UIImage *)reightImage leftBlock:(ItemBlock)leftBlock reightBlock:(ItemBlock)reightBlock;

@end
