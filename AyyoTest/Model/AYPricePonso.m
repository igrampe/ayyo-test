//
//  AYPricePonso.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYPricePonso.h"
#import "AYPriceValuePonso.h"

@implementation AYPricePonso

+ (instancetype)mock
{
    AYPricePonso *object = [AYPricePonso new];
    
    AYPriceValuePonso *pv1 = [AYPriceValuePonso mockDVDbuy:YES];
    AYPriceValuePonso *pv2 = [AYPriceValuePonso mockHDbuy:YES];
    AYPriceValuePonso *pv3 = [AYPriceValuePonso mockDVDbuy:NO];
    AYPriceValuePonso *pv4 = [AYPriceValuePonso mockHDbuy:NO];
    
    object.buyValues = @[pv1, pv2];
    object.rentValues = @[pv3, pv4];
    
    return object;
}

@end
