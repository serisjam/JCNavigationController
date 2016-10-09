//
//  JCNavigationViewController.m
//  JCNavigationController
//
//  Created by Jam on 16/3/28.
//  Copyright © 2016年 Jam. All rights reserved.
//

#import "JCNavigationViewController.h"
#import "JCWrapViewController.h"

#import "UIViewController+JCNavigationControllerExtension.h"

@interface JCNavigationViewController () <UINavigationControllerDelegate>

@property (nonatomic, strong) UIPanGestureRecognizer *popPanGesture;

@property (nonatomic, strong) id popGestureDelegate;

@end

@implementation JCNavigationViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        UIViewController *controller = self.viewControllers.firstObject;
        controller.jcNavigationController = self;
        JCWrapViewController *wrapViewController = [JCWrapViewController wrapViewControllerWithRootController:controller];
        self.viewControllers = @[wrapViewController];
    }
    
    return self;
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    JCWrapViewController *wrapViewController = [JCWrapViewController wrapViewControllerWithRootController:rootViewController];
    
    if (self = [super initWithRootViewController:wrapViewController]) {
        rootViewController.jcNavigationController = self;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationBarHidden:YES];
    
    self.delegate = self;
    self.popGestureDelegate = self.interactivePopGestureRecognizer.delegate;
    SEL action = NSSelectorFromString(@"handleNavigationTransition:");
    self.popPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self.popGestureDelegate action:action];
    self.popPanGesture.maximumNumberOfTouches = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark public method

- (void)removeAtIndex:(NSInteger)index {
    if (index < 0 || index > [self.viewControllers count]) {
        return ;
    }
    NSMutableArray *viewControllers = [NSMutableArray arrayWithArray:self.viewControllers];
    [viewControllers removeObjectAtIndex:index];
    self.viewControllers = viewControllers;
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (viewController == navigationController.viewControllers.firstObject) {
        [self.view removeGestureRecognizer:self.popPanGesture];
    } else {
        [self.view addGestureRecognizer:self.popPanGesture];
    }
    self.interactivePopGestureRecognizer.delegate = self.popGestureDelegate;
    self.interactivePopGestureRecognizer.enabled = NO;
}

@end
