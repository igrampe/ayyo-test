//
//  AYBuySuccessAssembly.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 18/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "AYBuySuccessAssembly.h"
#import "AYBuySuccessViewController.h"
#import "AYBuySuccessWireframe.h"

@implementation AYBuySuccessAssembly

- (AYBuySuccessViewController *)viewBuySuccess
{
    return [TyphoonDefinition withClass:[AYBuySuccessViewController class]
                          configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(output)
                              with:[self wireframeBuySuccess]];
    }];
}

- (AYBuySuccessWireframe *)wireframeBuySuccess
{
    return [TyphoonDefinition withClass:[AYBuySuccessWireframe class]
                          configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(view)
                              with:[self viewBuySuccess]];
    }];
}

@end
