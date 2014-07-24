//
//  Grid.h
//  week3
//
//  Created by Jehyeok on 7/24/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Grid : NSObject

@property(retain) NSMutableArray *rows;

-(void)initRows:(int)rowNum;
@end
