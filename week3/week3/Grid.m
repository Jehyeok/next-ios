//
//  Grid.m
//  week3
//
//  Created by Jehyeok on 7/24/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import "Grid.h"

@implementation Grid
@synthesize rows;

-(void)initRows:(int)rowNum
{
    rows = [[NSMutableArray alloc] initWithCapacity: rowNum];
    [rows insertObject:[NSMutableArray arrayWithObjects:@1,@2,@3,nil] atIndex:0];
    [rows insertObject:[NSMutableArray arrayWithObjects:@4,@0,@6,nil] atIndex:1];
    [rows insertObject:[NSMutableArray arrayWithObjects:@7,@8,@5,nil] atIndex:2];
}
@end
