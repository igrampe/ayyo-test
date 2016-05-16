//
//  AYBluredCoverView.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYBluredCoverView.h"
#import "UIImage+ImageEffects.h"

#import <Purelayout.h>

@interface AYBluredCoverView ()

@property (nonatomic, assign) BOOL didSetupConstraints;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation AYBluredCoverView

- (void)setupView
{
    self.imageView = [UIImageView new];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:self.imageView];
}

- (void)updateConstraints
{
    [super updateConstraints];
    if (!self.didSetupConstraints)
    {
        [self.imageView autoPinEdgesToSuperviewEdges];
        self.didSetupConstraints = YES;
    }
}

- (void)configureWithImage:(UIImage *)image
{
    UIColor *tintColor = [UIColor colorWithWhite:0.11 alpha:0.73];
    UIImage *blured = [image applyBlurWithRadius:15
                                       tintColor:tintColor
                           saturationDeltaFactor:1.8 maskImage:nil];
    self.imageView.image = blured;
}

@end
