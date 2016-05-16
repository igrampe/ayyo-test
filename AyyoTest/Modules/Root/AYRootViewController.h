//
//  AYRootViewController.h
//  AyyoTest
//
//  Created by Semyon Belokovsky on 16/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AYRootViewOutput;

@interface AYRootViewController : UIViewController

@property (nonatomic, weak) id<AYRootViewOutput> output;

@end
