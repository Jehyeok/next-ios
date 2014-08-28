//
//  ViewController.m
//  week8-graph
//
//  Created by Jehyeok on 8/28/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.barGraphView = [[BarGraphView alloc] initWithFrame:CGRectMake(0, 0, 200, 500)];
    [self.barGraphView setBackgroundColor:[UIColor clearColor]];
    
    NSString *monthData = @"[{\"title\":\"April\", \"value\":5},{\"title\":\"May\", \"value\":12},{\"title\":\"June\", \"value\":18},{\"title\":\"July\", \"value\":11},{\"title\":\"August\", \"value\":15},{\"title\":\"September\", \"value\":9},{\"title\":\"October\", \"value\":17},{\"title\":\"November\", \"value\":25},{\"title\":\"December\", \"value\":31}]";
    NSData *monthNSData = [monthData dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *monthArr = [NSJSONSerialization JSONObjectWithData:monthNSData options:NSJSONReadingMutableContainers error:nil];
    
    NSString *pieDataString = @"[{\"title\":\"April\", \"percentage\":18},{\"title\":\"May\", \"percentage\":12},{\"title\":\"June\", \"percentage\":18},{\"title\":\"July\", \"percentage\":13},{\"title\":\"August\", \"percentage\":18}, {\"title\":\"September\", \"percentage\":9},{\"title\":\"October\", \"percentage\":18}]";
    NSData *pieNSData = [pieDataString dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *pieArr = [NSJSONSerialization JSONObjectWithData:pieNSData options:NSJSONReadingMutableContainers error:nil];
    
    self.barGraphView.monthArr = monthArr;
    self.pieGraphView.pieArr = pieArr;
    
    [self.scrollView setContentSize:CGSizeMake(200, 500)];
    [self.scrollView addSubview:self.barGraphView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
