//
//  Album.h
//  mid-term
//
//  Created by Jehyeok on 8/12/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject {
    char *data;
}

- (id)initWithPhotos:(NSMutableArray*)data;
@end