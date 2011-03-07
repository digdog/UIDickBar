//
//  RootViewController.h
//  UIDickBar
//
//  Created by digdog on 3/6/11.
//  Copyright 2011 Ching-Lan 'digdog' HUANG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIDickBar.h"

@interface RootViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
}
@property (nonatomic, retain) IBOutlet UITableView *tableView;


@end
