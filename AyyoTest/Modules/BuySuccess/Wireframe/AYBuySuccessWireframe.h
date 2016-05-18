//
//  AYBuySuccessWireframe.h
//  AyyoTest
//
//  Created by Semyon Belokovsky on 18/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>

#import "AYBuySuccessViewOutput.h"
#import "AYBuySuccessModuleOutput.h"

@protocol AYBuySuccessViewInput;

@interface AYBuySuccessWireframe : NSObject <AYBuySuccessViewOutput>

@property (nonatomic, strong) UIViewController<AYBuySuccessViewInput> *view;
@property (nonatomic, weak) id<AYBuySuccessModuleOutput> output;

@end
