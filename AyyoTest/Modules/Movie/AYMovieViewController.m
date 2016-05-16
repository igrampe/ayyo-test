//
//  AYMovieViewController.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 16/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYMovieViewController.h"
#import "AYMovieViewOutput.h"

#import <PureLayout.h>

#import "UIFont+App.h"
#import "APLColorScheme.h"

#import "AYRoundedButton.h"
#import "AYGradientView.h"
#import "AYBluredCoverView.h"
#import "AYAgeRatingView.h"
#import "AYImdbRatingView.h"
#import "AYKinopoiskRatingView.h"
#import "NSString+Attributing.h"

@interface AYMovieViewController ()

@property (nonatomic, assign) BOOL didSetupConstraints;

@property (nonatomic, strong) AYBluredCoverView *bgCoverView;
@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIImageView *coverView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;

@property (nonatomic, strong) AYAgeRatingView *ageRatingView;
@property (nonatomic, strong) AYImdbRatingView *imdbRatingView;
@property (nonatomic, strong) AYKinopoiskRatingView *kinopoiskRatingView;

@property (nonatomic, strong) UIView *descriptionContainer;
@property (nonatomic, strong) UITextView *descriptionView;

@property (nonatomic, strong) AYGradientView *gradientView;
@property (nonatomic, strong) AYRoundedButton *watchButton;

@end

@implementation AYMovieViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupView];
    [self setupNavigationBar];
}

- (void)setupView
{
    self.view.backgroundColor = APLCSC(Color_White);
    
    self.bgCoverView = [AYBluredCoverView newAutoLayoutView];
    [self.bgCoverView configureWithImage:[UIImage imageNamed:@"cover"]];    
    [self.view addSubview:self.bgCoverView];
    
    self.scrollView = [UIScrollView newAutoLayoutView];
    self.scrollView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    [self.view addSubview:self.scrollView];
    
    self.coverView = [UIImageView new];
    self.coverView.layer.borderWidth = 0.5;
    self.coverView.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.1].CGColor;
    self.coverView.image = [UIImage imageNamed:@"cover"];
    [self.scrollView addSubview:self.coverView];
    
    self.titleLabel = [UILabel newAutoLayoutView];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.attributedText = [NSString attrubutedStringWithLineSpace:21.5
                                                                        font:[UIFont ay_secondaryFontWithSize:18]
                                                                   charSpace:0
                                                                       color:APLCSC(Color_White)
                                                                   alignment:NSTextAlignmentCenter
                                                                       value:@"Первый Мститель:\nПротивостояние"];
    [self.scrollView addSubview:self.titleLabel];
    
    self.subtitleLabel = [UILabel newAutoLayoutView];
    self.subtitleLabel.numberOfLines = 0;
    self.subtitleLabel.attributedText = [NSString attrubutedStringWithLineSpace:13
                                                                        font:[UIFont ay_secondaryFontWithSize:11]
                                                                   charSpace:0.92
                                                                       color:[APLCSC(Color_White) colorWithAlphaComponent:0.5]
                                                                   alignment:NSTextAlignmentCenter
                                                                       value:@"CIVIL WAR (2016)"];
    [self.scrollView addSubview:self.subtitleLabel];
    
    self.kinopoiskRatingView = [AYKinopoiskRatingView newAutoLayoutView];
    [self.kinopoiskRatingView configureWithRaiting:@"9.1"];
    [self.scrollView addSubview:self.kinopoiskRatingView];
    
    self.imdbRatingView = [AYImdbRatingView newAutoLayoutView];
    [self.imdbRatingView configureWithRaiting:@"9.1"];
    [self.scrollView addSubview:self.imdbRatingView];
    
    self.ageRatingView = [AYAgeRatingView newAutoLayoutView];
    [self.ageRatingView configureWithRaiting:@"12+"];
    [self.scrollView addSubview:self.ageRatingView];
    
    self.descriptionContainer = [UIView newAutoLayoutView];
    [self.scrollView addSubview:self.descriptionContainer];
    
    self.descriptionView = [UITextView newAutoLayoutView];
    self.descriptionView.scrollEnabled = NO;
    self.descriptionView.backgroundColor = [UIColor clearColor];
    NSString *descriptionValue = @"Мстители под руководством Капитана Америки оказываются участниками разрушительного инцидента, имеющего международный масштаб. Эти события заставляют правительство задуматься над тем, чтобы начать регулировать действия всех людей с особыми способностями, введя «Акт о регистрации супергероев», вынуждая их раскрыть свои личности и работать на правительственные службы.";
    self.descriptionView.attributedText = [NSString attrubutedStringWithLineSpace:24
                                                                             font:[UIFont ay_primaryFontWithSize:17]
                                                                        charSpace:0
                                                                            color:[APLCSC(Color_White) colorWithAlphaComponent:0.7]
                                                                        alignment:NSTextAlignmentLeft
                                                                            value:descriptionValue];
    [self.descriptionContainer addSubview:self.descriptionView];
    
    self.gradientView = [AYGradientView newAutoLayoutView];
    [self.view addSubview:self.gradientView];
    
    self.watchButton = [AYRoundedButton newAutoLayoutView];
    [self.watchButton setTitle:NSLS(@"СМОТРЕТЬ ФИЛЬМ") forState:UIControlStateNormal];
    [self.watchButton setBackgroundColor:APLCSC(Color_Blue)];
    self.watchButton.titleLabel.font = [UIFont ay_secondaryFontWithSize:12];
    [self.view addSubview:self.watchButton];
    
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
}

- (void)setupNavigationBar
{
    UIButton *backButton = [UIButton new];
    UIImage *image = [UIImage imageNamed:@"back"];
    CGSize imageSize = image.size;
    [backButton setImage:image forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    backButton.frame = CGRectMake(0, 0, 44, 44);
    backButton.contentEdgeInsets = UIEdgeInsetsMake(24, 9, 44-imageSize.height-24, 44-imageSize.width-9);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

- (void)updateViewConstraints
{
    [super updateViewConstraints];
    if (!self.didSetupConstraints)
    {
        [self.bgCoverView autoPinEdgesToSuperviewEdges];
        
        [self.scrollView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.scrollView autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.scrollView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        [self.scrollView autoPinEdgeToSuperviewEdge:ALEdgeTop];
        
        [self.coverView autoSetDimension:ALDimensionWidth toSize:150];
        CGFloat ratio = self.coverView.image.size.height*150/self.coverView.image.size.width;
        [self.coverView autoSetDimension:ALDimensionHeight toSize:ratio];
        [self.coverView autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.coverView autoAlignAxisToSuperviewAxis:ALAxisVertical];
        
        [self.titleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.coverView];
        [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:38 relation:NSLayoutRelationGreaterThanOrEqual];
        [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:38 relation:NSLayoutRelationGreaterThanOrEqual];
        
        [self.subtitleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel];
        [self.subtitleLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.subtitleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:38 relation:NSLayoutRelationGreaterThanOrEqual];
        [self.subtitleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:38 relation:NSLayoutRelationGreaterThanOrEqual];
        
        [self.kinopoiskRatingView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.subtitleLabel withOffset:8];
        [self.kinopoiskRatingView autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.kinopoiskRatingView autoSetDimensionsToSize:CGSizeMake(32, 14)];
        
        [self.imdbRatingView autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.kinopoiskRatingView withOffset:-6];
        [self.imdbRatingView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.kinopoiskRatingView];
        [self.imdbRatingView autoSetDimensionsToSize:CGSizeMake(43, 14)];
        
        [self.ageRatingView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.kinopoiskRatingView withOffset:8];
        [self.ageRatingView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.kinopoiskRatingView];
        [self.ageRatingView autoSetDimensionsToSize:CGSizeMake(30, 20)];
        
        [self.descriptionContainer autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.ageRatingView withOffset:20];
        [self.descriptionContainer autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:38];
        [self.descriptionContainer autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:38];
        [self.descriptionContainer autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:121];
        [self.descriptionContainer autoSetDimension:ALDimensionWidth
                                             toSize:(CGRectGetWidth(MAIN_SCREEN.bounds)-38*2)
                                           relation:NSLayoutRelationLessThanOrEqual];
        
        [self.descriptionView autoPinEdgesToSuperviewEdges];
        
        [self.gradientView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.gradientView autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.gradientView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        [self.gradientView autoSetDimension:ALDimensionHeight toSize:121];
        
        [self.watchButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:25];
        [self.watchButton autoSetDimension:ALDimensionHeight toSize:50];
        [self.watchButton autoSetDimension:ALDimensionWidth toSize:190];
        [self.watchButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
        
        self.didSetupConstraints = YES;
    }
}

- (void)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
