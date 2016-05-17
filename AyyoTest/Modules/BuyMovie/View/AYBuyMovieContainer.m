//
//  AYBuyMovieContainer.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYBuyMovieContainer.h"

#import <PureLayout.h>
#import "APLColorScheme.h"

@interface AYBuyMovieContainer ()

@property (nonatomic, assign) BOOL didSetupConstraints;

@end

@implementation AYBuyMovieContainer

- (void)setupView
{
    [super setupView];
    self.backgroundColor = APLCSC(Color_Blue);
    
    self.header = [UIView newAutoLayoutView];
    self.header.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.1];
    self.header.layer.shadowColor = [[UIColor blackColor] colorWithAlphaComponent:0.03].CGColor;
    self.header.layer.shadowOffset = CGSizeMake(0, 2);
    self.header.layer.shadowRadius = 4;
    self.header.layer.shadowOpacity = 1;
    [self addSubview:self.header];
}

- (void)updateConstraints
{
    [super updateConstraints];
    if (!self.didSetupConstraints)
    {
        [self.header autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.header autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.header autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.header autoSetDimension:ALDimensionHeight toSize:70];
        
        self.didSetupConstraints = YES;
    }
}

@end
