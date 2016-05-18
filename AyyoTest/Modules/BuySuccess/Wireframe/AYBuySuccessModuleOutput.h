//
//  AYBuySuccessModuleOutput.h
//  AyyoTest
//
//  Created by Semyon Belokovsky on 18/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AYBuySuccessWireframe;

@protocol AYBuySuccessModuleOutput <NSObject>

- (void)buySuccessModuleDidCancel:(AYBuySuccessWireframe *)module;

@end