//
//  AYAgeRatingView.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYAgeRatingView.h"
#import <PureLayout.h>

@interface AYAgeRatingView ()

@property (nonatomic, assign) BOOL didSetupConstraints;

@end

@implementation AYAgeRatingView

- (void)setupView
{
    [super setupView];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.1].CGColor;
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = 2.5;
}

- (void)updateConstraints
{
    [super updateConstraints];
    if (!self.didSetupConstraints)
    {
        [self.textLabel autoPinEdgesToSuperviewEdges];
        self.didSetupConstraints = YES;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.textLabel.frame = self.bounds;
}

@end
