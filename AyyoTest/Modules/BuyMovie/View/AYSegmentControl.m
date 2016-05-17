//
//  AYSegmentControl.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYSegmentControl.h"

#import <PureLayout.h>
#import "APLColorScheme.h"

@interface AYSegmentControl ()

@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) UIView *highlightView;
@property (nonatomic, strong) NSLayoutConstraint *highlightViewConstraintLeft;
@property (nonatomic, strong) NSLayoutConstraint *highlightViewConstraintRight;

@property (nonatomic, assign) BOOL didSetupConstraints;

@end

@implementation AYSegmentControl

- (void)setupView
{
    [super setupView];
    
    self.buttons = [NSMutableArray new];
    self.highlightView.backgroundColor = [UIColor redColor];
    self.highlightView = [UIView newAutoLayoutView];
    self.highlightView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.highlightView.layer.borderWidth = 1;
    [self addSubview:self.highlightView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.highlightView.layer.cornerRadius = CGRectGetHeight(self.bounds)/2;
}

- (void)updateConstraints
{
    [super updateConstraints];
    if (!self.didSetupConstraints)
    {
        for (NSInteger i = 0; i < self.buttons.count; i++)
        {
            UIButton *b = self.buttons[i];
            
            [b autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
            [b autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:8 relation:NSLayoutRelationGreaterThanOrEqual];
            [b autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:8 relation:NSLayoutRelationGreaterThanOrEqual];
            
            if (i == 0)
            {
                [b autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:12];
            } else
            {
                UIButton *pb = self.buttons[i-1];
                [b autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:pb withOffset:20];
            }
            if (i == self.buttons.count-1)
            {
                [b autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:12];
            }
        }
        
        [self.highlightView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.highlightView autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.highlightView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        
        self.didSetupConstraints = YES;
    }
    
    [self.highlightViewConstraintLeft autoRemove];
    [self.highlightViewConstraintRight autoRemove];
    
    if (self.selectedIndex < self.buttons.count)
    {
        UIButton *b = self.buttons[self.selectedIndex];
        self.highlightViewConstraintLeft = [self.highlightView autoPinEdge:ALEdgeLeft
                                                                    toEdge:ALEdgeLeft
                                                                    ofView:b
                                                                withOffset:-12];
        self.highlightViewConstraintRight = [self.highlightView autoPinEdge:ALEdgeRight
                                                                     toEdge:ALEdgeRight
                                                                     ofView:b
                                                                 withOffset:12];
    }
}

- (void)createItemsWithTitles:(NSArray *)titles
{
    self.titles = [titles copy];
    [self rebuild];
}

- (void)rebuild
{
    for (UIButton *b in self.buttons)
    {
        [b removeFromSuperview];
    }
    [self.buttons removeAllObjects];
    
    for (NSInteger i = 0; i < self.titles.count; i++)
    {
        NSString *title = self.titles[i];
        UIButton *b = [UIButton newAutoLayoutView];
        b.tag = i;
        [b setTitle:title forState:UIControlStateNormal];
        [b setTitleColor:[APLCSC(Color_White) colorWithAlphaComponent:0.5] forState:UIControlStateNormal];
        [b setTitleColor:APLCSC(Color_White) forState:UIControlStateSelected];
        [b addTarget:self
              action:@selector(actionSelect:)
    forControlEvents:UIControlEventTouchUpInside];
        
        [self.buttons addObject:b];
        [self addSubview:b];
    }
    
    self.didSetupConstraints = NO;
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [self layoutIfNeeded];
    
    self.selectedIndex = 0;
}

- (void)setSelectedIndex:(NSInteger)selectedIndex
{
    _selectedIndex = selectedIndex;
    for (NSInteger i = 0; i < self.buttons.count; i++)
    {
        UIButton *b = self.buttons[i];
        if (i == _selectedIndex)
        {
            b.selected = YES;
        } else
        {
            b.selected = NO;
        }
    }
    
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    
    __weak typeof(self) welf = self;
    [UIView animateWithDuration:0.25
                     animations:
     ^
    {
        [welf layoutIfNeeded];
    }];
}

- (void)actionSelect:(UIButton *)sender
{
    self.selectedIndex = sender.tag;
    [self.delegate ay_segmentControlDidChangeValue:self];
}

@end
