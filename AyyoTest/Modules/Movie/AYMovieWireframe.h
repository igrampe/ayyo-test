//
//  AYMovieWireframe.h
//  AyyoTest
//
//  Created by Semyon Belokovsky on 16/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AYMovieViewOutput.h"

@protocol AYMovieViewInput;

@interface AYMovieWireframe : NSObject <AYMovieViewOutput>

@property (nonatomic, strong) UIViewController<AYMovieViewInput> *view;

@end
