//
//  UIDickBar.m
//  UIDickBar
//
//  Created by digdog on 3/6/11.
//  Copyright 2011 Ching-Lan 'digdog' HUANG. All rights reserved.
//

#import "UIDickBar.h"


@interface UIDickBar () {
    id<UIDickBarDelegate> delegate_;
    id<UIDickBarDataSource> dataSource_;
    NSUInteger currentDickIndex_;
    NSString *currentDickTitle_;
    NSURL *currentDickURL_;
}

@property (nonatomic, assign) id<UIDickBarDelegate> delegate;
@property (nonatomic, assign) id<UIDickBarDataSource> dataSource; 
@property (nonatomic, assign) NSUInteger currentDickIndex;
@property (nonatomic, copy) NSString *currentDickTitle;
@property (nonatomic, copy) NSURL *currentDickURL;
@end


@implementation UIDickBar

@synthesize delegate = delegate_;
@synthesize dataSource = dataSource_;
@synthesize currentDickIndex = currentDickIndex_;
@synthesize currentDickTitle = currentDickTitle_;
@synthesize currentDickURL = currentDickURL_;

- (id)initWithDelegate:(id<UIDickBarDelegate>)delegate dataSource:(id<UIDickBarDataSource>)dataSource
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        delegate_ = delegate;
        dataSource_ = dataSource;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)showInView:(UIView *)view
{
}

- (void)dealloc
{
    delegate_ = nil;
    dataSource_ = nil;
    [currentDickTitle_ release];
    [currentDickURL_ release];
    
    [super dealloc];
}

@end
