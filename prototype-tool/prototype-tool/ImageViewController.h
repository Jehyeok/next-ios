//
//  ImageViewController.h
//  prototype-tool
//
//  Created by Jehyeok on 7/29/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageViewManipulator.h"

@interface ImageViewController : UIViewController <UIScrollViewDelegate>
@property (strong, nonatomic) UIImageView *photoView;
@property (strong, nonatomic) UIImage *photo;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollV;
@property (strong, nonatomic) ImageViewManipulator *imageViewManipulator;
@end
