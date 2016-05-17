//
//  AYMovieViewController.h
//  AyyoTest
//
//  Created by Semyon Belokovsky on 16/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AYMovieViewInput.h"

@protocol AYMovieViewOutput;

@interface AYMovieViewController : UIViewController <AYMovieViewInput>

@property (nonatomic, weak) id<AYMovieViewOutput> output;

@end
