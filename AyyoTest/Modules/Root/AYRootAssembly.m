//
//  AYRootAssembly.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 16/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYRootAssembly.h"
#import "AYRootViewController.h"
#import "AYRootWireframe.h"

#import "AYStartAssembly.h"

@interface AYRootAssembly ()

@property (nonatomic, strong, readonly) AYStartAssembly *startAssembly;

@end

@implementation AYRootAssembly

- (AYRootViewController *)viewRoot
{
    return [TyphoonDefinition withClass:[AYRootViewController class]
                          configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(output)
                              with:[self wireframeRoot]];
    }];
}

- (AYRootWireframe *)wireframeRoot
{
    return [TyphoonDefinition withClass:[AYRootWireframe class]
                          configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(view)
                              with:[self viewRoot]];
        [definition injectProperty:@selector(startWireframe)
                              with:[self.startAssembly wireframeStart]];
    }];
}

@end
