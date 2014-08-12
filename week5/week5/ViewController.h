//
//  ViewController.h
//  week5
//
//  Created by Jehyeok on 8/7/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageCacheArray.h"

@interface ViewController : UIViewController <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *imageSrollView;
@property (strong, nonatomic) IBOutlet ImageCacheArray *imageCacheArray;

@end
