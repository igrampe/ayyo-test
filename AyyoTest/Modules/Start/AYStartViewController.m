//
//  AYStartViewController.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 16/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYStartViewController.h"
#import "AYStartViewOutput.h"

#import <PureLayout.h>

@interface AYStartViewController ()

@property (nonatomic, strong) UIButton *openMovieButton;

@property (nonatomic, assign) BOOL didSetupConstraints;

@end

@implementation AYStartViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupView];
    [self.output viewDidLoad];
}

- (void)setupView
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.openMovieButton = [UIButton newAutoLayoutView];
    [self.openMovieButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.openMovieButton setTitle:NSLS(@"Фильм") forState:UIControlStateNormal];
    [self.openMovieButton addTarget:self.output
                             action:@selector(actionOpenMovie)
                   forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.openMovieButton];
    
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
}

- (void)updateViewConstraints
{
    [super updateViewConstraints];
    if (!self.didSetupConstraints)
    {
        [self.openMovieButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.openMovieButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
        self.didSetupConstraints = YES;
    }
}

@end
