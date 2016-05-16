//
//  AYStartWireframe.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 16/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYStartWireframe.h"

#import "AYStartViewOutput.h"

#import "AYMovieWireframe.h"

@implementation AYStartWireframe

- (void)actionOpenMovie
{
    [self openMovieAnimated:YES];
}

- (void)viewDidLoad
{
    [self openMovieAnimated:NO];
}

- (void)openMovieAnimated:(BOOL)animated
{
    [self.view.navigationController pushViewController:self.movieWireframe.view
                                              animated:animated];
}

@end
