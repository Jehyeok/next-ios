//
//  ViewController.m
//  week4
//
//  Created by Jehyeok on 7/31/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize num;
@synthesize iv;
@synthesize randomGenerator;
@synthesize gawi_img, bawi_img, bo_img;

int GAWI = 1;
int BAWI = 2;
int BO = 3;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
 
    bawi_img = [UIImage imageNamed:@"bawi.png"];
    gawi_img = [UIImage imageNamed:@"gawi.png"];
    bo_img = [UIImage imageNamed:@"bo.png"];
    
    randomGenerator = [[RandomGenerator alloc] init];
    
    // notiCenter 생성
//    NSNotificationCenter *notiCenter = [NSNotificationCenter defaultCenter];
    // notiCenter 등록
    
    // KVO
    [randomGenerator addObserver:self forKeyPath:@"num" options:NSKeyValueObservingOptionNew context:nil];
    
    // not KVO
//    [notiCenter addObserver:self selector:@selector(receiveRandomGeneratorNotification:) name:@"RandomGenerate" object:randomGenerator];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)receiveRandomGeneratorNotification:(NSNotification *)notification
{
    if ([[notification name] isEqualToString:@"RandomGenerate"]) {
        self.num = [[notification userInfo] objectForKey:@"num"];
    }
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    self.num = [change objectForKey:@"new"];
}

- (IBAction)playBtn:(id)sender {
    [randomGenerator generate];
    
    int intNum = [self.num intValue];
    NSLog(@"%d", intNum);
    if (intNum == GAWI) {
        [iv setImage:gawi_img];
    } else if(intNum == BAWI) {
        [iv setImage:bawi_img];
    } else if(intNum == BO) {
        [iv setImage:bo_img];
    }
}
@end
