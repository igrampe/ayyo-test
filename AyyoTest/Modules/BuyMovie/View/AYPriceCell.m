//
//  AYPriceCell.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYPriceCell.h"

#import <PureLayout.h>
#import "UIFont+App.h"
#import "AYPriceValuePonso.h"

@interface AYPriceCell ()

@property (nonatomic, strong) UIView *priceContainer;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *currencyLabel;
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, assign) BOOL didSetupConstraints;

@end

@implementation AYPriceCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setupView];
    }
    return self;
}

- (void)setupView
{
    self.priceContainer = [UIView newAutoLayoutView];
    [self.contentView addSubview:self.priceContainer];
    
    self.priceLabel = [UILabel newAutoLayoutView];
    self.priceLabel.font = [UIFont ay_moviePriceFont];
    self.priceLabel.textColor = [UIColor whiteColor];
    [self.priceContainer addSubview:self.priceLabel];
    
    self.currencyLabel = [UILabel newAutoLayoutView];
    self.currencyLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:60];
    self.currencyLabel.text = @"₽";
    self.currencyLabel.textColor = [UIColor whiteColor];
    [self.priceContainer addSubview:self.currencyLabel];
    
    self.titleLabel = [UILabel newAutoLayoutView];
    self.titleLabel.font = [UIFont ay_primaryFontWithSize:12];
    self.titleLabel.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];;
    [self.contentView addSubview:self.titleLabel];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [self layoutIfNeeded];
}

- (void)updateConstraints
{
    [super updateConstraints];
    if (!self.didSetupConstraints)
    {
        [self.priceContainer autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.priceContainer autoAlignAxisToSuperviewAxis:ALAxisVertical];
        
        [self.priceLabel autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.priceLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.priceLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        
        [self.currencyLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.priceLabel];
        [self.currencyLabel autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.currencyLabel autoAlignAxis:ALAxisBaseline toSameAxisOfView:self.priceLabel];
        
        [self.titleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.priceContainer withOffset:0];
        [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
        
        self.didSetupConstraints = YES;
    }
}

- (void)configureWithPriceValue:(AYPriceValuePonso *)value
{
    self.priceLabel.text = [NSString stringWithFormat:@"%@", value.value];
    self.titleLabel.text = value.qualityTitle;
    
    [self layoutIfNeeded];
}

+ (NSString *)identifier
{
    return NSStringFromClass([self class]);
}

@end
