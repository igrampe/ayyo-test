//
//  AYMoviePonso.h
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AYPricePonso;

@interface AYMoviePonso : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *title_en;
@property (nonatomic, strong) NSString *cover_url;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSNumber *rating_imdb;
@property (nonatomic, strong) NSNumber *rating_kinopoisk;
@property (nonatomic, strong) NSNumber *rating_age;
@property (nonatomic, strong) NSString *trailer_url;
@property (nonatomic, strong) AYPricePonso *price;

+ (instancetype)mock;

@end
