//
//  AYPriceSlider.h
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "APLView.h"

@class AYPriceSlider;
@class AYPriceValuePonso;

@protocol AYPriceSliderDataSource <NSObject>

- (NSInteger)numberOfItemsInSlider:(AYPriceSlider *)slider;
- (AYPriceValuePonso *)objectAtIndex:(NSInteger)index;

@end

@interface AYPriceSlider : APLView

@property (nonatomic, weak) id<AYPriceSliderDataSource> dataSource;

- (void)reloadData;

@end
