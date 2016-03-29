//
//  FeedDetailTableViewCell.m
//  Raider Center
//
//  Created by Kevin Sirius Yang on 3/2/16.
//  Copyright © 2016 BaylorDEV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FeedDetailTableViewCell.h"
#import <DateTools.h>




@implementation FeedDetailTableViewCell

-(void)awakefromNib {
    //initializing View
};

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

-(void)setTopicModel:(TopicModel *)topicModel {
    __topicModel = topicModel;
    /*[self.feederImage sd_setImageWithURL:[NSURL URLWithString:__topicModel.topicCreater.imageUrl] placeholderImage:[UIImage imageNamed:@"avator"]];*/
    self.feederName.text = __topicModel.topicCreater.username;
    self.feedTime.text = [__topicModel.topicCreateTime formattedDateWithFormat:@"MM-dd HH:mm"];
    self.feedDetail.text = __topicModel.topicContent;
    [self.contentView setNeedsUpdateConstraints];
}

@end
