//
//  FileMatcher.m
//  hw
//
//  Created by Jehyeok on 7/20/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import "FileMatcher.h"

@implementation FileMatcher
@synthesize fm;
- (instancetype)init
{
    self = [super init];
    if (self) {
        fm = [NSFileManager defaultManager];
    }
    return self;
}

-(NSArray*)filesAtPath:(NSString*)path
{
    NSArray *files;
    
    if ([fm fileExistsAtPath:path]) {
        files = [fm contentsOfDirectoryAtPath:path error:nil];
        return files;
    }
    
    return nil;
}

-(BOOL)fileExistsIn:(NSArray*)files fileName:(NSString*)fileName
{
    for (NSString* eachFileName in files) {
        if ([eachFileName isEqualToString:fileName]) {
            return YES;
        }
    }
    
    return NO;
}

-(BOOL)filesExistIn:(NSArray*)files fileNames:(NSString*)fileName, ...
{
    NSString *eachFileName;
    
    va_list argumentList;

    va_start(argumentList, fileName);
    
    if ([self fileExistsIn:files fileName:fileName] == NO) {
        return NO;
    }
    
    while ((eachFileName = va_arg(argumentList, NSString*))) {
        if ([self fileExistsIn:files fileName:eachFileName] == NO) {
            return NO;
        }
    }
    va_end(argumentList);
    
    return YES;
}

-(NSArray*)sort:(NSArray*)files
{
    NSArray *sortedFiles = [files sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2];
    }];
    
    return sortedFiles;
}

-(NSArray*)files:(NSArray*)files withExtension:(NSString*)extension
{
    NSMutableArray *selectedFiles = [[NSMutableArray alloc] init];
    
    for (NSString* fileName in files) {
        if ([[fileName pathExtension] isEqualToString:extension]) {
            [selectedFiles addObject:fileName];
        }
    }
    
    return [NSArray arrayWithArray:selectedFiles];
}

-(void)printFileNames:(NSArray*)files
{
    for (NSString *fileName in files) {
        NSLog(@"%@", fileName);
    }
}

@end
