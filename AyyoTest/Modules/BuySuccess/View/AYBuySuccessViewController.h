//
//  AYBuySuccessViewController.h
//  AyyoTest
//
//  Created by Semyon Belokovsky on 18/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <UIKit/UIKit.h>

@protocol AYBuySuccessViewOutput;

@interface AYBuySuccessViewController : UIViewController

@property (nonatomic, weak) id<AYBuySuccessViewOutput> output;

@end
