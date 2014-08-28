//
//  PieGraphView.m
//  week8-graph
//
//  Created by Jehyeok on 8/28/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import "PieGraphView.h"

@implementation PieGraphView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // context 받기
    CGContextRef myContext = UIGraphicsGetCurrentContext();
    
    NSLog(@"%@", self.pieArr);
    float start = 0.0;
    for (NSDictionary *monthData in self.pieArr) {
        int radius = 100;
        float arcLength = 2 * M_PI * 0.01 * [[monthData objectForKey:@"percentage"] floatValue];
        
        CGMutablePathRef arc = CGPathCreateMutable();
        CGPathMoveToPoint(arc, NULL,
                          100.0, 100.0);
        CGPathAddArc(arc, NULL,
                     100.0, 100.0,
                     radius,
                     start,
                     start + arcLength,
                     NO);
        CGPathAddLineToPoint(arc, NULL, 100.0, 100.0);
        
        CGContextAddPath(myContext, arc);
        
        float color = arc4random() % 255 + 1;
        color /= 255.0;
        CGContextSetStrokeColorWithColor(myContext, [[UIColor blueColor] CGColor]);
        CGContextSetFillColorWithColor(myContext, [[UIColor colorWithRed:color green:color blue:color alpha:1.0] CGColor]);
        CGContextFillPath(myContext);
        start += arcLength;
    }
}

@end
