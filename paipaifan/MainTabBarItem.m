//
//  MainTabBarITem.m
//  paipaifan
//
//  Created by YangJie on 16/8/11.
//  Copyright © 2016年 YangJie. All rights reserved.
//

#import "MainTabBarItem.h"

@implementation MainTabBarItem

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithTitle:(NSString *)title andImage:(UIImage *)image andSelectImage:(UIImage *)selectImage
{
    self = [super init];
    if (self) {
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitle:title forState:UIControlStateSelected];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self setImage:image forState:UIControlStateNormal];
        [self setImage:selectImage forState:UIControlStateSelected];
        self.backgroundColor = [UIColor colorWithRed:188.0/255.0 green:143.0/255.0 blue:143.0/255.0 alpha:1];
    }
    return self;
}
-(void)initButton:(UIButton*)btn{
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(btn.imageView.frame.size.height ,-btn.imageView.frame.size.width, 0.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [btn setImageEdgeInsets:UIEdgeInsetsMake(-10, 0.0,0.0, -btn.titleLabel.bounds.size.width)];//图片距离右边框距离减少图片的宽度，其它不边
}
/**
  什么也不做就可以取消系统按钮的高亮状态
*/
- (void)setHighlighted:(BOOL)highlighted{
    //    [super setHighlighted:highlighted];
}  

@end
