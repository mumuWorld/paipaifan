//
//  SquareCellFrame.h
//  paipaifan
//
//  Created by YangJie on 16/9/18.
//  Copyright © 2016年 YangJie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class SquareInfo;
@class Common;
@interface SquareCellFrame : NSObject
/**
 *  头像的frame
*/
@property (nonatomic, assign) CGRect iconF;
/**
 *  名字的frame
 */
@property (nonatomic, assign) CGRect nameF;
/**
 *  vip的frame
 */
@property (nonatomic, assign) CGRect vipF;
/**
 *  正文的frame
 */
@property (nonatomic, assign) CGRect textF;
/**
 *  图片的frame
 */
@property (nonatomic, assign) CGRect pictrueF;

/**
 *  cell行高
 */
@property (nonatomic, assign) CGFloat cellHeight;
/**
 *  数据模型
 */
@property (nonatomic,strong) SquareInfo *squareInfo;

@property (nonatomic,strong) Common * common;

@end
