//
//  AYBookmarkButton.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYBookmarkButton.h"

@implementation AYBookmarkButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setupView];
    }
    return self;
}

- (void)setupView
{
    [self setBackgroundImage:[UIImage imageNamed:@"bookmark"] forState:UIControlStateNormal];
}

- (CGSize)size
{
    return self.currentBackgroundImage.size;
}

@end
