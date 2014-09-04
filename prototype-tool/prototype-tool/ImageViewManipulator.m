//
//  ImageManipulator.m
//  prototype-tool
//
//  Created by Jehyeok on 8/31/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import "ImageViewManipulator.h"

@implementation ImageViewManipulator
@synthesize allTouches;
@synthesize firstTouch, secondTouch;

- (void)scaleWidth:(UIView*)view
{
    CGPoint firstPreviousLocation = [firstTouch previousLocationInView:view];
    CGPoint secondPreviousLocation = [secondTouch previousLocationInView:view];
    CGPoint firstCurLocation = [firstTouch locationInView:view];
    CGPoint secondCurLocation = [secondTouch locationInView:view];
    
    float previousWidth = secondPreviousLocation.x - firstPreviousLocation.x;
    float curWidth = secondCurLocation.x - firstCurLocation.x;
    float previousHeight = secondPreviousLocation.y - firstPreviousLocation.y;
    float curHeight = secondCurLocation.y - firstCurLocation.y;
    
    previousWidth = [self getAbs:previousWidth];
    previousHeight = [self getAbs:previousHeight];
    curWidth = [self getAbs:curWidth];
    curHeight = [self getAbs:curHeight];
    
    CGRect previouseFrame = self.imageView.frame;
    
    [self.imageView setFrame:CGRectMake(previouseFrame.origin.x - (curWidth - previousWidth) / 2, previouseFrame.origin.y, previouseFrame.size.width + curWidth - previousWidth, previouseFrame.size.height)];
    [self.imageView setFrame:CGRectMake(previouseFrame.origin.y - (curHeight - previousHeight) / 2, previouseFrame.origin.x, previouseFrame.size.height + curHeight - previousHeight, previouseFrame.size.width)];
}

- (float)getAbs:(float)num
{
    if (num < 0) num *= -1;
    return num;
}

- (void)setImage:(UIImage *)image
{
    [self.imageView setImage:image];
}

- (void)setTouches:(NSArray *)allTouches
{
    self.allTouches = [NSArray arrayWithArray:allTouches];
    firstTouch = [self.allTouches objectAtIndex:0];
    secondTouch = [self.allTouches objectAtIndex:1];
}
@end

