//
//  AYBuyMovieAssembly.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "AYBuyMovieAssembly.h"
#import "AYBuyMovieViewController.h"
#import "AYBuyMovieWireframe.h"

@implementation AYBuyMovieAssembly

- (AYBuyMovieViewController *)viewBuyMovie
{
    return [TyphoonDefinition withClass:[AYBuyMovieViewController class]
                          configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(output)
                              with:[self wireframeBuyMovie]];
    }];
}

- (AYBuyMovieWireframe *)wireframeBuyMovie
{
    return [TyphoonDefinition withClass:[AYBuyMovieWireframe class]
                          configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(view)
                              with:[self viewBuyMovie]];
    }];
}

@end
