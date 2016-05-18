//
//  AYPricePonso.h
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, AYPriceType)
{
    AYPriceTypeBuy,
    AYPriceTypeRent
};

@class AYPriceValuePonso;

@interface AYPricePonso : NSObject

@property (nonatomic, strong) NSArray <AYPriceValuePonso *> *buyValues;
@property (nonatomic, strong) NSArray <AYPriceValuePonso *> *rentValues;

+ (instancetype)mock;

@end
