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
    

//    NSLog(@"%@", dataArr);
    // 이미지 앨범 초기화
    album = [[Album alloc] init];
    
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
        NSLog(@"%@",[[notification userInfo] objectForKey:@"num"]);
        [albumTableView reloadData];
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
    [cell.cellImgaeView setImage:[UIImage imageNamed:[[album.photos objectAtIndex:indexPath.row] objectForKey:@"image"]]];
    
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
