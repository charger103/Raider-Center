//
//  FeedDetailViewController.m
//  Raider Center
//
//  Created by Kevin Sirius Yang on 3/2/16.
//  Copyright © 2016 BaylorDEV. All rights reserved.
//

#import "CustomDetailTableViewCell.h"
#import "FeedDetailTableViewController.h"
@interface CustomFeedDetailTableViewController : UITableViewController
@end
@implementation CustomFeedDetailTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([CustomDetailTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass(NSStringFromClass([CustomDetailTableViewCell class]))];


    

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CustomDetailTableViewCell class])];
        if(cell == nil){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CUstomDetailTableViewCell"];
        }
    };
@end
