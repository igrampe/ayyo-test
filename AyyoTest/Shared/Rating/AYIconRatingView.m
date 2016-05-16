//
//  AYIconRatingView.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYIconRatingView.h"

@interface AYIconRatingView ()

@property (nonatomic, strong) UIImageView *icon;

@end

@implementation AYIconRatingView

- (void)setupView
{
    [super setupView];
    self.icon = [UIImageView new];
    self.icon.image = [UIImage imageNamed:[self iconName]];
    [self addSubview:self.icon];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGSize iconSize = self.icon.image.size;
    self.icon.frame = CGRectMake(0, (CGRectGetHeight(self.bounds)-iconSize.height)/2, iconSize.width, iconSize.height);
    
    CGSize textSize = [self.textLabel sizeThatFits:self.bounds.size];
    self.textLabel.frame = CGRectMake(CGRectGetMaxX(self.icon.frame)+5,
                                      (CGRectGetHeight(self.bounds)-textSize.height)/2,
                                      textSize.width, textSize.height);
}

- (NSString *)iconName
{
    return @"";
}

@end
