//
//  AYPriceValuePonso.h
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AYPriceValuePonso : NSObject

@property (nonatomic, strong) NSString *qualityTitle;
@property (nonatomic, strong) NSNumber *value;

+ (instancetype)mockDVDbuy:(BOOL)buy;
+ (instancetype)mockHDbuy:(BOOL)buy;

@end
