//
//  UIView+KeyframeAnimation.m
//  LinkTop
//
//  Created by XiaoQiang on 2017/11/17.
//  Copyright © 2017年 XiaoQiang. All rights reserved.
//

#import "UIView+KeyframeAnimation.h"

#define kAnimationDuration 0.75
static char overlayKey;

@implementation UIView (KeyframeAnimation)


- (void)setShowAnimation:(NSNumber *)showAnimation {
    objc_setAssociatedObject(self, &overlayKey, showAnimation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)showAnimation {
    return objc_getAssociatedObject(self, &overlayKey);
}

- (void)showLogoAnimation {
    self.showAnimation = @(YES);
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = kAnimationDuration;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = YES;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.5, 1.5, 1)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)]];
    animation.values = values;
    animation.delegate = self;
    
    [self.layer addAnimation:animation forKey:@"show"];
    
}

- (void)hideLogoAnimation {
    self.showAnimation = @(NO);
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = kAnimationDuration;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = YES;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.5, 1.5, 1)]];
    animation.values = values;
    animation.delegate = self;
    
    [self.layer addAnimation:animation forKey:@"hide"];
}

- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"%@",self.showAnimation);
    if ([self.showAnimation boolValue]) {
        [UIView beginAnimations:@"fadeIn" context:nil];
        [UIView setAnimationDuration:kAnimationDuration];
        self.alpha = 1;
        [UIView commitAnimations];
    }
    else {
        [UIView beginAnimations:@"fadeIn" context:nil];
        [UIView setAnimationDuration:kAnimationDuration];
        self.alpha = 0.0;
        [UIView commitAnimations];
    }
}

@end
