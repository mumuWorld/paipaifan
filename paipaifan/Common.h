//
//  Common.h
//  paipaifan
//
//  Created by YangJie on 16/8/15.
//  Copyright © 2016年 YangJie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Common : NSObject

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define CommonColor [UIColor colorWithRed:188.0/255.0 green:143.0/255.0 blue:143.0/255.0 alpha:1]

#define NAV_ITEM_HEIGHT 44.00
#define NAV_ITEM_WEIGHT 60.00

#define TABBAR_HEIGHT 44.00
#define NAV_HEIGHT 44.00
#define STATUS_BAR 20.00
//头像背景高度
#define HEAD_BACKGROUND_HEIGHT 200.00

//头像的宽高
#define HEAD_HEIGHT 60.00
#define HEAD_WIDTH 60.00

//用户名称高度
#define USER_NAME_HEIGHT 20.00
#define USER_NAME_WIDTH 

//间隙
#define PADDING 10.00

//squareCell中的字体
#define NameFont [UIFont systemFontOfSize:15]
#define TextFont [UIFont systemFontOfSize:16]
//tableview 最大滚动距离
#define MAX_ScroolHeight -SCREEN_HEIGHT*0.17
//customtabbar 字体颜色
#define CUSTOMTABBAR_TITLR_COLOR [UIColor whiteColor]
#define CUSTOMTABBAR_TITLE_FONT [UIFont boldSystemFontOfSize:16]


- (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize;

@end
