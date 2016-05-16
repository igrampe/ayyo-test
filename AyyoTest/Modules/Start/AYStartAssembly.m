//
//  AYStartAssembly.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 16/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYStartAssembly.h"
#import "AYStartViewController.h"
#import "AYStartWireframe.h"

#import "AYMovieAssembly.h"

@interface AYStartAssembly ()

@property (nonatomic, strong, readonly) AYMovieAssembly *movieAssembly;

@end

@implementation AYStartAssembly

- (AYStartViewController *)viewStart
{
    return [TyphoonDefinition withClass:[AYStartViewController class]
                          configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(output)
                              with:[self wireframeStart]];
    }];
}

- (AYStartWireframe *)wireframeStart
{
    return [TyphoonDefinition withClass:[AYStartWireframe class]
                          configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(view)
                              with:[self viewStart]];
        [definition injectProperty:@selector(movieWireframe)
                              with:[self.movieAssembly wireframeMovie]];
    }];
}

@end
