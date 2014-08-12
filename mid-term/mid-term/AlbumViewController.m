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
@synthesize albumTableView;
@synthesize photoViewController;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    photoViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"photoVC"];
    // notiCenter 생성
    NSNotificationCenter *notiCenter = [NSNotificationCenter defaultCenter];
    // notiCenter 등록
    [notiCenter addObserver:self selector:@selector(receiveInitPhotoNotification:) name:@"AlbumChanged" object:album];
    [notiCenter addObserver:self selector:@selector(receiveSortNotification:) name:@"sortAlbum" object:album];
    
    // data 초기화
    char *data = "[{\"title\":\"초록\",\"image\":\"01.jpg\",\"date\":\"20140116\"},\ {\"title\":\"장미\",\"image\":\"02.jpg\",\"date\":\"20140505\"},\ {\"title\":\"낙엽\",\"image\":\"03.jpg\",\"date\":\"20131212\"},\ {\"title\":\"계단\",\"image\":\"04.jpg\",\"date\":\"20130301\"},\ {\"title\":\"벽돌\",\"image\":\"05.jpg\",\"date\":\"20140101\"},\ {\"title\":\"바다\",\"image\":\"06.jpg\",\"date\":\"20130707\"},\ {\"title\":\"벌레\",\"image\":\"07.jpg\",\"date\":\"20130815\"},\ {\"title\":\"나무\",\"image\":\"08.jpg\",\"date\":\"20131231\"},\ {\"title\":\"흑백\",\"image\":\"09.jpg\",\"date\":\"20140102\"}]";
    
    // char -> json 역직렬화
    NSString *dataStringObj = [[NSString alloc] initWithUTF8String:data];
    NSData *dataFromStirng = [dataStringObj dataUsingEncoding:NSUTF8StringEncoding];
//    NSLog(@"%@", dataStringObj);
    NSMutableArray *dataArr = [NSJSONSerialization JSONObjectWithData:dataFromStirng options:0 error:nil];
//    NSLog(@"%@", dataArr);
    // 이미지 앨범 초기화
    album = [[Album alloc] initWithPhotos:dataArr];
    
    albumTableView.delegate = self;
    albumTableView.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)receiveInitPhotoNotification:(NSNotification *)notification
{
//    NSLog(@"noti");
    if ([[notification name] isEqualToString:@"AlbumChanged"]) {
//        NSLog(@"%@",[[notification userInfo] objectForKey:@"num"]);
    }
}

- (void)receiveSortNotification:(NSNotification *)notification
{
//    NSLog(@"noti");
    [albumTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    NSLog(@"delegate");
    return [album.photos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"customCell";
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    cell.cellTitle.text = [[album.photos objectAtIndex:indexPath.row] objectForKey:@"title"];
//    cell.detailTextLabel.text = [[album.photos objectAtIndex:indexPath.row] objectForKey:@"date"];
    [cell.imageView setImage:[UIImage imageNamed:[[album.photos objectAtIndex:indexPath.row] objectForKey:@"image"]]];
    
    return cell;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *simpleTableIdentifier = @"SimpleTableItem";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
//    }
//    
//    cell.textLabel.text = [[album.photos objectAtIndex:indexPath.row] objectForKey:@"title"];
//    cell.detailTextLabel.text = [[album.photos objectAtIndex:indexPath.row] objectForKey:@"date"];
//    
//    return cell;
//}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    photoViewController.data = @{
                     @"title":[[album.photos objectAtIndex:indexPath.row] objectForKey:@"title"],
                     @"date":[[album.photos objectAtIndex:indexPath.row] objectForKey:@"date"],
                     @"image":[[album.photos objectAtIndex:indexPath.row] objectForKey:@"image"]
                     };
    [self.navigationController pushViewController:photoViewController animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)sortBtn:(id)sender {
    [album sort];
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if(event.type == UIEventSubtypeMotionShake)
    {
        [album setPhotosToOrigin];
        [albumTableView reloadData];
    }
}

@end
