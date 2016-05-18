//
//  AYPriceSlider.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYPriceSlider.h"

#import <PureLayout.h>

#import "AYPriceCell.h"

@interface AYPriceSlider () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, assign) BOOL didSetupConstraints;

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIImageView *leftArrow;
@property (nonatomic, strong) UIImageView *rightArrow;

@end

@implementation AYPriceSlider

- (void)setupView
{
    [super setupView];
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds
                                             collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self.collectionView registerClass:[AYPriceCell class] forCellWithReuseIdentifier:[AYPriceCell identifier]];
    self.collectionView.pagingEnabled = YES;
    [self addSubview:self.collectionView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.collectionView addGestureRecognizer:tap];
    
    self.leftArrow = [UIImageView newAutoLayoutView];
    self.leftArrow.image = [UIImage imageNamed:@"arrow_left"];
    [self addSubview:self.leftArrow];
    
    self.rightArrow = [UIImageView newAutoLayoutView];
    self.rightArrow.image = [UIImage imageNamed:@"arrow_right"];
    [self addSubview:self.rightArrow];
}

- (void)updateConstraints
{
    [super updateConstraints];
    
    if (!self.didSetupConstraints)
    {
        [self.collectionView autoPinEdgesToSuperviewEdges];
        
        [self.leftArrow autoSetDimensionsToSize:self.leftArrow.image.size];
        [self.leftArrow autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:71];
        [self.leftArrow autoAlignAxis:ALAxisVertical toSameAxisOfView:self withOffset:-103];
        
        [self.rightArrow autoSetDimensionsToSize:self.leftArrow.image.size];
        [self.rightArrow autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:71];
        [self.rightArrow autoAlignAxis:ALAxisVertical toSameAxisOfView:self withOffset:103];
        
        self.didSetupConstraints = YES;
    }
}

- (void)reloadData
{
    [self.collectionView reloadData];
}

- (void)tap:(UITapGestureRecognizer *)tap
{
    CGPoint location = [tap locationInView:self];
    NSIndexPath *ip = [[self.collectionView indexPathsForVisibleItems] lastObject];
    NSInteger row = ip.row;
    
    if (location.x >= CGRectGetWidth(self.collectionView.bounds)/2)
    {
        [self scrollToRow:row+1];
    } else
    {
        [self scrollToRow:row-1];
    }
}

- (void)scrollToRow:(NSInteger)row
{
    if ([self.collectionView numberOfSections] > 0)
    {
        if ([self.collectionView numberOfItemsInSection:0] > row && row >= 0)
        {
            [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0]
                                        atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                                animated:YES];
        }
    }
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.dataSource numberOfItemsInSlider:self];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AYPriceCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[AYPriceCell identifier] forIndexPath:indexPath];
    
    AYPriceValuePonso *object = [self.dataSource objectAtIndex:indexPath.row];
    [cell configureWithPriceValue:object];
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)-28);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(28, 0, 0, 0);
}

@end
