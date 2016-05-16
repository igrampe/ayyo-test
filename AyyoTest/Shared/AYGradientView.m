//
//  AYGradientView.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYGradientView.h"

@interface AYGradientView ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation AYGradientView

- (void)setupView
{
    self.gradientLayer = [CAGradientLayer new];
    self.gradientLayer.colors = @[(id)([[UIColor blackColor] colorWithAlphaComponent:0].CGColor), (id)([UIColor blackColor].CGColor)];
    self.gradientLayer.locations = @[@0, @1];
    [self.layer addSublayer:self.gradientLayer];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.gradientLayer.frame = self.bounds;
}

@end
