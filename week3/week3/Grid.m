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

-(instancetype)initRows:(int)rowNum
{
    self = [super self];
    if (self) {
        rows = [[NSMutableArray alloc] initWithCapacity: rowNum];
        [rows insertObject:[NSMutableArray arrayWithObjects:@1,@2,@3,nil] atIndex:0];
        [rows insertObject:[NSMutableArray arrayWithObjects:@4,@0,@6,nil] atIndex:1];
        [rows insertObject:[NSMutableArray arrayWithObjects:@7,@8,@5,nil] atIndex:2];
        
        blankPos[0] = 1;
        blankPos[1] = 1;
    }
    return self;
}

-(void)render
{
    for (NSMutableArray *row in rows) {
        NSLog(@"%@", [row componentsJoinedByString:@", "]);
    }
}

-(void)moveVertical:(int)direction
{
    if ((blankPos[0] == 2 && direction == 1) || (blankPos[0] == 0 && direction == -1)) {
        return;
    }
    
    NSMutableArray *row = [[NSMutableArray alloc] init];
    NSMutableArray *nextRow = [[NSMutableArray alloc] init];
    
    row = [rows objectAtIndex:blankPos[0]];
    nextRow = [rows objectAtIndex:blankPos[0] + direction];
    
    NSNumber *num = [nextRow objectAtIndex:blankPos[1]];
    [nextRow replaceObjectAtIndex:blankPos[1] withObject:@0];
    [row replaceObjectAtIndex:blankPos[1] withObject:num];
    
    blankPos[0] += direction;
}

-(void)moveHorizontal:(int)direction
{
    if ((blankPos[1] == 0 && direction == -1) || (blankPos[1] == 2 && direction == 1)) {
        return;
    }
    NSMutableArray *row = [[NSMutableArray alloc] init];
    
    row = [rows objectAtIndex:blankPos[0]];
    
    NSNumber *num = [row objectAtIndex:blankPos[1] + direction];
    [row replaceObjectAtIndex:blankPos[1] withObject:num];
    [row replaceObjectAtIndex:(blankPos[1] + direction) withObject:@0];
    
    blankPos[1] += direction;
}
@end
