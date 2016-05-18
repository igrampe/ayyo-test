//
//  AYBuyMovieViewOutput.h
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>

@protocol AYBuyMovieViewOutput <NSObject>

- (void)viewDidLoad;
- (void)actionCancel;
- (void)actionBuy;

@end