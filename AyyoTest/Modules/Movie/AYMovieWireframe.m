//
//  AYMovieWireframe.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 16/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYMovieWireframe.h"

#import "AYMovieViewOutput.h"
#import "AYMovieViewInput.h"
#import "AYMoviePonso.h"

#import "AYBuyMovieAssembly.h"
#import "AYBuyMovieWireframe.h"

#import "AYBuyMovieModuleOutput.h"

@interface AYMovieWireframe () <AYBuyMovieModuleOutput>

@property (nonatomic, strong) AYMoviePonso *movie;

@property (nonatomic, strong) AYBuyMovieWireframe *buyWireframe;

@end

@implementation AYMovieWireframe

#pragma mark - AYMovieViewOutput

- (void)viewDidLoad
{
    [self mock];
    [self.view configureWithMovie:self.movie];
}

- (void)actionWatchMovie
{
    [self openBuyMovieModule];
}

- (void)actionTrailer
{
    NSURL *url = [NSURL URLWithString:self.movie.trailer_url];
    if ([[UIApplication sharedApplication] canOpenURL:url])
    {
        [[UIApplication sharedApplication] openURL:url];
    }
}

#pragma mark -

- (void)buyMovieModuleDidCancel:(AYBuyMovieWireframe *)module
{
    __weak typeof(self) welf = self;
    [UIView animateWithDuration:0.25
                     animations:
     ^
    {
        welf.view.view.transform = CGAffineTransformIdentity;
    }];
    [module closeWithHandler:
     ^
    {
        [module.view removeFromParentViewController];
        [module.view.view removeFromSuperview];
    }];
}

#pragma mark - Private

- (void)openBuyMovieModule
{
    AYBuyMovieAssembly *buyAssembly = [[AYBuyMovieAssembly new] activate];
    self.buyWireframe = [buyAssembly wireframeBuyMovie];
    self.buyWireframe.movie = self.movie;
    [self.view.navigationController addChildViewController:self.buyWireframe.view];
    [self.view.navigationController.view addSubview:self.buyWireframe.view.view];
    [self.buyWireframe.view didMoveToParentViewController:self.view];
    self.buyWireframe.view.view.frame = self.view.navigationController.view.bounds;
    self.buyWireframe.output = self;
    [self.buyWireframe openInVC:self.view];
    
    __weak typeof(self) welf = self;
    [UIView animateWithDuration:0.25
                     animations:
     ^
    {
        welf.view.view.transform = CGAffineTransformScale(welf.view.view.transform, 0.9, 0.9);
    }];
}

- (void)mock
{
    self.movie = [AYMoviePonso mock];
}

@end
