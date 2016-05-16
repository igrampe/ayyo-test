//
//  AppDelegate.h
//  AyyoTest
//
//  Created by Semyon Belokovsky on 16/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AYRootWireframe;
@protocol AYAppConfigurator;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) id<AYAppConfigurator> appConfigurator;
@property (nonatomic, strong) AYRootWireframe *rootWireframe;

@end

