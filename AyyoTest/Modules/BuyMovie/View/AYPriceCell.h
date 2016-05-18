//
//  AYPriceCell.h
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AYPriceValuePonso;

@interface AYPriceCell : UICollectionViewCell

- (void)configureWithPriceValue:(AYPriceValuePonso *)value;

+ (NSString *)identifier;

@end
