//
//  UIDickBar.m
//  UIDickBar
//
//  Created by digdog on 3/6/11.
//  Copyright 2011 Ching-Lan 'digdog' HUANG. All rights reserved.
//

#import "UIDickBar.h"

@interface UIDickBar () {
    UIDickBarActionBlock actionBlock_;
}

@property (nonatomic, copy) NSString *dickTitle;
@property (nonatomic, copy) NSString *dickBadge;

- (void)callActionBlock_:(id)sender;
- (void)orientationChanged_:(NSNotification *)notification;
@end


@implementation UIDickBar

@synthesize dickTitle = dickTitle_;
@synthesize dickBadge = dickBadge_;

- (id)initWithDickTitle:(NSString *)title dickBadge:(NSString *)badge actionBlock:(UIDickBarActionBlock)action
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.opaque = NO;
        self.backgroundColor = [UIColor clearColor];
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
                        
        dickTitle_ = [title copy];
        dickBadge_ = [badge copy];
        actionBlock_ = Block_copy(action);
        
        [self addTarget:self action:@selector(callActionBlock_:) forControlEvents:UIControlEventTouchUpInside];
        
        [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged_:)
                                                     name:UIDeviceOrientationDidChangeNotification object:nil];
    }
    return self;    
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
	CGContextSaveGState(context);
    CGFloat colors[] = {
        0.0f, 0.0f, 0.0f, 0.8f,
        0.1f, 0.1f, 0.1f, 0.8f
	};
    
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
	CGGradientRef gradient = CGGradientCreateWithColorComponents(rgb, colors, NULL, 2);
	CGColorSpaceRelease(rgb);
    
    CGPoint start = CGPointMake(rect.origin.x, rect.origin.y);
	CGPoint end = CGPointMake(rect.origin.x, rect.origin.y + 1);
	
	CGContextClipToRect(context, rect);
	CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
	
	CGGradientRelease(gradient);    
	CGContextRestoreGState(context);
    
    UIImage *image = [UIImage imageNamed:@"trends-icon"];
    [image drawAtPoint:CGPointMake(lround((rect.size.height - image.size.width) / 2), lround((rect.size.height - image.size.height) / 2)) blendMode:kCGBlendModeScreen alpha:0.8f];
    
    if (self.dickTitle) {
        CGContextSaveGState(context);
        UIFont *dickTitleFont = [UIFont boldSystemFontOfSize:18.0f];
        CGSize dickTitleSize = [self.dickTitle sizeWithFont:dickTitleFont];
        CGFloat dickTitlePointY = lround((rect.size.height - dickTitleSize.height) / 2);
        CGFloat dickTitlePointX = rect.size.height + dickTitlePointY;
        
        [[UIColor colorWithWhite:0.0 alpha:0.8] set];
        [self.dickTitle drawAtPoint:CGPointMake(dickTitlePointX, dickTitlePointY) withFont:dickTitleFont];

        [[UIColor colorWithWhite:1.0 alpha:0.8] set];
        [self.dickTitle drawAtPoint:CGPointMake(dickTitlePointX, dickTitlePointY + 1) withFont:dickTitleFont];
        CGContextRestoreGState(context);
    }
    
    if (self.dickBadge) {
        CGContextSaveGState(context);
        UIFont *dickBadgeFont = [UIFont systemFontOfSize:11.0f];
        CGSize dickBadgeSize = [self.dickBadge sizeWithFont:dickBadgeFont];
        CGFloat dickBadgePointY = lround((rect.size.height - dickBadgeSize.height) / 2);
        CGFloat dickBadgePointX = lround(rect.origin.x + rect.size.width - dickBadgePointY * 1.5 - dickBadgeSize.width);
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGFloat minX = dickBadgePointX - 10.0f;
		CGFloat maxX = dickBadgePointX + dickBadgeSize.width + 10.0f;
		CGFloat minY = dickBadgePointY - 2.0f;
		CGFloat maxY = dickBadgePointY + dickBadgeSize.height + 2.0f;

        CGPathMoveToPoint(path, NULL, minX, minY + 4.0f);
        CGPathAddArcToPoint(path, NULL, minX, minY, minX + 4.0f, minY , 4.0f);
        CGPathAddLineToPoint(path, NULL, maxX - 4.0f, minY);
        CGPathAddArcToPoint(path, NULL, maxX, minY, maxX, minY + 4.0f, 4.0f);
        CGPathAddLineToPoint(path, NULL, maxX, maxY - 4.0f);
        CGPathAddArcToPoint(path, NULL, maxX, maxY, maxX - 4.0f, maxY, 4.0f);
        CGPathAddLineToPoint(path, NULL, minX + 4.0f, maxY);
        CGPathAddArcToPoint(path, NULL, minX, maxY, minX, maxY - 4.0f, 4.0f);
        CGPathAddLineToPoint(path, NULL, minX, minY + 4.0f);

        CGContextAddPath(context, path);
        CGContextClip(context);
        CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
        CGFloat colors[] =
        {
            1.0f, 0.957f, 0.573f, 1.0f,
            0.996f, 0.843f, 0.506f, 1.0f,
        };
        CGGradientRef gradient = CGGradientCreateWithColorComponents(rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));
        CGColorSpaceRelease(rgb);
        CGContextDrawLinearGradient(context, gradient, CGPointMake(0., minY), CGPointMake(0., maxY), 0.);
        CGGradientRelease(gradient);                

        CFRelease(path);

        [[UIColor colorWithRed:0.522f green:0.249f blue:0.208f alpha:1.0f] set];
        [self.dickBadge drawAtPoint:CGPointMake(dickBadgePointX, dickBadgePointY) withFont:dickBadgeFont];
        CGContextRestoreGState(context);        
    }
        
	CGContextSaveGState(context);
	CGContextSetLineWidth(context, 1.0f);

	CGContextSetRGBStrokeColor(context, 0.1, 0.1, 0.1, 0.2);
	CGContextMoveToPoint(context, rect.origin.x, lround(rect.size.height / 2));
	CGContextAddLineToPoint(context, rect.origin.x + rect.size.width, lround(rect.size.height / 2));
	CGContextStrokePath(context);
    
	CGContextMoveToPoint(context, rect.origin.x + rect.size.height, rect.origin.y);
	CGContextAddLineToPoint(context, rect.origin.x + rect.size.height, rect.origin.y + rect.size.height);
	CGContextStrokePath(context);    

	CGContextSetRGBStrokeColor(context, 0.8, 0.8, 0.8, 0.2);
	CGContextMoveToPoint(context, rect.origin.x, lround(rect.size.height / 2) + 0.5);
	CGContextAddLineToPoint(context, rect.origin.x + rect.size.width, lround(rect.size.height / 2) + 0.5);
	CGContextStrokePath(context);
    
	CGContextMoveToPoint(context, rect.origin.x + rect.size.height + 0.5, rect.origin.y);
	CGContextAddLineToPoint(context, rect.origin.x + rect.size.height + 0.5, rect.origin.y + rect.size.height);
	CGContextStrokePath(context);
    CGContextRestoreGState(context);
}

- (void)updateDickTitle:(NSString *)title dickBadge:(NSString *)badge actionBlock:(UIDickBarActionBlock)action
{
    self.dickTitle = title;
    self.dickBadge = badge;
    
    [self removeTarget:self action:@selector(callActionBlock_:) forControlEvents:UIControlEventTouchUpInside];
    Block_release(actionBlock_);
    actionBlock_ = Block_copy(action);
    [self addTarget:self action:@selector(callActionBlock_:) forControlEvents:UIControlEventTouchUpInside];    

    [self setNeedsDisplay];
}

- (void)showInView:(UIView *)view
{
    if (view) {
        self.frame = CGRectMake(0.0f, 0.0f, view.frame.size.width, 0.0f);
        [view addSubview:self];
        
        [UIView beginAnimations:nil context:NULL];
        self.frame = CGRectMake(0.0f, 0.0f, view.frame.size.width, 44.0f);
        [UIView commitAnimations];
    }
}

- (void)callActionBlock_:(id)sender {
    actionBlock_();
}

- (void)orientationChanged_:(NSNotification *)notification
{
    [self setNeedsDisplay];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];

    [dickTitle_ release];
    [dickBadge_ release];
    
    Block_release(actionBlock_);
    
    [super dealloc];
}

@end
