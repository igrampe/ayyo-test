//
//  AYStartViewController.h
//  AyyoTest
//
//  Created by Semyon Belokovsky on 16/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AYStartViewOutput;

@interface AYStartViewController : UIViewController

@property (nonatomic, weak) id<AYStartViewOutput> output;

@end
