//
//  UIViewController+JCNavigationControllerExtension.m
//  JCNavigationController
//
//  Created by Jam on 16/3/29.
//  Copyright © 2016年 Jam. All rights reserved.
//

#import "UIViewController+JCNavigationControllerExtension.h"
#import <objc/runtime.h>

@implementation UIViewController (JCNavigationControllerExtension)

- (void)setJcNavigationController:(JCNavigationViewController *)jcNavigationController {
    objc_setAssociatedObject(self, @selector(jcNavigationController), jcNavigationController, OBJC_ASSOCIATION_RETAIN);
}

- (JCNavigationViewController *)jcNavigationController {
    return objc_getAssociatedObject(self, _cmd);
}

@end
