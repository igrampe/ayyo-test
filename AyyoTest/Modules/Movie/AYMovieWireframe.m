//
//  AYMovieWireframe.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 16/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYMovieWireframe.h"

#import "AYMovieViewOutput.h"
#import "AYMovieViewInput.h"
#import "AYMoviePonso.h"

@interface AYMovieWireframe ()

@property (nonatomic, strong) AYMoviePonso *movie;

@end

@implementation AYMovieWireframe

- (void)viewDidLoad
{
    [self mock];
    [self.view configureWithMovie:self.movie];
}

- (void)mock
{
    self.movie = [AYMoviePonso mock];
}

@end
