//
//  Album.h
//  mid-term
//
//  Created by Jehyeok on 8/12/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject
@property (strong, nonatomic) NSMutableArray *photos;
@property (strong, nonatomic) NSMutableArray *originPhotos;

- (id)initWithPhotos:(NSMutableArray*)data;
- (void)sort;
- (void)setPhotosToOrigin;
@end
