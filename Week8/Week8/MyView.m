//
//  MyView.m
//  Week8
//
//  Created by Jehyeok on 8/26/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import "MyView.h"

@implementation MyView

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
    
    // gradient 배경 생성
    CGGradientRef gradient = [self gradient];
    CGPoint startPoint = CGPointMake(CGRectGetMidX(self.bounds), 0.0);
    CGPoint endPoint = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMaxY(self.bounds));
    CGContextDrawLinearGradient(myContext, gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient);
    
    [self drawLines];
    [self drawCircles:myContext];
}

- (CGGradientRef)gradient
{
    CGGradientRef gradient = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), (CFArrayRef)[NSArray arrayWithObjects:[[UIColor redColor] CGColor], [[UIColor whiteColor] CGColor], [[UIColor whiteColor] CGColor], nil], nil);
    
    return gradient;
}

- (CGPoint)CGPointCreateRandom
{
    CGPoint point;
    int posX = (arc4random() % (int)self.bounds.size.width) + 1;
    int posY = (arc4random() % (int)self.bounds.size.height) + 1;
    point = CGPointMake(posX, posY);
    return point;
}

- (void)drawLines
{
    for (int i = 0; i < 10; i++) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        CGPoint startPoint = [self CGPointCreateRandom];
        CGPoint endPoint = [self CGPointCreateRandom];
        [path moveToPoint:startPoint];
        [path addLineToPoint:endPoint];
        [path setLineWidth:1.0];
        [path stroke];
    }
}

- (void)drawCircles:(CGContextRef)ctx
{
    for (int i = 0; i < 10; i++) {
        CGPoint originPoint = [self CGPointCreateRandom];
        int radius = (arc4random() % 100) + 1;
        CGContextAddArc(ctx, originPoint.x, originPoint.y, radius, 0.0, M_PI * 2, YES);
        CGContextStrokePath(ctx);
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"tap");
    [self setNeedsDisplay];
}
@end
