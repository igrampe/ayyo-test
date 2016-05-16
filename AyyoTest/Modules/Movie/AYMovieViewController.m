//
//  AYMovieViewController.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 16/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYMovieViewController.h"
#import "AYMovieViewOutput.h"

#import <PureLayout.h>

#import "AYRoundedButton.h"
#import "AYGradientView.h"
#import "APLColorScheme.h"
#import "AYBluredCoverView.h"

@interface AYMovieViewController ()

@property (nonatomic, assign) BOOL didSetupConstraints;

@property (nonatomic, strong) AYBluredCoverView *bgCoverView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) AYGradientView *gradientView;


@end

@implementation AYMovieViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView
{
    self.bgCoverView = [AYBluredCoverView newAutoLayoutView];
    [self.bgCoverView configureWithImage:[UIImage imageNamed:@"cover"]];    
    [self.view addSubview:self.bgCoverView];
    
    self.view.backgroundColor = APLCSC(Color_White);
    self.scrollView = [UIScrollView newAutoLayoutView];
    [self.view addSubview:self.scrollView];
    
    self.gradientView = [AYGradientView newAutoLayoutView];
    [self.view addSubview:self.gradientView];
    
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
}

- (void)updateViewConstraints
{
    [super updateViewConstraints];
    if (!self.didSetupConstraints)
    {
        [self.bgCoverView autoPinEdgesToSuperviewEdges];
        
        [self.scrollView autoPinEdgesToSuperviewEdges];
        
        [self.gradientView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.gradientView autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.gradientView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        [self.gradientView autoSetDimension:ALDimensionHeight toSize:121];
        
        self.didSetupConstraints = YES;
    }
}

@end
