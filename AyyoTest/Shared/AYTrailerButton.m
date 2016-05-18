//
//  AYTrailerButton.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYTrailerButton.h"
#import "UIFont+App.h"

@interface AYTrailerButton ()

@end

@implementation AYTrailerButton

- (void)setupView
{
    [super setupView];
//    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.15];
    [self setImage:[UIImage imageNamed:@"trailer_play"] forState:UIControlStateNormal];
    [self setTitle:NSLS(@"ТРЕЙЛЕР") forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont ay_secondaryFontWithSize:12];
    [self setTitleColor:[[UIColor whiteColor] colorWithAlphaComponent:0.8] forState:UIControlStateNormal];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, 7, 0, 17)];
}

@end
