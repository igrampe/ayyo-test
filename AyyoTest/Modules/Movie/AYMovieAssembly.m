//
//  AYMovieAssembly.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 16/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYMovieAssembly.h"
#import "AYMovieViewController.h"
#import "AYMovieWireframe.h"

@implementation AYMovieAssembly

- (AYMovieViewController *)viewMovie
{
    return [TyphoonDefinition withClass:[AYMovieViewController class]
                          configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(output)
                              with:[self wireframeMovie]];
    }];
}

- (AYMovieWireframe *)wireframeMovie
{
    return [TyphoonDefinition withClass:[AYMovieWireframe class]
                          configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(view)
                              with:[self viewMovie]];
    }];
}

@end
