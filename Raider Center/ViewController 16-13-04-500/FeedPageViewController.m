//
//  FeedPage.m
//  Raider Center
//
//  Created by Kevin Sirius Yang on 2/1/16.
//  Copyright © 2016 BaylorDEV. All rights reserved.
//

#import "ViewController.h"
#import <MJRefresh/MJRefresh.h>
#import "FeedPageViewController.h"
#import "CustomFeedCell.h"
#import "SWRevealViewController.h"

@interface CustomFeedTableViewController () {
    
}
@end

@implementation CustomFeedTableViewController{
   
}



- (void)viewDidLoad {
    [super viewDidLoad];
    _barButton.target = self.revealViewController;
    _barButton.action = @selector(revealToggle:);
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([CustomFeedCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass(NSStringFromClass([CustomFeedCell class]))];
    

    //Nick work on the auto check before login
    [self setupRefresh];
    
}
//PULL DOWN TO REFRESH VIEW
-(void)setupRefresh {
    static BOOL firstStart = YES;
    __weak UITableViewController *weakSelf = self;
    self.tableView.header = [MJRefreshHeader headerWithRefreshingBlock:^{
        int timeLimit = 3.5;
        if(firstStart)
        {
            firstStart = NO;
            timeLimit = 0;
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeLimit * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.tableView.header endRefreshing];
            self.num += 15;
            [self.tableView reloadData];
        });
    }];
    
    [self.tableView.header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{};
-(NSInteger)numberOfSectionsInFeedTable:(UITableView *) tableView {
   return self.num;
}

- (NSInteger)tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

/*-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndex:(NSIndexPath *)indexPath {
    return 44.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10.0;
}*/


/*  - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
      if(indexPath.section == 0) {
          FeedCell *cell = (FeedCell *)[tableView dequeueReuseableCellWithIdentifier:@"FeedCell" forIndexPath:indexPath];
          if(!cell) {
              cell = [[[NSBundle mainBundle] loadNibNamed:@"FeedCell" owner:self options:nil] objectAtIndex:0];
          }
          
      }
  }
-(void)tableView:(UITableVIew *)tableView actionSelectRowAtIndex:(NSIndexPath *)indexPath {
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"FeedPage" bundle:nil]
                           instantiateViewControllerWithIdentifier:@"FeedPageViewController" ];
    [self.navigationController pushViewController:vc animated:YES];
}


- (UITableViewCell *)*/
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
      CustomFeedCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CustomFeedCell class])];
      /*if(cell == nil) {
          cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FeedCell"];*/
    //configure the cell
    return cell;
};




/*- (void)CheckBeforeCatch {
    if (userIsLoggedIn != nil){
        
    }
}*/

@end