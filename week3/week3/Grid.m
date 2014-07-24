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
        [rows insertObject:[[NSMutableArray alloc] initWithCapacity:rowNum] atIndex:0];
        [rows insertObject:[[NSMutableArray alloc] initWithCapacity:rowNum] atIndex:1];
        [rows insertObject:[[NSMutableArray alloc] initWithCapacity:rowNum] atIndex:2];
        NSMutableArray *row;
        
        NSMutableSet *set = [[NSMutableSet alloc] init];
        while ([set count] != rowNum * rowNum - 1) {
            int r = (arc4random() % (rowNum * rowNum - 1)) + 1;
            
            if ([set containsObject:[NSNumber numberWithInt:r]] == NO) {
                if ([set count] < 3) {
                    row = [rows objectAtIndex:0];
                    NSLog(@"%@", [NSNumber numberWithInt:r]);
                    [row addObject:[NSNumber numberWithInt:r]];
                    [set addObject:[NSNumber numberWithInt:r]];
                } else if ([set count] < 6) {
                    row = [rows objectAtIndex:1];
                    [row addObject:[NSNumber numberWithInt:r]];
                    [set addObject:[NSNumber numberWithInt:r]];
                } else {
                    row = [rows objectAtIndex:2];
                    [row addObject:[NSNumber numberWithInt:r]];
                    [set addObject:[NSNumber numberWithInt:r]];
                }
            }
        }
        row = [rows objectAtIndex:2];
        [row addObject:@0];
        
        blankPos[0] = 2;
        blankPos[1] = 2;
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
    
    NSMutableArray *row;
    NSMutableArray *nextRow;
    
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
    NSMutableArray *row;
    
    row = [rows objectAtIndex:blankPos[0]];
    
    NSNumber *num = [row objectAtIndex:blankPos[1] + direction];
    [row replaceObjectAtIndex:blankPos[1] withObject:num];
    [row replaceObjectAtIndex:(blankPos[1] + direction) withObject:@0];
    
    blankPos[1] += direction;
}
@end
