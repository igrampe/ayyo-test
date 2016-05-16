//
//  AYAgeRatingView.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYAgeRatingView.h"

@implementation AYAgeRatingView

- (void)setupView
{
    [super setupView];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.1].CGColor;
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = 2.5;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.textLabel.frame = self.bounds;
}

@end
