//
//  ViewController.h
//  mid-term
//
//  Created by Jehyeok on 8/12/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Album.h"
#import "PhotoViewController.h"
#import "CustomCell.h"

@interface AlbumViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *albumTableView;
@property (strong, nonatomic) Album* album;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sort;
@property (strong, nonatomic) PhotoViewController *photoViewController;
@end
