//
//  DetailViewController.h
//  week7
//
//  Created by Jehyeok on 8/21/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate, NSStreamDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *detailImageView;
@property (strong, nonatomic) NSMutableData *data;
@property (strong, nonatomic) NSOutputStream *outputStream;
@property (strong, nonatomic) NSInputStream *inputStream;
@property (nonatomic) BOOL flag;
@property (nonatomic) int contentLength;
@property (nonatomic) int summedLength;
@end