//
//  AYRatingView.h
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "APLView.h"

@interface AYRatingView : APLView

@property (nonatomic, strong) UILabel *textLabel;

- (void)configureWithRaiting:(NSString *)rating;

@end
