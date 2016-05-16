//
//  AYRootWireframe.h
//  AyyoTest
//
//  Created by Semyon Belokovsky on 16/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AYRootViewOutput.h"

@class AYStartWireframe;
@protocol AYRootViewInput;

@interface AYRootWireframe : NSObject <AYRootViewOutput>

@property (nonatomic, strong) UIViewController<AYRootViewInput> *view;

@property (nonatomic, strong) AYStartWireframe *startWireframe;

- (void)openModuleInWindow:(UIWindow *)window;

@end
