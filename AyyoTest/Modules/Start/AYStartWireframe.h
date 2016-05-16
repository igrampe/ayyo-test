//
//  AYStartWireframe.h
//  AyyoTest
//
//  Created by Semyon Belokovsky on 16/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AYStartViewOutput.h"

@class AYMovieWireframe;
@protocol AYStartViewInput;

@interface AYStartWireframe : NSObject <AYStartViewOutput>

@property (nonatomic, strong) UIViewController<AYStartViewInput> *view;

@property (nonatomic, strong) AYMovieWireframe *movieWireframe;

@end
