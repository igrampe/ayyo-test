//
//  AYAppAssembly.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 16/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYAppAssembly.h"

#import "AppDelegate.h"
#import "AYRootAssembly.h"
#import "AYAppConfiguratorImp.h"

@implementation AYAppAssembly

- (AppDelegate *)appDelegate
{
    return [TyphoonDefinition withClass:[AppDelegate class]
                          configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(window) with:self.mainWindow];
        [definition injectProperty:@selector(appConfigurator) with:self.appConfigurator];
        [definition injectProperty:@selector(rootWireframe) with:[self.rootAssembly wireframeRoot]];
    }];
}

- (UIWindow *)mainWindow
{
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    return window;
}

- (AYAppConfiguratorImp *)appConfigurator
{
    AYAppConfiguratorImp *configurator = [AYAppConfiguratorImp new];
    return configurator;
}

@end
