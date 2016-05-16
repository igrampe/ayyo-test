//
//  AYAppConfiguratorImp.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 16/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYAppConfiguratorImp.h"

#import <UIKit/UIKit.h>
#import "APLColorScheme.h"

@implementation AYAppConfiguratorImp

- (void)registerColorScheme
{
    [APLColorScheme registerColorScheme];
}

- (void)patchUI
{
    [[UINavigationBar appearance] setBackgroundColor:[UIColor clearColor]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new]
                                       forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTranslucent:YES];
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
}

@end
