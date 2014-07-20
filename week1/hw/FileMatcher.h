//
//  NSObject_FileMatcher.h
//  hw
//
//  Created by Jehyeok on 7/20/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileMatcher : NSObject
{
    NSFileManager *fm;
}
-(NSArray*)filesAtPath:(NSString*)path;
-(BOOL)fileExistsIn:(NSArray*)files fileName:(NSString*)fileName;
-(BOOL)filesExistIn:(NSArray*)files fileNames:(NSString*)fileName, ...;
-(NSArray*)sort:(NSArray*)files;
-(NSArray*)files:(NSArray*)files withExtension:(NSString*)extension;
-(void)printFileNames:(NSArray*)files;

@property(nonatomic, readwrite) NSFileManager *fm;

@end
