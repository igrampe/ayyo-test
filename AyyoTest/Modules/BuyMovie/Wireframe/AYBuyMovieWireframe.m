//
//  AYBuyMovieWireframe.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "AYBuyMovieWireframe.h"

#import "AYBuyMovieViewOutput.h"
#import "AYBuyMovieViewInput.h"
#import "AYBuyMovieModuleOutput.h"

@implementation AYBuyMovieWireframe

- (void)openInVC:(UIViewController *)inVC
{
    [self.view animateOpeningInView:inVC.view];    
}

- (void)closeWithHandler:(void (^)(void))handler
{
    [self.view animateClosingWithHandler:handler];
}

#pragma mark - AYBuyMovieViewOutput

- (void)viewDidLoad
{
    [self.view configureWithMovie:self.movie];
}

- (void)actionCancel
{
    [self.output buyMovieModuleDidCancel:self];
}

@end
