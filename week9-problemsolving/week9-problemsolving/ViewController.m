//
//  ViewController.m
//  week9-problemsolving
//
//  Created by Jehyeok on 9/4/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *urlAsString = @"http://125.209.194.123/wordlist.php";
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    NSData *data=[NSData dataWithContentsOfURL:url];
    _jsonArr = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSLog(@"%d", [_jsonArr count]);
    _counts = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [_jsonArr count]; i++) {
        [_counts addObject:@0];
    }
    
    dispatch_queue_t aQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    NSDate *methodStart = [NSDate date];

    for (int i = 0; i < [_jsonArr count]; i++) {
        NSString *contents = [_jsonArr objectAtIndex:i];
        dispatch_async(aQueue, ^{
            [self countWords:i contents:contents];
        });
    }
    
    NSDate *methodFinish = [NSDate date];
    NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:methodStart];
    NSLog(@"executionTime = %f", executionTime);
}

- (void)countWords:(NSUInteger)idx contents:(NSString*)contents
{
    NSUInteger count = 0;
    for (int j = 0; j < [_jsonArr count]; j++) {
        count += [self countOfSubstring:[_jsonArr objectAtIndex:j] atContents:contents];
    }
    [_counts insertObject:[NSNumber numberWithUnsignedInteger:count] atIndex:idx];
}

- (NSUInteger)countOfSubstring:(NSString*)substring atContents:(NSString*)contents
{
    NSRange range = [substring rangeOfString:contents];
    NSUInteger count = 0;
    
    while (range.length > 0) {
        count++;
        substring = [substring substringFromIndex:(range.location + 1)];
        range = [substring rangeOfString:contents];
    }
    return count;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
