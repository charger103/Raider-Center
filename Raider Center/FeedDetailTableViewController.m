//
//  FeedDetailViewController.m
//  Raider Center
//
//  Created by Kevin Sirius Yang on 3/2/16.
//  Copyright © 2016 BaylorDEV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomDetailTableViewCell.h"
#import "FeedDetailTableViewController.h"
@interface CustomFeedDetailTableViewController : UITableViewController

@end

@implementation CustomFeedDetailTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([CustomDetailTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass(NSStringFromClass([CustomDetailTableViewCell class]))];


    

    
    
    
    
/*-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeedDetailCell"];
        if(cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FeedDetailCell"];
        };*/
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CustomDetailTableViewCell class])];
        if(cell == nil){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CUstomDetailTableViewCell"];
        }
    };
@end