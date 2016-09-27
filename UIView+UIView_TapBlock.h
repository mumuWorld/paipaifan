//
//  UIView+UIView_TapBlock.h
//  test_JLLJ
//
//  Created by kaowo on 11/27/15.
//  Copyright © 2015 ZhengChaoJie. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIView (UIView_TapBlock)
/**
 *  手势回调 Block
 *
 *  @param block 
 */
- (void)setTapActionWithBlock:(void (^)(void))block;
@end
