//
//  UIView+KeyframeAnimation.h
//  LinkTop
//
//  为UIView以及子类增加关键帧动画，实现放大-隐藏 / 恢复-显示 两组动画效果
//
//  Created by XiaoQiang on 2017/11/17.
//  Copyright © 2017年 XiaoQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (KeyframeAnimation)<CAAnimationDelegate>

@property (nonatomic, strong) NSNumber *showAnimation;

- (void)showLogoAnimation;
- (void)hideLogoAnimation;

@end
