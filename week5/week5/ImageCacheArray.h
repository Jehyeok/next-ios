//
//  imageCacheArray.h
//  week5
//
//  Created by Jehyeok on 8/7/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageCacheArray : NSObject
@property (strong, nonatomic) NSMutableArray *imageViews;
@property (strong, nonatomic) NSMutableArray *fileNames;
@property (strong, nonatomic) NSNumber *visibleIdx;

- (id)initWithImageNum:(int)imageNum;
- (void) setImageViewAt:(int)idx;
- (void) removeImageViewAt:(int)idx;
- (void) setfileName:(NSString*)fileName idx:(int)idx;
- (UIImageView*) getImageViewAt:(int)idx;

@end
