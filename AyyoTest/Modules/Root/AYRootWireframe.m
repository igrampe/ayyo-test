//
//  AYRootWireframe.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 16/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYRootWireframe.h"

#import "AYRootViewOutput.h"

#import "AYStartWireframe.h"

@interface AYRootWireframe ()


@end

@implementation AYRootWireframe

- (void)openModuleInWindow:(UIWindow *)window
{
    window.rootViewController = self.view;
}

- (void)viewDidLoad
{
    [self openStartModule];    
}

- (void)openStartModule
{
    UINavigationController *navCtl = [[UINavigationController alloc] initWithRootViewController:self.startWireframe.view];
    [self.view addChildViewController:navCtl];
    [self.view.view addSubview:navCtl.view];
    navCtl.view.frame = self.view.view.bounds;
}

@end
