//
//  AYBuyMovieModuleOutput.h
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AYBuyMovieWireframe;

@protocol AYBuyMovieModuleOutput <NSObject>

- (void)buyMovieModuleDidCancel:(AYBuyMovieWireframe *)module;

@end
