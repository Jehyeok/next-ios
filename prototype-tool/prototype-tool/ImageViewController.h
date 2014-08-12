//
//  ImageViewController.h
//  prototype-tool
//
//  Created by Jehyeok on 7/29/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (strong, nonatomic) UIImage *photo;

@end
