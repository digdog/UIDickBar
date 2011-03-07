//
//  UIDickBar.h
//  UIDickBar
//
//  Created by digdog on 3/6/11.
//  Copyright 2011 Ching-Lan 'digdog' HUANG. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UIDickBarActionBlock)();

@interface UIDickBar : UIControl {
}
@property (nonatomic, copy, readonly) NSString *dickTitle;
@property (nonatomic, copy, readonly) NSString *dickBadge;

- (id)initWithDickTitle:(NSString *)title dickBadge:(NSString *)badge actionBlock:(UIDickBarActionBlock)action;
- (void)updateDickTitle:(NSString *)title dickBadge:(NSString *)badge actionBlock:(UIDickBarActionBlock)action;
- (void)showInView:(UIView *)view;
@end
