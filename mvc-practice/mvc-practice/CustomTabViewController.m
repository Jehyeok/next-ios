//
//  CustomTabViewController.m
//  mvc-practice
//
//  Created by Jehyeok on 7/29/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import "CustomTabViewController.h"

@interface CustomTabViewController ()

@end

@implementation CustomTabViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClickBtn:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://nhnnext.org" ]];
}
- (IBAction)onColorBtn:(id)sender {
    [self.view setBackgroundColor:[UIColor yellowColor]];
}
@end
