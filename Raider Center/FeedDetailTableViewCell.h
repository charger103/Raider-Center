//
//  FeedDetailTableViewCell.h
//  Raider Center
//
//  Created by Kevin Sirius Yang on 3/2/16.
//  Copyright © 2016 BaylorDEV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedModel.h"
@interface FeedDetailTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *feederImage;
@property (weak, nonatomic) IBOutlet UILabel *feedDetail;
@property (weak, nonatomic) IBOutlet UILabel*feederName;
@property (weak, nonatomic) IBOutlet UILabel *feedTime;
@property (weak, nonatomic) IBOutlet UILabel *numRead;
@end

