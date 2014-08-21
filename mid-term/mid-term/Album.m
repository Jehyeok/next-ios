//
//  Album.m
//  mid-term
//
//  Created by Jehyeok on 8/12/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import "Album.h"

@implementation Album
@synthesize photos, originPhotos;
@synthesize cachePath;
@synthesize reachability;

- (id)init
{
    self = [super init];
    if (self)
    {

    }
    
    reachability = [Reachability reachabilityForLocalWiFi];
    NetworkStatus *status = [reachability currentReachabilityStatus];
    NSMutableArray *dataArr;
    
    if (status == NotReachable) {
        // data 초기화
        char *data = "[{\"title\":\"초록\",\"image\":\"01.jpg\",\"date\":\"20140116\"},\ {\"title\":\"장미\",\"image\":\"02.jpg\",\"date\":\"20140505\"},\ {\"title\":\"낙엽\",\"image\":\"03.jpg\",\"date\":\"20131212\"},\ {\"title\":\"계단\",\"image\":\"04.jpg\",\"date\":\"20130301\"},\ {\"title\":\"벽돌\",\"image\":\"05.jpg\",\"date\":\"20140101\"},\ {\"title\":\"바다\",\"image\":\"06.jpg\",\"date\":\"20130707\"},\ {\"title\":\"벌레\",\"image\":\"07.jpg\",\"date\":\"20130815\"},\ {\"title\":\"나무\",\"image\":\"08.jpg\",\"date\":\"20131231\"},\ {\"title\":\"흑백\",\"image\":\"09.jpg\",\"date\":\"20140102\"}]";
        
        // char -> json 역직렬화
        NSString *dataStringObj = [[NSString alloc] initWithUTF8String:data];
        NSData *dataFromStirng = [dataStringObj dataUsingEncoding:NSUTF8StringEncoding];
        //    NSLog(@"%@", dataStringObj);
        dataArr = [NSJSONSerialization JSONObjectWithData:dataFromStirng options:0 error:nil];
    } else if (status == ReachableViaWiFi) {
        NSLog(@"connect");
        NSData* _data = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://125.209.194.123/json.php"]] returningResponse:nil error:nil];
        
        dataArr = [NSJSONSerialization JSONObjectWithData:_data options:0 error:nil];
    }
    
    [reachability startNotifier];
    
    originPhotos = [[NSMutableArray alloc] initWithArray:dataArr];
    photos = [[NSMutableArray alloc] initWithArray:dataArr];
//    originPhotos = [[NSMutableArray alloc] initWithArray:data];
//    photos = [[NSMutableArray alloc] initWithArray:data];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    cachePath = [paths objectAtIndex:0];
    
    BOOL isDir = NO;
    NSError *error;
    if (! [[NSFileManager defaultManager] fileExistsAtPath:cachePath isDirectory:&isDir] && isDir == NO) {
        [[NSFileManager defaultManager] createDirectoryAtPath:cachePath withIntermediateDirectories:NO attributes:nil error:&error];
    }
    
    for (NSDictionary *photo in photos) {
//        NSLog(@"%@", [photo objectForKey:@"image"]);
        NSURLConnection *urlConn = [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[photo objectForKey:@"image"]]] delegate:self];
        
        [urlConn start];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AlbumChanged" object:self userInfo:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityDidChange) name:kReachabilityChangedNotification object:nil];

    return self;
}

- (void)sort
{
    photos = [originPhotos sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [[obj1 objectForKey:@"date"] compare:[obj2 objectForKey:@"date"]];
    }];

    [[NSNotificationCenter defaultCenter] postNotificationName:@"sortAlbum" object:self];
}

- (void)setPhotosToOrigin
{
    photos = originPhotos;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSString *dataPath = [cachePath stringByAppendingPathComponent:[[[connection currentRequest] URL] lastPathComponent]];
    [data writeToFile:dataPath atomically:YES];
}

- (void)reachabilityDidChange
{
    NetworkStatus *status = [reachability currentReachabilityStatus];
    
    if (status == NotReachable) {
        NSLog(@"not connect");
        
        char *data = "[{\"title\":\"초록\",\"image\":\"01.jpg\",\"date\":\"20140116\"},\ {\"title\":\"장미\",\"image\":\"02.jpg\",\"date\":\"20140505\"},\ {\"title\":\"낙엽\",\"image\":\"03.jpg\",\"date\":\"20131212\"},\ {\"title\":\"계단\",\"image\":\"04.jpg\",\"date\":\"20130301\"},\ {\"title\":\"벽돌\",\"image\":\"05.jpg\",\"date\":\"20140101\"},\ {\"title\":\"바다\",\"image\":\"06.jpg\",\"date\":\"20130707\"},\ {\"title\":\"벌레\",\"image\":\"07.jpg\",\"date\":\"20130815\"},\ {\"title\":\"나무\",\"image\":\"08.jpg\",\"date\":\"20131231\"},\ {\"title\":\"흑백\",\"image\":\"09.jpg\",\"date\":\"20140102\"}]";
        
        // char -> json 역직렬화
        NSString *dataStringObj = [[NSString alloc] initWithUTF8String:data];
        NSData *dataFromStirng = [dataStringObj dataUsingEncoding:NSUTF8StringEncoding];
        //    NSLog(@"%@", dataStringObj);
        NSMutableArray *dataArr = [NSJSONSerialization JSONObjectWithData:dataFromStirng options:0 error:nil];
        originPhotos = [[NSMutableArray alloc] initWithArray:dataArr];
        photos = [[NSMutableArray alloc] initWithArray:dataArr];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"AlbumChanged" object:self userInfo:nil];
        
    } else if (status == ReachableViaWiFi) {
        NSLog(@"connected");
        
        NSData* _data = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://125.209.194.123/json.php"]] returningResponse:nil error:nil];
        
        NSMutableArray *dataArr = [NSJSONSerialization JSONObjectWithData:_data options:0 error:nil];
        originPhotos = [[NSMutableArray alloc] initWithArray:dataArr];
        photos = [[NSMutableArray alloc] initWithArray:dataArr];

        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"AlbumChanged" object:self userInfo:nil];
    }
}
@end
