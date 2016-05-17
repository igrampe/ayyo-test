//
//  AYBuyMovieWireframe.h
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>

#import "AYBuyMovieViewOutput.h"

@class AYMoviePonso;
@protocol AYBuyMovieViewInput;
@protocol AYBuyMovieModuleOutput;

@interface AYBuyMovieWireframe : NSObject <AYBuyMovieViewOutput>

@property (nonatomic, strong) AYMoviePonso *movie;

@property (nonatomic, strong) UIViewController<AYBuyMovieViewInput> *view;
@property (nonatomic, weak) id<AYBuyMovieModuleOutput> output;

- (void)openInVC:(UIViewController *)inVC;
- (void)close;

@end
