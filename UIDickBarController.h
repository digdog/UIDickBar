//
//  UIDickBarController.h
//  UIDickBar
//
//  Created by Daniel Tull on 08.03.2011.
//  Copyright 2011 Daniel Tull. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIDickBar.h"

@interface UIDickBarController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	BOOL dickBarShowing;
}

@property (nonatomic, retain) IBOutlet UIDickBar *dickBar;
@property (nonatomic, retain) IBOutlet UITableView *tableView;

- (void)loadTableView;
- (void)loadDickBar;

- (IBAction)toggleDickBar:(id)sender;
- (void)hideDickBar;
- (void)showDickBar;

@end
