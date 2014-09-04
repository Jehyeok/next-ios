//
//  ImageViewController.m
//  prototype-tool
//
//  Created by Jehyeok on 7/29/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"view did load");
    _photoView = [[UIImageView alloc] initWithFrame:CGRectMake(100.0f, 100.0f, 200.0f, 100.0f)];
    [_photoView setImage:_photo];
    _scrollV.contentSize=CGSizeMake(320, 568);
    [_scrollV addSubview:_photoView];
    [_scrollV setBackgroundColor:[UIColor clearColor]];
    
    _scrollV.minimumZoomScale=0.5;
    _scrollV.maximumZoomScale=6.0;
    _scrollV.delegate=self;
    NSLog(@"%f", _scrollV.contentSize.width);
//    self.imageViewManipulator = [[ImageViewManipulator alloc] init];
//    [self.imageViewManipulator setImageView:self.photoView];
//    [self.imageViewManipulator setImage:self.photo];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _photoView;
    NSLog(@"%f", _scrollV.contentSize.width);
}

- (void)centerScrollViewContents {
    CGSize boundsSize = self.scrollV.bounds.size;
    CGRect viewFrame = self.view.frame;
    
    if (viewFrame.size.width < boundsSize.width) {
        viewFrame.origin.x = (boundsSize.width - viewFrame.size.width) / 2.0f;
    } else {
        viewFrame.origin.x = 0.0f;
    }
    
    if (viewFrame.size.height < boundsSize.height) {
        viewFrame.origin.y = (boundsSize.height - viewFrame.size.height) / 2.0f;
    } else {
        viewFrame.origin.y = 0.0f;
    }
    
    self.view.frame = viewFrame;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    // The scroll view has zoomed, so you need to re-center the contents
    [self centerScrollViewContents];
    NSLog(@"didzoom");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
