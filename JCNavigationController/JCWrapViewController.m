//
//  JCWrapViewController.m
//  JCNavigationController
//
//  Created by Jam on 16/3/29.
//  Copyright © 2016年 Jam. All rights reserved.
//

#import "JCWrapViewController.h"
#import "JCWrapNavigationController.h"

@interface JCWrapViewController ()

@end

@implementation JCWrapViewController

+ (JCWrapViewController *)wrapViewControllerWithRootController:(UIViewController *)rootViewController {
    
    JCWrapNavigationController *wrapNavController = [[JCWrapNavigationController alloc] init];
    wrapNavController.viewControllers = @[rootViewController];
    
    JCWrapViewController *wrapViewController = [[JCWrapViewController alloc] init];
    [wrapViewController.view addSubview:wrapNavController.view];
    [wrapViewController addChildViewController:wrapNavController];
    
    return wrapViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)hidesBottomBarWhenPushed {
    return [self rootViewController].hidesBottomBarWhenPushed;
}

- (UITabBarItem *)tabBarItem {
    return [self rootViewController].tabBarItem;
}

- (NSString *)title {
    return [self rootViewController].title;
}

- (UIViewController *)childViewControllerForStatusBarStyle {
    return [self rootViewController];
}

- (UIViewController *)childViewControllerForStatusBarHidden {
    return [self rootViewController];
}

#pragma mark private method

- (UIViewController *)rootViewController {
    JCWrapNavigationController *wrapNavController = [[self childViewControllers] firstObject];
    return wrapNavController.childViewControllers.firstObject;
}

@end
