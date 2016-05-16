//
//  AYRatingView.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYRatingView.h"
#import "UIFont+App.h"

@implementation AYRatingView

- (void)setupView
{
    self.textLabel = [UILabel new];
    self.textLabel.font = [UIFont ay_movieRaitingFont];
    self.textLabel.textColor = [UIColor whiteColor];
    [self addSubview:self.textLabel];
}

- (void)configureWithRaiting:(NSString *)rating
{
    self.textLabel.text = rating;
    [self layoutSubviews];
}

@end
