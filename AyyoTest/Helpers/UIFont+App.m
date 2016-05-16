//
//  UIFont+App.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "UIFont+App.h"

@implementation UIFont (App)

+ (UIFont *)ay_primaryFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"ProximaNova-Regular" size:size];
    
}

+ (UIFont *)ay_secondaryFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"ProximaNova-Semibold" size:size];
}

+ (UIFont *)ay_moviePriceFont
{
    return [UIFont fontWithName:@"ProximaNova-Semibold" size:60];
}

+ (UIFont *)ay_movieRaitingFont
{
    return [UIFont fontWithName:@"FuturaPT-Bold" size:11];
}

@end
