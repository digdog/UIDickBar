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

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self.dickBar showInView:self.view];
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
