//
//  AYIconRatingView.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYIconRatingView.h"
#import <PureLayout.h>

@interface AYIconRatingView ()

@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, assign) BOOL didSetupConstraints;

@end

@implementation AYIconRatingView

- (void)setupView
{
    [super setupView];
    self.icon = [UIImageView new];
    self.icon.image = [UIImage imageNamed:[self iconName]];
    [self addSubview:self.icon];
}

- (void)updateConstraints
{
    [super updateConstraints];
    if (!self.didSetupConstraints)
    {
        [self.icon autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.icon autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.icon autoSetDimensionsToSize:self.icon.image.size];
        
        [self.textLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.icon withOffset:5];
        [self.textLabel autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.textLabel autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.textLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        self.didSetupConstraints = YES;
    }
}

- (NSString *)iconName
{
    return @"";
}

@end
