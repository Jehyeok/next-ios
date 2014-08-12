//
//  Album.m
//  mid-term
//
//  Created by Jehyeok on 8/12/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import "Album.h"

@implementation Album
- (id)initWithPhotos:(NSMutableArray*)data
{
    self = [super init];
    if (self)
    {

    }
    // 1 ~ 3 생성
    int intNum = arc4random() % 3 + 1;
    
//    NSLog(@"album noti post");
    // not KVO
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AlbumChanged" object:self userInfo:@{@"num": [NSNumber numberWithInt:intNum]}] ;
    
    return self;
}
@end
