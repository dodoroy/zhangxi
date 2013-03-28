//
//  AppDelegate.h
//  Info
//
//  Created by 张 玺 on 13-3-26.
//  Copyright (c) 2013年 me.zhangxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MainViewController *viewController;
@property (strong, nonatomic) UINavigationController *navigationController;

@end
