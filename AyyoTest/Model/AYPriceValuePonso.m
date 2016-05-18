//
//  AYPriceValuePonso.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYPriceValuePonso.h"

@implementation AYPriceValuePonso

+ (instancetype)mockDVDbuy:(BOOL)buy;
{
    AYPriceValuePonso *object = [self mock];
    
    object.qualityTitle = @"DVD-качество";
    object.value = buy?@299:@99;
    
    return object;
}

+ (instancetype)mockHDbuy:(BOOL)buy;
{
    AYPriceValuePonso *object = [self mock];
    
    object.qualityTitle = @"HD";
    object.value = buy?@599:@299;
    
    return object;
}

+ (instancetype)mock
{
    AYPriceValuePonso *object = [AYPriceValuePonso new];
    
    object.qualityTitle = @"HD";
    object.value = @100;
    
    return object;
}

@end
