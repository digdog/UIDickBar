//
//  UIDickBar.h
//  UIDickBar
//
//  Created by digdog on 3/6/11.
//  Copyright 2011 Ching-Lan 'digdog' HUANG. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIDickBarDelegate;
@protocol UIDickBarDataSource; 

@interface UIDickBar : UIControl {
}
@property (nonatomic, assign, readonly) NSUInteger currentDickIndex;
@property (nonatomic, copy, readonly) NSString *currentDickTitle;
@property (nonatomic, copy, readonly) NSURL *currentDickURL;

- (id)initWithDelegate:(id<UIDickBarDelegate>)delegate dataSource:(id<UIDickBarDataSource>)dataSource;
// Displays a dick bar that originates from the specified view.
- (void)showInView:(UIView *)view;
@end


@protocol UIDickBarDelegate <NSObject>
@optional
- (void)willPresentDickBar;
- (void)didPresentDickBar;
- (void)willDismissDickBar;
- (void)didDismissDickBar;
- (void)didClickDickBar:(UIDickBar *)dickBar;
@end


@protocol UIDickBarDataSource <NSObject>
@required
- (NSInteger)numberOfDicksInDickBar:(UIDickBar *)dickBar;
- (NSString *)dickBar:(UIDickBar *)dickBar titleForDickAtIndex:(NSUInteger)dickIndex;
- (NSURL *)dickBar:(UIDickBar *)dickBar URLForDickAtIndex:(NSUInteger)dickIndex;
@end
