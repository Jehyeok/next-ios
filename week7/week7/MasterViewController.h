//
//  MasterViewController.h
//  week7
//
//  Created by Jehyeok on 8/21/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CFNetwork/CFNetwork.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController <NSStreamDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
