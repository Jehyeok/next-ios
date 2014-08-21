//
//  DetailViewController.m
//  week7
//
//  Created by Jehyeok on 8/21/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
    self.flag = NO;
    self.summedLength = 0;
    self.data = [[NSMutableData alloc] init];
    
    
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    
    CFStreamCreatePairWithSocketToHost(NULL, (__bridge CFStringRef)@"127.0.0.1", 8000, &readStream, &writeStream);
    
    NSInputStream *inputStream = (__bridge_transfer NSInputStream *)readStream;
    NSOutputStream *outputStream = (__bridge_transfer NSOutputStream *)writeStream;
    [inputStream setDelegate:self];
    [outputStream setDelegate:self];
    [inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [inputStream open];
    [outputStream open];

}

- (void)stream:(NSStream *)theStream handleEvent:(NSStreamEvent)streamEvent
{
    switch (streamEvent) {
        case NSStreamEventOpenCompleted:
            NSLog(@"Server Connected!");
            break;
        case NSStreamEventHasBytesAvailable: {
            unsigned int len = 0;
            
            if (self.flag == NO) {
                self.flag = YES;
                uint8_t buf[9];
                len = [(NSInputStream *)theStream read:buf maxLength:8];
                buf[len] = '\0';
                self.contentLength = atoi((const char *)buf);
                NSLog(@"header: %d", self.contentLength);
            }
            int size = 1024;
            
            if (self.contentLength < self.summedLength + 1024) {
                size = self.contentLength - self.summedLength;
            }
            
            uint8_t buf[size];
            
            len = [(NSInputStream *)theStream read:buf maxLength:size];
            
            if(len) {
                NSLog(@"%d", len);
                self.summedLength += len;
                [self.data appendData:[NSData dataWithBytes:buf length:len]];
                
                if (self.contentLength == self.summedLength) {
                    [self.detailImageView setImage:[UIImage imageWithData:self.data]];
                    self.flag = NO;
                    self.summedLength = 0;
                    self.data = [[NSMutableData alloc] init];
                    NSLog(@"draw");
                }
            } else {
                NSLog(@"no buffer!");
            }
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
