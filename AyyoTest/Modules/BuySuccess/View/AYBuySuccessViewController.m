//
//  AYBuySuccessViewController.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 18/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "AYBuySuccessViewController.h"
#import "AYBuySuccessViewOutput.h"

#import <PureLayout.h>

@interface AYBuySuccessViewController ()

@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UILabel *statusLabel;

@property (nonatomic, assign) BOOL didSetupConstraints;

@end

@implementation AYBuySuccessViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.statusLabel = [UILabel newAutoLayoutView];
    self.statusLabel.text = NSLS(@"Успех!");
    [self.view addSubview:self.statusLabel];
    
    self.backButton = [UIButton newAutoLayoutView];
    [self.backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.backButton setTitle:NSLS(@"Закрыть") forState:UIControlStateNormal];
    [self.backButton addTarget:self.output
                        action:@selector(actionClose)
              forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.backButton];
}

- (void)updateViewConstraints
{
    [super updateViewConstraints];
    if (!self.didSetupConstraints)
    {
        [self.statusLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.statusLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [self.backButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:20];
        [self.backButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
    }
}

@end
