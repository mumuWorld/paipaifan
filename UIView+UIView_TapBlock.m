//
//  UIView+UIView_TapBlock.m
//  test_JLLJ
//
//  Created by kaowo on 11/27/15.
//  Copyright © 2015 ZhengChaoJie. All rights reserved.
//

#import "UIView+UIView_TapBlock.h"
#import <objc/runtime.h>

@implementation UIView (UIView_TapBlock)

static char kDTActionHandlerTapGestureKey;
static char kDTActionHandlerTapBlockKey;

- (void)setTapActionWithBlock:(void (^)(void))block {
    
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &kDTActionHandlerTapGestureKey);
    
    if (!gesture) {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(__handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kDTActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    
    objc_setAssociatedObject(self, &kDTActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}


- (void)__handleActionForTapGesture:(UITapGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateRecognized) {
        void(^action)(void) = objc_getAssociatedObject(self, &kDTActionHandlerTapBlockKey);
        
        if (action) {
            action();
        }
    }
}
@end
