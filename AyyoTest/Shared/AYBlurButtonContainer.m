//
//  AYBlurButtonContainer.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 18/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYBlurButtonContainer.h"

@implementation AYBlurButtonContainer

- (instancetype)initWithEffect:(nullable UIVisualEffect *)effect
{
    self = [super initWithEffect:effect];
    
    if (self)
    {
        [self setupView];
    }
    
    return self;
}

- (void)setupView
{
    self.layer.masksToBounds = YES;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.layer.cornerRadius = CGRectGetHeight(self.bounds)/2;
}

@end
