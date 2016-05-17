//
//  AYSegmentControl.h
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "APLView.h"

@class AYSegmentControl;

@protocol AYSegmentControlDelegate <NSObject>

- (void)ay_segmentControlDidChangeValue:(AYSegmentControl *)segmentControl;

@end

@interface AYSegmentControl : APLView

@property (nonatomic, assign) NSInteger selectedIndex;

@property (nonatomic, weak) id<AYSegmentControlDelegate> delegate;

- (void)createItemsWithTitles:(NSArray *)titles;

@end
