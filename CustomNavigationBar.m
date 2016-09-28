//
//  customNavigationBar.m
//  paipaifan
//
//  Created by YangJie on 2016/9/23.
//  Copyright © 2016年 YangJie. All rights reserved.
//

#import "CustomNavigationBar.h"
#import "Common.h"

@implementation CustomNavigationBar
/**
 *  添加自定义 TabBar 的 title
 *
 *  @param frame_view
 *  @param title
 */
- (void)addTitleLabelWithFrame:(CGRect)frame_view title:(NSString *)title {
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 20, width(frame_view) - 40 * 2, 44)];
    _titleLabel.text = title;
    _titleLabel.textColor = WHITE_COLOR;
    _titleLabel.font = CUSTOMTABBAR_TITLE_FONT;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_titleLabel];
}
/**
 *  reightItem  + title
 *
 *  @param frame_view
 *  @param image
 *  @param reightBlock
 */
- (void)addReightButtonWithFrame:(CGRect)frame_view image:(UIImage *)image title:(NSString *)title reigthBtnTitleColor:(UIColor *)reigthBtnTitleColor reightBlock:(ItemBlock)reightBlock {
    __weak typeof(self) weakSelf = self;
    _reightBtn = [[UIButton alloc] initWithFrame:CGRectMake(width(frame_view) - 30, 34, 18, 18)];
    [_reightBtn setBackgroundImage:image forState:UIControlStateNormal];
    CGSize tempReightBtnTitleSize = [[Common commonShareInstance] sizeWithString:title font:TextFont maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    _reightLabel = [[UILabel alloc] initWithFrame:CGRectMake(image ? (minX(_reightBtn) - tempReightBtnTitleSize.width):(width(frame_view) - 12 - tempReightBtnTitleSize.width), 19, tempReightBtnTitleSize.width, 44)];
    _reightLabel.text = title;
    _reightLabel.adjustsFontSizeToFitWidth = YES;
    _reightLabel.textColor = reigthBtnTitleColor;
    _clearView_REIGHT = [[UIView alloc] initWithFrame:CGRectMake(width(frame_view) - 30 - tempReightBtnTitleSize.width, 22, 33 + tempReightBtnTitleSize.width, 40)];
    _clearView_REIGHT.backgroundColor = [UIColor clearColor];
    _clearView_REIGHT.userInteractionEnabled = YES;
    
    [_clearView_REIGHT setTapActionWithBlock:^{
        if ((image && reightBlock) || title) {
            [UIView animateWithDuration:0.1 animations:^{
                weakSelf.reightLabel.alpha = 0.6f;
                weakSelf.reightBtn.alpha = 0.6;
            } completion:^(BOOL finished) {
                weakSelf.reightLabel.alpha = 1.0f;
                weakSelf.reightBtn.alpha = 1;
            }];
            reightBlock();
        }
    }];
    [self addSubview:_reightLabel];
    [self addSubview:_reightBtn];
    [self addSubview:_clearView_REIGHT];
}
/**
 *  leftItem + title
 *
 *  @param frame_view
 *  @param image
 *  @param leftBlock
 */
- (void)addLeftButtonWithFrame:(CGRect)frame_view image:(UIImage *)image title:(NSString *)title leftBtnTitleColor:(UIColor *)leftBtnTitleColor leftBlock:(ItemBlock)leftBlock {
    __weak typeof(self) weakSelf = self;
    CGSize tempLeftLabelTitleSize = [[Common commonShareInstance] sizeWithString:title font:TextFont maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    _leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 34, tempLeftLabelTitleSize.width, 18)];
    _leftLabel.text = title;
    _leftLabel.adjustsFontSizeToFitWidth = YES;
    _leftLabel.textColor = leftBtnTitleColor;
    
    _leftBtn = [[UIButton alloc] initWithFrame:CGRectMake((image) ? maxX(_leftLabel)+2 : 12, 5 + minY(_leftLabel), 10, 10)];
    [_leftBtn setBackgroundImage:image forState:UIControlStateNormal];
    
    _clearView_LEFT = [[UIView alloc] initWithFrame:CGRectMake(0, 22, 30 + tempLeftLabelTitleSize.width, 40)];
    _clearView_LEFT.backgroundColor = [UIColor clearColor];
    _clearView_LEFT.userInteractionEnabled = YES;
    
    [_clearView_LEFT setTapActionWithBlock:^{
        if ((image && leftBlock) || title) {
            [UIView animateWithDuration:0.1 animations:^{
                weakSelf.leftLabel.alpha = 0.6f;
                weakSelf.leftBtn.alpha = 0.6;
            } completion:^(BOOL finished) {
                weakSelf.leftLabel.alpha = 1.0f;
                weakSelf.leftBtn.alpha = 1;
            }];
            leftBlock();
        }
    }];
    [self addSubview:_leftLabel];
    [self addSubview:_leftBtn];
    [self addSubview:_clearView_LEFT];
}
/**
 *  自定义导航栏 初始化方法 -- Block 处理事件 加 buttonTitle
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
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title bgColor:(UIColor *)bgColor leftBtnImage:(UIImage *)leftImage leftBtnTitle:(NSString *)leftBtnTitle leftBtnTitleColor:(UIColor *)leftBtnTitleColor reigthBtnTitle:(NSString *)reightBtnTitle reightBtnTitleColor:(UIColor *)reightBtnTitleColor reightBtnImage:(UIImage *)reightImage leftBlock:(ItemBlock)leftBlock reightBlock:(ItemBlock)reightBlock {
    if (self = [super initWithFrame:frame]) {
        [self addLeftButtonWithFrame:frame image:leftImage title:leftBtnTitle leftBtnTitleColor:leftBtnTitleColor leftBlock:leftBlock];
        [self addReightButtonWithFrame:frame image:reightImage title:reightBtnTitle reigthBtnTitleColor:reightBtnTitleColor reightBlock:reightBlock];
        [self addTitleLabelWithFrame:frame title:title];
        self.backgroundColor = bgColor;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
