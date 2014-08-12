//
//  imageCacheArray.m
//  week5
//
//  Created by Jehyeok on 8/7/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import "ImageCacheArray.h"

@implementation ImageCacheArray

- (id)initWithImageNum:(int)imageNum
{
    self = [super init];
    if (self)
    {
        self.imageViews = [[NSMutableArray alloc] initWithCapacity:imageNum];
        self.fileNames = [[NSMutableArray alloc] initWithCapacity:imageNum];
        self.visibleIdx = 0;
    }
    return self;
}

- (void) setImageViewAt:(int)idx
{
    CGSize imageViewSize = CGSizeMake(320, 200);
    
    UIImageView *imageView =[[UIImageView alloc] initWithFrame:CGRectMake(0, idx * 200, imageViewSize.width, imageViewSize.height)];
    [imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", idx + 1]]];
    
    [self.imageViews insertObject:imageView atIndex:idx];
//    [self.imageViews replaceObjectAtIndex:idx withObject:imageView];
}

- (void) removeImageViewAt:(int)idx
{
    [[self.imageViews objectAtIndex:idx] removeFromSuperview];
//    [self.imageViews replaceObjectAtIndex:idx withObject:[NSNull null]];
    [self.imageViews insertObject:[NSNull null] atIndex:idx];
}

- (UIImageView*) getImageViewAt:(int)idx
{
    return [self.imageViews objectAtIndex:idx];
}

- (void) setfileName:(NSString*)fileName idx:(int)idx
{
    [self.fileNames insertObject:fileName atIndex:idx];
}

- (NSString *) getFileNameAt:(int)idx
{
    return [self.fileNames objectAtIndex:idx];
}
@end
