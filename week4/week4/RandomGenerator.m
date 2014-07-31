//
//  RandomGenerator.m
//  week4
//
//  Created by Jehyeok on 7/31/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import "RandomGenerator.h"

@implementation RandomGenerator
@synthesize num;
- (void) generate
{
    // 1 ~ 3 생성
    int intNum = arc4random() % 3 + 1;

    // KVO
    self.num = [NSNumber numberWithInt:intNum];
    
    // not KVO
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"RandomGenerate" object:self userInfo:@{@"num": [NSNumber numberWithInt:intNum]}] ;
}
@end