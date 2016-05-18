//
//  AYLoadingButton.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 18/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYLoadingButton.h"

#import "UIFont+App.h"
#import "NSString+Attributing.h"

@interface AYLoadingButton ()

@property (nonatomic, strong) UIImageView *activityView;

@end

@implementation AYLoadingButton

- (void)setupView
{
    [super setupView];
    
    [self setAttributedTitle:[NSString attrubutedStringWithLineSpace:0
                                                                font:[UIFont ay_secondaryFontWithSize:12]
                                                           charSpace:1
                                                               color:[UIColor whiteColor]
                                                           alignment:NSTextAlignmentCenter
                                                               value:NSLS(@"КУПИТЬ")]
                    forState:UIControlStateNormal];
    
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = 1;
    
    self.activityView = [UIImageView new];
    self.activityView.image = [UIImage imageNamed:@"loader"];
    self.activityView.hidden = YES;
    [self addSubview:self.activityView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGSize imageSize = self.activityView.image.size;
    self.activityView.frame = CGRectMake((CGRectGetWidth(self.bounds)-imageSize.width)/2,
                                         (CGRectGetHeight(self.bounds)-imageSize.height)/2,
                                         imageSize.width, imageSize.height);
}

- (void)startAnimating
{
    self.activityView.hidden = NO;
    self.titleLabel.alpha = 0;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.toValue = [NSNumber numberWithFloat: M_PI * 2.0];
    animation.cumulative = YES;
    animation.repeatCount = HUGE_VALF;
    animation.duration = 1;
    
    [self.activityView.layer addAnimation:animation forKey:@"rotation"];
}

- (void)stopAnimating
{
    self.activityView.hidden = YES;
    self.titleLabel.alpha = 1;
    
    [self.activityView.layer removeAnimationForKey:@"rotation"];
}

@end
