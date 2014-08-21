//
//  ViewController.m
//  prototype-tool
//
//  Created by Jehyeok on 7/29/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize galleryBtn;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openGalleryBtn:(id)sender {
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    
    if((UIButton *) sender == galleryBtn) {
		picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
	} else {
		picker.sourceType = UIImagePickerControllerSourceTypeCamera;
	}
    
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:^{
        NSLog(@"info: %@", [info objectForKey:@"UIImagePickerControllerOriginalImage"]);
        
        ImageViewController* ivc = [self.storyboard instantiateViewControllerWithIdentifier:@"ImageVC"];
        ivc.photo = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        [self presentViewController:ivc animated:YES completion:nil];
    }];
}

@end
