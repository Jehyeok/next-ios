//
//  ViewController.m
//  mid-term
//
//  Created by Jehyeok on 8/12/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import "AlbumViewController.h"

@interface AlbumViewController ()

@end

@implementation AlbumViewController
@synthesize album;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // notiCenter 생성
    NSNotificationCenter *notiCenter = [NSNotificationCenter defaultCenter];
    // notiCenter 등록
    [notiCenter addObserver:self selector:@selector(receiveRandomGeneratorNotification:) name:@"AlbumChanged" object:album];
    
    // data 초기화
    char *data = "[{\"title\":\"초록\",\"image\":\"01.jpg\",\"date\":\"20140116\"},\ {\"title\":\"장미\",\"image\":\"02.jpg\",\"date\":\"20140505\"},\ {\"title\":\"낙엽\",\"image\":\"03.jpg\",\"date\":\"20131212\"},\ {\"title\":\"계단\",\"image\":\"04.jpg\",\"date\":\"20130301\"},\ {\"title\":\"벽돌\",\"image\":\"05.jpg\",\"date\":\"20140101\"},\ {\"title\":\"바다\",\"image\":\"06.jpg\",\"date\":\"20130707\"},\ {\"title\":\"벌레\",\"image\":\"07.jpg\",\"date\":\"20130815\"},\ {\"title\":\"나무\",\"image\":\"08.jpg\",\"date\":\"20131231\"},\ {\"title\":\"흑백\",\"image\":\"09.jpg\",\"date\":\"20140102\"}]";
    
    NSString *dataStringObj = [[NSString alloc] initWithUTF8String:data];
    NSData *dataFromStirng = [dataStringObj dataUsingEncoding:NSUTF8StringEncoding];
//    NSLog(@"%@", dataStringObj);
    NSMutableArray *dataArr = [NSJSONSerialization JSONObjectWithData:dataFromStirng options:0 error:nil];
//    NSLog(@"%@", dataArr);
    
    album = [[Album alloc] initWithPhotos:dataArr];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)receiveRandomGeneratorNotification:(NSNotification *)notification
{
    NSLog(@"noti");
    if ([[notification name] isEqualToString:@"AlbumChanged"]) {
        NSLog(@"%@",[[notification userInfo] objectForKey:@"num"]);
    }
}

@end
