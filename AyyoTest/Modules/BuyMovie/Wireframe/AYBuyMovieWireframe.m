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

@interface AYBuyMovieWireframe ()

@property (nonatomic, strong) NSTimer *buyTimer;

@end

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
    if (self.buyTimer)
    {
        return;
    }
    [self.output buyMovieModuleDidCancel:self];
}

- (void)actionBuy
{
    if (self.buyTimer)
    {
        return;
    }
    [self.view showLoader];
    self.buyTimer = [NSTimer scheduledTimerWithTimeInterval:3
                                                     target:self
                                                   selector:@selector(_triggerBuyTimer)
                                                   userInfo:nil
                                                    repeats:NO];
}

#pragma mark - Private

- (void)_triggerBuyTimer
{
    self.buyTimer = nil;
    [self.view hideLoader];
}

@end
