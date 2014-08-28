//
//  BarGraphView.m
//  week8-graph
//
//  Created by Jehyeok on 8/28/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import "BarGraphView.h"

@implementation BarGraphView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // context 받기
    CGContextRef myContext = UIGraphicsGetCurrentContext();
    
    int HEIGHT = 30;
    int INTERVAL = 0;
    
    for (NSDictionary *monthData in self.monthArr) {
        NSString *title = [monthData objectForKey:@"title"];
        [title drawInRect:CGRectMake(0.0, INTERVAL, 60.0, HEIGHT) withAttributes:nil];
        
        CGContextSetRGBFillColor(myContext, 0.0, 0.0, 200.0, 1.0);
        CGContextSetShadow(myContext, CGSizeMake(3.0, 3.0), 3.0);
        CGContextFillRect(myContext, CGRectMake(70.0, INTERVAL, [[monthData objectForKey:@"value"] floatValue] * 3, HEIGHT));
        INTERVAL += HEIGHT + 20;
    }
}

@end
