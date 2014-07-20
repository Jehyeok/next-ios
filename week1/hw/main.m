//
//  main.m
//  hw
//
//  Created by Jehyeok on 7/20/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FileMatcher.h"

void displayFileNamesAtPath(NSString *path)
{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *files;
    
    if ([fm fileExistsAtPath:path]) {
        files = [fm contentsOfDirectoryAtPath:path error:nil];
        
        for (NSString *fileName in files) {
            NSLog(@"%@", fileName);
        }
    }
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSString *path = @"/Users/jehyeok/next/ios/hw/contents";
        NSArray *files;
        
        // #1. 특정 디렉토리 내부를 뒤져라!
        displayFileNamesAtPath(path);
        
        
        NSLog(@"----------------------------------");
        // #2. File Matcher 구현하기
        FileMatcher * fm = [[FileMatcher alloc] init];
        files = [fm filesAtPath:path];
        
        
        NSLog(@"----------------------------------");
        // 파일이 있는지 확인
        if([fm fileExistsIn:files fileName:@"img1.png"]) {
            NSLog(@"파일이 있다.");
        }
        
        
        NSLog(@"----------------------------------");
        // 오름차순으로 정렬
        NSArray *sortedFiles = [fm sort:files];
        [fm printFileNames:sortedFiles];
        
        
        NSLog(@"----------------------------------");
        // 많은 파일이 있는지 확인
        if ([fm filesExistIn:files fileNames:@"img1.png", @"img2.png", nil]) {
            NSLog(@"많은 파일이 있다");
        }
        
        
        NSLog(@"----------------------------------");
        // 특정 확장자가 있는지 확인
        NSArray *selectedFiles = [fm files:files withExtension:@"jpg"];
        [fm printFileNames:selectedFiles];
    }
    return 0;
}

