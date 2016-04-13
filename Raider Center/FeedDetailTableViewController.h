//
//  FeedDetailViewController.h
//  Raider Center
//
//  Created by Kevin Sirius Yang on 3/2/16.
//  Copyright © 2016 BaylorDEV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomFeedDetailTableViewController : UITableViewController

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath;

@end