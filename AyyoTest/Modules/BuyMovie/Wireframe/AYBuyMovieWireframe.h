//
//  AYBuyMovieWireframe.h
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>

#import "AYBuyMovieViewOutput.h"

@protocol AYBuyMovieViewInput;

@interface AYBuyMovieWireframe : NSObject <AYBuyMovieViewOutput>

@property (nonatomic, strong) UIViewController<AYBuyMovieViewInput> *view;

@end
