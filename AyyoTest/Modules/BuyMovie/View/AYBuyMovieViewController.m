//
//  AYBuyMovieViewController.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "AYBuyMovieViewController.h"
#import "AYBuyMovieViewOutput.h"

#import <PureLayout.h>
#import "APLColorScheme.h"

#import "AYBuyMovieContainer.h"
#import "AYSegmentControl.h"

#import "AYMoviePonso.h"
#import "AYPricePonso.h"

static CGFloat const kAYBuyMovieViewControllerContainerHeight = 294;

@interface AYBuyMovieViewController () <AYSegmentControlDelegate>

@property (nonatomic, assign) BOOL didSetupConstraints;

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) AYBuyMovieContainer *containerView;
@property (nonatomic, strong) NSLayoutConstraint *containerBottomConstraint;

@property (nonatomic, strong) AYSegmentControl *segmentControl;

@property (nonatomic, assign) BOOL shouldShowContainer;

@end

@implementation AYBuyMovieViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
    self.bgView = [UIView newAutoLayoutView];
    self.bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    self.bgView.alpha = 0;
    [self.view addSubview:self.bgView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(tapAction:)];
    [self.bgView addGestureRecognizer:tap];
    
    self.containerView = [AYBuyMovieContainer newAutoLayoutView];    
    [self.view addSubview:self.containerView];
    
    self.segmentControl = [AYSegmentControl newAutoLayoutView];
    self.segmentControl.delegate = self;
    [self.containerView.header addSubview:self.segmentControl];
    
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    [self.view layoutIfNeeded];
    
    [self.output viewDidLoad];
}

- (void)updateViewConstraints
{
    [super updateViewConstraints];
    if (!self.didSetupConstraints)
    {
        [self.bgView autoPinEdgesToSuperviewEdges];
        
        [self.containerView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.containerView autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.containerView autoSetDimension:ALDimensionHeight toSize:kAYBuyMovieViewControllerContainerHeight];
        
        [self.segmentControl autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.segmentControl autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.segmentControl autoSetDimension:ALDimensionHeight toSize:30];
        
        self.didSetupConstraints = YES;
    }
    
    [self.containerBottomConstraint autoRemove];
    
    self.containerBottomConstraint = [self.containerView autoPinEdgeToSuperviewEdge:ALEdgeBottom
                                                                          withInset:self.shouldShowContainer?0:-kAYBuyMovieViewControllerContainerHeight];
}

- (void)tapAction:(id)sender
{
    [self.output actionCancel];
}

#pragma mark - AYBuyMovieViewInput

- (void)animateOpeningInView:(UIView *)inView
{
    self.shouldShowContainer = YES;
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    
    __weak typeof(self) welf = self;
    [UIView animateWithDuration:0.25
                     animations:
     ^
    {
        welf.bgView.alpha = 1;
        [welf.view layoutIfNeeded];
    }];
}

- (void)configureWithMovie:(AYMoviePonso *)movie
{
    NSMutableArray *arr = [NSMutableArray new];
    if (movie.price.buyValues.count)
    {
        [arr addObject:NSLS(@"Навсегда")];
    }
    if (movie.price.rentValues.count)
    {
        [arr addObject:NSLS(@"Напрокат")];
    }
    [self.segmentControl createItemsWithTitles:arr];
    
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    [self.view layoutIfNeeded];
}

#pragma mark - AYSegmentControlDelegate

- (void)ay_segmentControlDidChangeValue:(AYSegmentControl *)segmentControl
{
    
}

@end
