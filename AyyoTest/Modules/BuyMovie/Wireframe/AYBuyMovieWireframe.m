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

#import "AYBuySuccessWireframe.h"
#import "AYBuySuccessAssembly.h"

@interface AYBuyMovieWireframe () <AYBuySuccessModuleOutput>

@property (nonatomic, strong) NSTimer *buyTimer;

@property (nonatomic, strong) AYBuySuccessWireframe *buySuccessWireframe;

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

#pragma mark - AYBuySuccessViewOutput

- (void)buySuccessModuleDidCancel:(AYBuySuccessWireframe *)module
{
    if (module == self.buySuccessWireframe)
    {
        [self.buySuccessWireframe.view dismissViewControllerAnimated:YES completion:nil];
        self.buySuccessWireframe = nil;
        [self.output buyMovieModuleDidCancel:self];
    }
}

#pragma mark - Private

- (void)_triggerBuyTimer
{
    self.buyTimer = nil;
    [self.view hideLoader];
    [self _openBuySuccessModule];
}

- (void)_openBuySuccessModule
{
    AYBuySuccessAssembly *buySuccessAssembly = [[AYBuySuccessAssembly new] activate];
    self.buySuccessWireframe = [buySuccessAssembly wireframeBuySuccess];
    self.buySuccessWireframe.output = self;
    [self.view presentViewController:self.buySuccessWireframe.view animated:YES completion:nil];
}

@end
