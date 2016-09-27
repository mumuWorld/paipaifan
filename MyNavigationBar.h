//
//  MyNavigationBar.h
//  paipaifan
//
//  Created by YangJie on 2016/9/22.
//  Copyright © 2016年 YangJie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyNavigationBar : UIView

@property (weak, nonatomic)  UIView *leftView;
@property (weak, nonatomic)  UIView *rightView;
@property (weak, nonatomic)  UIView *centerView;


@property (weak, nonatomic)  UIButton *leftBtn;
@property (weak, nonatomic)  UIButton *rightBtn;
@property (weak, nonatomic)  UILabel *centerLbl;

+ (instancetype)myNavigationInitWithFrame:(CGRect)frame;
- (instancetype)initMyNavigationWithFrame:(CGRect)frame;

@end
