//
//  ViewController.h
//  week4
//
//  Created by Jehyeok on 7/31/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RandomGenerator.h"

@interface ViewController : UIViewController
@property NSNumber *num;
@property (strong, nonatomic) IBOutlet UIImageView *iv;
@property (strong, nonatomic) RandomGenerator * randomGenerator;
@property (strong, nonatomic) UIImage *gawi_img;
@property (strong, nonatomic) UIImage *bawi_img;
@property (strong, nonatomic) UIImage *bo_img;
@end
