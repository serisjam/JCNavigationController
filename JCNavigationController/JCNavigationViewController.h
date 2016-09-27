//
//  JCNavigationViewController.h
//  JCNavigationController
//
//  Created by Jam on 16/3/28.
//  Copyright © 2016年 Jam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCNavigationViewController : UINavigationController

/**
 *  @author Jam, 16-09-27 22:09:16
 *
 *  移除的第几个层级
 *
 *  @param index navigation的第几个层级
 */
- (void)removeAtIndex:(NSInteger)index;

@end
