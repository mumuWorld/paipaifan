//
//  SquareCellFrame.m
//  paipaifan
//
//  Created by YangJie on 16/9/18.
//  Copyright © 2016年 YangJie. All rights reserved.
//

#import "SquareCellFrame.h"
#import "Common.h"
#import "SquareInfo.h"



@implementation SquareCellFrame

-(void)setSquareInfo:(SquareInfo *)squareInfo
{
    _squareInfo = squareInfo;
    _common = [[Common alloc] init];
    
    // 设置头像的frame
    CGFloat iconViewX = PADDING;
    CGFloat iconViewY = PADDING;
    CGFloat iconViewW = 30;
    CGFloat iconViewH = 30;
    self.iconF = CGRectMake(iconViewX, iconViewY, iconViewW, iconViewH);
    
    // 设置昵称的frame
    // 昵称的x = 头像最大的x + 间隙
    CGFloat nameLabelX = CGRectGetMaxX(self.iconF) + PADDING;
    // 计算文字的宽高
    CGSize nameSize = [_common sizeWithString:_squareInfo.userName font:NameFont maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    
    CGFloat nameLabelH = nameSize.height;
    CGFloat nameLabelW = nameSize.width;
    CGFloat nameLabelY = iconViewY + (iconViewH - nameLabelH) * 0.5;
    self.nameF = CGRectMake(nameLabelX, nameLabelY, nameLabelW, nameLabelH);
    
    // 设置vip的frame
    CGFloat vipViewX = CGRectGetMaxX(self.nameF) + PADDING;
    CGFloat vipViewY = nameLabelY;
    CGFloat vipViewW = 14;
    CGFloat vipViewH = 14;
    self.vipF = CGRectMake(vipViewX, vipViewY, vipViewW, vipViewH);
    
    // 设置正文的frame
    CGFloat textLabelX = iconViewX;
    CGFloat textLabelY = CGRectGetMaxY(self.iconF) + PADDING;
    CGSize textSize =  [_common sizeWithString:_squareInfo.userText font:TextFont maxSize:CGSizeMake(SCREEN_WIDTH-PADDING *2, MAXFLOAT)];
    
    CGFloat textLabelW = textSize.width;
    CGFloat textLabelH = textSize.height;
    
    self.textF = CGRectMake(textLabelX, textLabelY, textLabelW, textLabelH);
    
    // 设置配图的frame
    if (_squareInfo.userPicture) {// 有配图
        CGFloat pictureViewX = iconViewX;
        CGFloat pictureViewY = CGRectGetMaxY(self.textF) + PADDING;
        CGFloat pictureViewW = 100;
        CGFloat pictureViewH = 100;
        self.pictrueF = CGRectMake(pictureViewX, pictureViewY, pictureViewW, pictureViewH);
        
        // 计算行高
        self.cellHeight = CGRectGetMaxY(self.pictrueF) + PADDING;
    } else {
        // 没有配图情况下的行高
        self.cellHeight = CGRectGetMaxY(self.textF) + PADDING;
    }
}


@end
