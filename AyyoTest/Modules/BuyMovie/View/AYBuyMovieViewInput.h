//
//  AYBuyMovieViewInput.h
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <UIKit/UIKit.h>

@class AYMoviePonso;

@protocol AYBuyMovieViewInput <NSObject>

- (void)animateOpeningInView:(UIView *)inView;
- (void)animateClosingWithHandler:(void (^)(void))handler;
- (void)configureWithMovie:(AYMoviePonso *)movie;
- (void)showLoader;
- (void)hideLoader;

@end
