//
//  ViewController.m
//  week9
//
//  Created by Jehyeok on 9/2/14.
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickBtn:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        self.firstBtn.backgroundColor = [UIColor blueColor];
        self.firstBtn.alpha = 0.5;
        self.firstBtn.titleLabel.text = @"animated";
        [self.firstBtn setFrame:CGRectMake(0, 100, 100, 100)];
    } completion:^(BOOL finished) {
    }];
}
@end
