//
//  AppConfigurator.h
//  AyyoTest
//
//  Created by Semyon Belokovsky on 16/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AYAppConfigurator <NSObject>

- (void)registerColorScheme;
- (void)patchUI;

@end