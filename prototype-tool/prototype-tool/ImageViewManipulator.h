//
//  ImageManipulator.h
//  prototype-tool
//
//  Created by Jehyeok on 8/31/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageViewManipulator : NSObject

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) NSArray *allTouches;
@property (strong, nonatomic) UITouch *firstTouch;
@property (strong, nonatomic) UITouch *secondTouch;

- (void)scaleWidth:(UIView*)view;
- (void)setImage:(UIImage*)image;
- (void)setTouches:(NSArray*)allTouches;
- (float)getAbs:(float)num;

@end
