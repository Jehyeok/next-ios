//
//  main.m
//  week3
//
//  Created by Jehyeok on 7/24/14.
//  Copyright (c) 2014 com.jehogu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Grid.h"

void printGrid(NSMutableArray *grid)
{
    for (NSMutableArray *row in grid) {
        NSLog(@"%@", [row componentsJoinedByString:@", "]);
    }
}

int main(int argc, const char * argv[])
{
    int ROW_NUM = 3;
    char input;
    
    Grid *grid = [[Grid alloc] initRows:ROW_NUM];

    [grid render];
    
    while (true) {
        
        scanf("%c", &input);
        
        switch (input) {
            case 'w':
            {
                [grid moveVertical:1];
                
                printf("\n");
                [grid render];
                break;
            }
            case 'a':
            {
                [grid moveHorizontal:1];
                
                printf("\n");
                [grid render];
                break;
            }
            case 's':
                [grid moveVertical:-1];
                
                printf("\n");
                [grid render];
                break;
            case 'd':
                [grid moveHorizontal:-1];
                
                printf("\n");
                [grid render];
                break;
            default:
                break;
        }
    }
    return 0;
}

