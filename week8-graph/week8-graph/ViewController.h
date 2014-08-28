//
//  ViewController.h
//  week8-graph
//
//  Created by Jehyeok on 8/28/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BarGraphView.h"
#import "PieGraphView.h"

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet BarGraphView *barGraphView;
@property (strong, nonatomic) IBOutlet PieGraphView *pieGraphView;

@end
