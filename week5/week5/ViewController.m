//
//  ViewController.m
//  week5
//
//  Created by Jehyeok on 8/7/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize imageSrollView;
@synthesize imageCacheArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGSize imageViewSize = CGSizeMake(320, 200);
    imageSrollView.delegate = self;
    [imageSrollView setContentSize:CGSizeMake(320, imageViewSize.height * 22)];
    [imageSrollView setScrollEnabled:YES];
    
    imageCacheArray = [[ImageCacheArray alloc] initWithImageNum:22];
    
    for (int i = 0; i < 5; i++) {
        [imageCacheArray setfileName:[NSString stringWithFormat:@"%d.jpg", i + 1] idx:i];
        [imageCacheArray setImageViewAt:i];
        UIImageView *imageView = [imageCacheArray getImageViewAt:i];
        [imageSrollView addSubview:imageView];
    }
    
    [imageCacheArray removeImageViewAt:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%@", NSStringFromCGPoint(scrollView.contentOffset));
    
    //568
    // offset - 200 * 2
    // offset + 200 * 2
    // 0~200 / 200 = 0
    // 200~400 / 200 = 1
    CGFloat offsetY = scrollView.contentOffset.y;
    
    [imageCacheArray setVisibleIdx:[NSNumber numberWithInt:offsetY]];
    int visibleIdx = offsetY / 200;
    
    for (int i = visibleIdx - 2; i <= visibleIdx + 2; i++) {
        if (i < 0 || i > 21 ) return;
        [imageCacheArray setfileName:[NSString stringWithFormat:@"%d.jpg", i + 1] idx:i];
        [imageCacheArray setImageViewAt:i];
        UIImageView *imageView = [imageCacheArray getImageViewAt:i];
        [imageSrollView addSubview:imageView];
    }

//    for (int i = 0; i < visibleIdx - 2; i++) {
//        if (i < 0 || i > 21 ) return;
//        [imageCacheArray removeImageViewAt:i];
//    }
//
//    for (int i = visibleIdx + 2; i < 22; i++) {
//        if (i < 0 || i > 21 ) return;
//        [imageCacheArray removeImageViewAt:i];
//    }
}
@end
