//
//  UIViewController+SwitchAppMode.m
//  SwitchAppMode
//
//  Created by mac  on 2021/8/6.
//  Copyright © 2021 Tuniu. All rights reserved.
//

#import "UIViewController+SwitchAppMode.h"
#import <objc/runtime.h>
#import "CustomTabBarController.h"


@implementation UIViewController (SwitchAppMode)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        SEL originalSelector = @selector(viewDidLoad);
        SEL swizzledSelector = @selector(pt_viewDidLoad);
        Class cls = [self class];
        Method originalMethod = class_getInstanceMethod(cls, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(cls, swizzledSelector);
        
        BOOL didAddMethod = class_addMethod(cls, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (didAddMethod)
        {
            class_replaceMethod(cls, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)pt_viewDidLoad {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(reloadViews) name:@"ViewControllerShouldReloadNotification" object:nil];
    [self pt_viewDidLoad];
}

- (void)reloadViews {
    
    if (![self checkSwitchAppMode]) {
        return;
    }
    
    if ([self isKindOfClass:[CustomTabBarController class]]) {
        CustomTabBarController *controller = (CustomTabBarController *)self;
        [controller updateTabBar];
        return;
    }
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ViewControllerShouldReloadNotification" object:nil];
    if ([self isKindOfClass:[UINavigationController class]]) {
        return;
    }
    NSLog(@"%@", NSStringFromClass(self.class));
    [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"view = %@, index = %ld", NSStringFromClass(obj.class), idx+1);
        [obj removeFromSuperview];
    }];
    [self updateVariable];
    
    NSLog(@"-----------------------------------------------------------------------");
    [self viewDidLoad];
}


/** 设置子视图为空 */
- (void)updateVariable
{
    unsigned int count = 0;
    //获取属性列表
    Ivar *members = class_copyIvarList([self class], &count);
    //遍历修改值
    NSArray *excludeSubviews = [self excludeSubviews];
    for (int i = 0 ; i < count; i++) {
        Ivar var = members[i];
        const char *memberName = ivar_getName(var);
        const char *memberType = ivar_getTypeEncoding(var);
        NSString *nameStr = [NSString stringWithUTF8String:memberName];
        nameStr = [nameStr substringFromIndex:1];
        
        if (excludeSubviews && excludeSubviews.count > 0 && [excludeSubviews containsObject:nameStr]) {
            return;
        }

        NSString *typeStr = [NSString stringWithUTF8String:memberType];
        typeStr = [typeStr componentsSeparatedByString:@"\""][1];
        Class type = NSClassFromString(typeStr);
        //修改值
        if ([type isKindOfClass:[UIView class]] || [type isSubclassOfClass:[UIView class]]) {
            Ivar ivar = class_getInstanceVariable([self class], memberName);
            object_setIvar(self, ivar, nil);
        }
    }
    free(members);
}

- (NSArray *)excludeSubviews
{
    return @[];
}

- (BOOL)checkSwitchAppMode
{
    return YES;
}

@end
