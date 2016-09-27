//
//  MainTabBarITem.h
//  paipaifan
//
//  Created by YangJie on 16/8/11.
//  Copyright © 2016年 YangJie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTabBarItem : UIButton
/**
 *  初始化tabbar item  上下结构
 *
 *  @param title       文字
 *  @param image       正常图片
 *  @param selectImage 选中图片
 *  @param frame       fram
 *
 *  @return 返回item
 */
- (instancetype)initWithTitle:(NSString *)title andImage:(UIImage *)image andSelectImage:(UIImage *)selectImage;
/**
 *  设置item 文字上下
 *
 *  @param btn
 */
-(void)initButton:(UIButton*)btn;
@end
