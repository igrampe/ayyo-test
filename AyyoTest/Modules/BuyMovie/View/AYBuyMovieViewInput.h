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
- (void)animateClosing;
- (void)configureWithMovie:(AYMoviePonso *)movie;

@end
