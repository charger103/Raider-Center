//
//  FeedPage.m
//  Raider Center
//
//  Created by Kevin Sirius Yang on 2/1/16.
//  Copyright © 2016 BaylorDEV. All rights reserved.
//

#import "FeedPage.h"
#import "ViewController.h"

@interface FeedPage ()

@end

@implementation FeedPage
- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSelector:@selector(CheckBeforeCatch)];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)CheckBeforeCatch {
    if (userIsLoggedIn != nil){
        
    }
}