//
//  Grid.h
//  week3
//
//  Created by Jehyeok on 7/24/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Grid : NSObject
{
    int blankPos[2];
}

@property(retain) NSMutableArray *rows;

-initRows:(int)rowNum;
-(void)render;
-(void)moveVertical:(int)direction;
-(void)moveHorizontal:(int)direction;
@end
