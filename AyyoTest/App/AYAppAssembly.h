//
//  AYAppAssembly.h
//  AyyoTest
//
//  Created by Semyon Belokovsky on 16/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Typhoon/Typhoon.h>

@class AYRootAssembly;

@interface AYAppAssembly : TyphoonAssembly

@property (nonatomic, strong, readonly) AYRootAssembly *rootAssembly;

@end
