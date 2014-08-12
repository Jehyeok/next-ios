//
//  PhotoViewController.h
//  mid-term
//
//  Created by Jehyeok on 8/12/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *photoImageView;
@property (strong, nonatomic) IBOutlet UILabel *photoTitle;
@property (strong, nonatomic) IBOutlet UILabel *photoDate;
@property (strong, nonatomic) NSDictionary *data;

@end
