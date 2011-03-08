//
//  UIDickBarController.m
//  UIDickBar
//
//  Created by Daniel Tull on 08.03.2011.
//  Copyright 2011 Daniel Tull. All rights reserved.
//

#import "UIDickBarController.h"


@implementation UIDickBarController

@synthesize tableView, dickBar;

- (void)dealloc {
	[tableView release], tableView = nil;
	[dickBar release], dickBar = nil;
    [super dealloc];
}

#pragma mark - UIDickBarController

- (void)loadTableView {}

- (UITableView *)tableView {
	
	if (!(tableView)) [self loadTableView];
	
	if (!(tableView)) {
		tableView = [[UITableView alloc] initWithFrame:self.view.bounds
												 style:UITableViewStylePlain];
	}
	
	return [[tableView retain] autorelease];
}

- (void)loadDickBar {}

- (UIDickBar *)dickBar {
	
	if (!(dickBar)) [self loadDickBar];
	
	if (!(dickBar)) {
		dickBar = [[UIDickBar alloc] initWithDickTitle:@"Dick Bar"
											 dickBadge:@"Badge"
										   actionBlock:nil];
	}
	
	return [[dickBar retain] autorelease];
}

- (IBAction)toggleDickBar:(id)sender {
	
	if (dickBarShowing)
		[self hideDickBar];
	else
		[self showDickBar];
}

- (void)hideDickBar {
	
	UIView *v = self.tableView.tableHeaderView;
	
	if ([self.dickBar.superview isEqual:v]) {
		
		NSArray *subviews = [v.subviews retain];
		
		for (UIView *s in subviews) 
			[s removeFromSuperview];
		
		v.frame = CGRectMake(v.frame.origin.x, v.frame.origin.y, v.frame.size.width, v.frame.size.height - 44.0f);
		
		for (UIView *s in subviews) {
			s.frame = CGRectMake(s.frame.origin.x, s.frame.origin.y - 44.0f, s.frame.size.width, s.frame.size.height);
			[v addSubview:s];
		}
		
		[subviews release];
		
		self.tableView.tableHeaderView = v;
		
	} else {
		
		[self.dickBar removeFromSuperview];
	}

	dickBarShowing = NO;
}

- (void)showDickBar {
	
	if (self.tableView.contentOffset.y > self.dickBar.bounds.size.height)
		[self.dickBar showInView:self.view];
	
	else {
		
		UIView *v = self.tableView.tableHeaderView;
		
		if (!(v)) {
			UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, 0.0f)];
			self.tableView.tableHeaderView = view;
			[view release];
		}
		
		v = self.tableView.tableHeaderView;
		
		NSArray *subviews = [v.subviews retain];
		
		for (UIView *s in subviews) 
			[s removeFromSuperview];
		
		v.frame = CGRectMake(v.frame.origin.x, v.frame.origin.y, v.frame.size.width, v.frame.size.height + 44.0f);
		
		for (UIView *s in subviews) {
			s.frame = CGRectMake(s.frame.origin.x, s.frame.origin.y + 44.0f, s.frame.size.width, s.frame.size.height);
			[v addSubview:s];
		}
		
		[subviews release];
		
		[self.dickBar showInView:v];
		self.tableView.tableHeaderView = v;
	}
	
	dickBarShowing = YES;
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self showDickBar];
}

- (void)viewDidUnload {
    [super viewDidUnload];
	self.tableView = nil;
	self.dickBar = nil;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	return nil;
}

@end
