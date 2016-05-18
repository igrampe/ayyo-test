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
#import "NSString+Attributing.h"

#import "AYRoundedButton.h"
#import "AYGradientView.h"
#import "AYBluredCoverView.h"
#import "AYAgeRatingView.h"
#import "AYImdbRatingView.h"
#import "AYKinopoiskRatingView.h"
#import "AYTrailerButton.h"
#import "AYBookmarkButton.h"
#import "AYBlurButtonContainer.h"

#import "AYMoviePonso.h"

@interface AYMovieViewController ()

@property (nonatomic, assign) BOOL didSetupConstraints;

@property (nonatomic, strong) AYBluredCoverView *bgCoverView;
@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIImageView *coverView;
@property (nonatomic, strong) AYBlurButtonContainer *trailerButtonContainer;
@property (nonatomic, strong) AYTrailerButton *trailerButton;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;

@property (nonatomic, strong) AYAgeRatingView *ageRatingView;
@property (nonatomic, strong) AYImdbRatingView *imdbRatingView;
@property (nonatomic, strong) AYKinopoiskRatingView *kinopoiskRatingView;

@property (nonatomic, strong) UIView *descriptionContainer;
@property (nonatomic, strong) UITextView *descriptionView;

@property (nonatomic, strong) AYGradientView *gradientView;
@property (nonatomic, strong) AYRoundedButton *watchButton;
@property (nonatomic, strong) AYBookmarkButton *bookmarkButton;

@property (nonatomic, strong) NSLayoutConstraint *coverHeightConstraint;

@end

@implementation AYMovieViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupView];
    [self setupNavigationBar];
    [self.output viewDidLoad];
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
    [self.scrollView addSubview:self.coverView];
    
    self.trailerButtonContainer = [[AYBlurButtonContainer alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    [self.scrollView addSubview:self.trailerButtonContainer];
    
    self.trailerButton = [AYTrailerButton newAutoLayoutView];
    [self.trailerButtonContainer.contentView addSubview:self.trailerButton];
    
    self.titleLabel = [UILabel newAutoLayoutView];
    self.titleLabel.numberOfLines = 0;
    [self.scrollView addSubview:self.titleLabel];
    
    self.subtitleLabel = [UILabel newAutoLayoutView];
    self.subtitleLabel.numberOfLines = 0;
    [self.scrollView addSubview:self.subtitleLabel];
    
    self.kinopoiskRatingView = [AYKinopoiskRatingView newAutoLayoutView];
    [self.scrollView addSubview:self.kinopoiskRatingView];
    
    self.imdbRatingView = [AYImdbRatingView newAutoLayoutView];
    [self.scrollView addSubview:self.imdbRatingView];
    
    self.ageRatingView = [AYAgeRatingView newAutoLayoutView];
    [self.scrollView addSubview:self.ageRatingView];
    
    self.descriptionContainer = [UIView newAutoLayoutView];
    [self.scrollView addSubview:self.descriptionContainer];
    
    self.descriptionView = [UITextView newAutoLayoutView];
    self.descriptionView.scrollEnabled = NO;
    self.descriptionView.backgroundColor = [UIColor clearColor];
    [self.descriptionContainer addSubview:self.descriptionView];
    
    self.gradientView = [AYGradientView newAutoLayoutView];
    [self.view addSubview:self.gradientView];
    
    self.watchButton = [AYRoundedButton newAutoLayoutView];
    [self.watchButton setAttributedTitle:[NSString attrubutedStringWithLineSpace:0
                                                                            font:[UIFont ay_secondaryFontWithSize:12]
                                                                       charSpace:1
                                                                           color:[UIColor whiteColor]
                                                                       alignment:NSTextAlignmentCenter
                                                                           value:NSLS(@"СМОТРЕТЬ ФИЛЬМ")]
                                forState:UIControlStateNormal];
    [self.watchButton setBackgroundColor:APLCSC(Color_Blue)];
    [self.watchButton addTarget:self.output
                         action:@selector(actionWatchMovie)
               forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.watchButton];
    
    self.bookmarkButton = [AYBookmarkButton newAutoLayoutView];
    [self.view addSubview:self.bookmarkButton];
    
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
        [self.coverView autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.coverView autoAlignAxisToSuperviewAxis:ALAxisVertical];
        
        [self.trailerButtonContainer autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.coverView withOffset:9];
        [self.trailerButtonContainer autoAlignAxisToSuperviewAxis:ALAxisVertical];
        
        [self.trailerButton autoPinEdgesToSuperviewEdges];
        [self.trailerButton autoSetDimension:ALDimensionHeight toSize:35];
        [self.trailerButton autoSetDimension:ALDimensionWidth toSize:120];
        
        [self.titleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.trailerButton withOffset:20];
        [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:38 relation:NSLayoutRelationGreaterThanOrEqual];
        [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:38 relation:NSLayoutRelationGreaterThanOrEqual];
        
        [self.subtitleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel withOffset:5];
        [self.subtitleLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.subtitleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:38 relation:NSLayoutRelationGreaterThanOrEqual];
        [self.subtitleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:38 relation:NSLayoutRelationGreaterThanOrEqual];
        
        [self.kinopoiskRatingView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.subtitleLabel withOffset:8];
        [self.kinopoiskRatingView autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.kinopoiskRatingView autoSetDimension:ALDimensionHeight toSize:14];
        
        [self.imdbRatingView autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.kinopoiskRatingView withOffset:-6];
        [self.imdbRatingView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.kinopoiskRatingView];
        
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
        
        [self.bookmarkButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.watchButton withOffset:10];
        [self.bookmarkButton autoSetDimensionsToSize:[self.bookmarkButton size]];
        [self.bookmarkButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.watchButton];
        
        [self.watchButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:25];
        [self.watchButton autoSetDimension:ALDimensionHeight toSize:50];
        [self.watchButton autoSetDimension:ALDimensionWidth toSize:190];
        [self.watchButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
        
        self.didSetupConstraints = YES;
    }
    
    if (self.coverHeightConstraint)
    {
        [self.coverHeightConstraint autoRemove];
    }
    if (self.coverView.image)
    {
        CGFloat ratio = self.coverView.image.size.height*150/self.coverView.image.size.width;
        self.coverHeightConstraint = [self.coverView autoSetDimension:ALDimensionHeight toSize:ratio];
    }
}

- (void)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - AYMoviewViewInput

- (void)configureWithMovie:(AYMoviePonso *)movie
{
    self.coverView.image = [UIImage imageWithContentsOfFile:movie.cover_url];
    
    self.titleLabel.attributedText = [NSString attrubutedStringWithLineSpace:21.5
                                                                        font:[UIFont ay_secondaryFontWithSize:18]
                                                                   charSpace:0
                                                                       color:APLCSC(Color_White)
                                                                   alignment:NSTextAlignmentCenter
                                                                       value:movie.title];
    
    self.subtitleLabel.attributedText = [NSString attrubutedStringWithLineSpace:13
                                                                           font:[UIFont ay_secondaryFontWithSize:11]
                                                                      charSpace:0.92
                                                                          color:[APLCSC(Color_White) colorWithAlphaComponent:0.5]
                                                                      alignment:NSTextAlignmentCenter
                                                                          value:movie.title_en];
    
    [self.kinopoiskRatingView configureWithRaiting:[NSString stringWithFormat:@"%@", movie.rating_kinopoisk]];
    [self.imdbRatingView configureWithRaiting:[NSString stringWithFormat:@"%@", movie.rating_imdb]];
    [self.ageRatingView configureWithRaiting:[NSString stringWithFormat:@"%@+", movie.rating_age]];
    
    self.descriptionView.attributedText = [NSString attrubutedStringWithLineSpace:24
                                                                             font:[UIFont ay_primaryFontWithSize:17]
                                                                        charSpace:0
                                                                            color:[APLCSC(Color_White) colorWithAlphaComponent:0.7]
                                                                        alignment:NSTextAlignmentLeft
                                                                            value:movie.desc];
    
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    [self.view layoutIfNeeded];
}

@end
