//
//  JCWrapNavigationController.m
//  JCNavigationController
//
//  Created by Jam on 16/3/28.
//  Copyright © 2016年 Jam. All rights reserved.
//

#import "JCWrapNavigationController.h"
#import "JCWrapViewController.h"
#import "UIViewController+JCNavigationControllerExtension.h"

@interface JCWrapNavigationController ()

@end

@implementation JCWrapNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    return [self.navigationController popViewControllerAnimated:animated];
}

- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated {
    return [self.navigationController popToRootViewControllerAnimated:animated];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"item_back"] style:UIBarButtonItemStylePlain target:nil action:@selector(didTapBackButton)];
    
    [self.navigationController pushViewController:[JCWrapViewController wrapViewControllerWithRootController:viewController] animated:animated];
    viewController.jcNavigationController = (JCNavigationViewController *)self.navigationController;
}

- (void)didTapBackButton {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion{
    [self.navigationController dismissViewControllerAnimated:flag completion:completion];
    self.viewControllers.firstObject.jcNavigationController = nil;
}

@end
