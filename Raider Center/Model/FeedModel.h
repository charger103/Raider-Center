//
//  FeedModel.h
//  
//
//  Created by Kevin Sirius Yang on 2/3/16.
//
//

#import <Foundation/Foundation.h>
#import "FeedUser.h"
@interface FeedModel : NSObject

@property (nonatomic, strong) FeedUser *upLoader;
@property (nonatomic, strong) NSDate *feedCreateTime;
@property (nonatomic, strong) NSString *content;
@end