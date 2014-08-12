//
//  Album.m
//  mid-term
//
//  Created by Jehyeok on 8/12/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import "Album.h"

@implementation Album
@synthesize photos, originPhotos;

- (id)initWithPhotos:(NSMutableArray*)data
{
    self = [super init];
    if (self)
    {

    }
    
    // 1 ~ 3 생성
    int intNum = arc4random() % 3 + 1;
    
    originPhotos = [[NSMutableArray alloc] initWithArray:data];
    photos = [[NSMutableArray alloc] initWithArray:data];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AlbumChanged" object:self userInfo:@{@"num": [NSNumber numberWithInt:intNum]}];
    
    return self;
}

- (void)sort
{
    photos = [originPhotos sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [[obj1 objectForKey:@"date"] compare:[obj2 objectForKey:@"date"]];
    }];

    [[NSNotificationCenter defaultCenter] postNotificationName:@"sortAlbum" object:self];
}

- (void)setPhotosToOrigin
{
    photos = originPhotos;
}

@end
