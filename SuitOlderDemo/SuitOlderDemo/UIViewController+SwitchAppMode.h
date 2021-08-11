//
//  UIViewController+SwitchAppMode.h
//  SwitchAppMode
//
//  Created by mac  on 2021/8/6.
//  Copyright © 2021 Tuniu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (SwitchAppMode)
/**
    不需要重置的view
 */
- (NSArray *)excludeSubviews;

/**
    是否需要适老化切换
 */
- (BOOL)checkSwitchAppMode;

@end

NS_ASSUME_NONNULL_END
