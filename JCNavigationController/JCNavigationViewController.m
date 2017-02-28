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

@interface JCNavigationViewController () <UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIPanGestureRecognizer *popPanGesture;

@property (nonatomic, strong) id popGestureDelegate;

@end

@implementation JCNavigationViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        UIViewController *controller = self.viewControllers.firstObject;
        self.viewControllers = @[];
        [self pushViewController:controller animated:NO];
    }
    
    return self;
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    
    if (self = [super initWithRootViewController:rootViewController]) {
        self.viewControllers = @[];
        [self pushViewController:rootViewController animated:NO];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationBarHidden:YES];
    
    self.interactivePopGestureRecognizer.enabled = NO;
    self.popGestureDelegate = self.interactivePopGestureRecognizer.delegate;
    SEL action = NSSelectorFromString(@"handleNavigationTransition:");
    self.popPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self.popGestureDelegate action:action];
    self.popPanGesture.maximumNumberOfTouches = 1;
    self.popPanGesture.delegate = self;
    
    [self.view addGestureRecognizer:self.popPanGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (!viewController.navigationItem.leftBarButtonItem && [self.viewControllers count] != 0) {
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"item_back"] style:UIBarButtonItemStylePlain target:nil action:@selector(didTapBackButton)];
    }
    viewController.jcNavigationController = self;
    [super pushViewController:[JCWrapViewController wrapViewControllerWithRootController:viewController] animated:animated];
}

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated {
    NSMutableArray *controllers = [NSMutableArray arrayWithCapacity:[viewControllers count]];
    for (UIViewController *controller in viewControllers) {
        if ([controller isKindOfClass:[JCWrapViewController class]]) {
            [controllers addObject:controller];
        } else {
            if ([viewControllers indexOfObject:controller] != 0) {
                controller.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"item_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:nil action:@selector(didTapBackButton)];
            }
            controller.jcNavigationController = self;
            [controllers addObject:[JCWrapViewController wrapViewControllerWithRootController:controller]];
        }
    }
    [super setViewControllers:controllers animated:animated];
}

- (void)didTapBackButton {
    [self popViewControllerAnimated:YES];
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

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer; {
    
    // Prevent calling the handler when the gesture begins in an opposite direction.
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
    if (translation.x <= 0) {
        return NO;
    }
    
    return self.childViewControllers.count > 1;
}

@end
