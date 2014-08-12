//
//  ViewController.h
//  prototype-tool
//
//  Created by Jehyeok on 7/29/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageViewController.h"

@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *galleryBtn;
@end

