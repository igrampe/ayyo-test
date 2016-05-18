//
//  AYBuySuccessWireframe.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 18/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "AYBuySuccessWireframe.h"

#import "AYBuySuccessViewOutput.h"

@implementation AYBuySuccessWireframe

- (void)actionClose
{
    [self.output buySuccessModuleDidCancel:self];
}

@end
