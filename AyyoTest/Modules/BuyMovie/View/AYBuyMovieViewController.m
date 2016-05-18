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
#import "AYPriceSlider.h"
#import "AYLoadingButton.h"

#import "AYMoviePonso.h"
#import "AYPricePonso.h"

static CGFloat const kAYBuyMovieViewControllerContainerHeight = 294;

@interface AYBuyMovieViewController () <AYSegmentControlDelegate, AYPriceSliderDataSource>

@property (nonatomic, assign) BOOL didSetupConstraints;

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) AYBuyMovieContainer *containerView;
@property (nonatomic, strong) NSLayoutConstraint *containerBottomConstraint;

@property (nonatomic, strong) AYSegmentControl *segmentControl;
@property (nonatomic, strong) AYPriceSlider *priceSlider;

@property (nonatomic, strong) AYLoadingButton *buyButton;

@property (nonatomic, assign) BOOL shouldShowContainer;

@property (nonatomic, strong) AYMoviePonso *movie;

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
    
    self.priceSlider = [AYPriceSlider newAutoLayoutView];
    self.priceSlider.dataSource = self;
    [self.containerView addSubview:self.priceSlider];
    
    self.buyButton = [AYLoadingButton newAutoLayoutView];
    [self.buyButton addTarget:self.output
                       action:@selector(actionBuy)
             forControlEvents:UIControlEventTouchUpInside];
    [self.containerView addSubview:self.buyButton];
    
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
        
        [self.priceSlider autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.containerView.header];
        [self.priceSlider autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.priceSlider autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.priceSlider autoSetDimension:ALDimensionHeight toSize:138];
        
        [self.buyButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:20];
        [self.buyButton autoSetDimensionsToSize:CGSizeMake(212, 60)];
        [self.buyButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
        
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

- (void)animateClosingWithHandler:(void (^)(void))handler
{
    self.shouldShowContainer = NO;
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    
    __weak typeof(self) welf = self;
    [UIView animateWithDuration:0.25
                     animations:
     ^
    {        
        welf.bgView.alpha = 0;
        [welf.view layoutIfNeeded];
    } completion:
     ^(BOOL finished)
    {
        if (handler)
        {
            handler();
        }
    }];
}


- (void)configureWithMovie:(AYMoviePonso *)movie
{
    self.movie = movie;
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
    
    [self.priceSlider reloadData];
    
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    [self.view layoutIfNeeded];        
}

- (void)showLoader
{
    [self.buyButton startAnimating];
}

- (void)hideLoader
{
    [self.buyButton stopAnimating];
}

#pragma mark - AYSegmentControlDelegate

- (void)ay_segmentControlDidChangeValue:(AYSegmentControl *)segmentControl
{
    [self.priceSlider reloadData];
}

#pragma mark - AYPriceSliderDataSource

- (NSInteger)numberOfItemsInSlider:(AYPriceSlider *)slider
{
    return [self _pricesForType:[self _priceType]].count;
}

- (AYPriceValuePonso *)objectAtIndex:(NSInteger)index
{
    AYPriceValuePonso *value = nil;
    
    value = [self _pricesForType:[self _priceType]][index];
    
    return value;
}

#pragma mark - Private

- (NSArray *)_pricesForType:(AYPriceType)priceType
{
    NSArray *result = nil;
    
    if (priceType == AYPriceTypeBuy)
    {
        result = self.movie.price.buyValues;
    } else if (priceType == AYPriceTypeRent)
    {
        result = self.movie.price.rentValues;
    }
    
    return result;
}

- (AYPriceType)_priceType
{
    AYPriceType type = AYPriceTypeBuy;
    
    NSInteger segmentedIndex = self.segmentControl.selectedIndex;
    
    if (segmentedIndex == 1)
    {
        type = AYPriceTypeRent;
    } else
    {
        if (self.movie.price.buyValues.count)
        {
            type = AYPriceTypeBuy;
        } else
        {
            type = AYPriceTypeRent;
        }
    }
    
    return type;
}

@end
