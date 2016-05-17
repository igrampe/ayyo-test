//
//  AYBuyMovieViewController.h
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <UIKit/UIKit.h>

@protocol AYBuyMovieViewOutput;

@interface AYBuyMovieViewController : UIViewController

@property (nonatomic, weak) id<AYBuyMovieViewOutput> output;

@end
