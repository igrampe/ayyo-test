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

@implementation AYAppAssembly

- (AppDelegate *)appDelegate
{
    return [TyphoonDefinition withClass:[AppDelegate class]
                          configuration:^(TyphoonDefinition *definition)
            {
                [definition injectProperty:@selector(window) with:self.mainWindow];
                [definition injectProperty:@selector(rootWireframe) with:[self.rootAssembly wireframeRoot]];
            }];
}

- (UIWindow *)mainWindow
{
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    return window;
}

@end
