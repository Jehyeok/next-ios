//
//  Album.h
//  mid-term
//
//  Created by Jehyeok on 8/12/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

@interface Album : NSObject <NSURLConnectionDelegate>
@property (strong, nonatomic) NSMutableArray *photos;
@property (strong, nonatomic) NSMutableArray *originPhotos;
@property (strong, nonatomic) NSString *cachePath;
@property (strong, nonatomic) Reachability *reachability;

- (id)initWithPhotos:(NSMutableArray*)data;
- (void)sort;
- (void)setPhotosToOrigin;
@end
