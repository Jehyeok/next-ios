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

//int main(int argc, const char * argv[])
//{
//    int ROW_NUM = 3;
//    char input;
//    int blankPos[2] = {1, 1};
//    NSMutableArray *row;
//    NSMutableArray *nextRow;
//    NSNumber *num;
//    
//    NSMutableArray *grid = [[NSMutableArray alloc] initWithCapacity: ROW_NUM];
//    
//    [grid insertObject:[NSMutableArray arrayWithObjects:@1,@2,@3,nil] atIndex:0];
//    [grid insertObject:[NSMutableArray arrayWithObjects:@4,@0,@6,nil] atIndex:1];
//    [grid insertObject:[NSMutableArray arrayWithObjects:@7,@8,@5,nil] atIndex:2];
//    
//    printGrid(grid);
//    
//    while (true) {
//        
//        scanf("%c", &input);
//
//        switch (input) {
//            case 'w':
//            {
//                if (blankPos[0] == 2) {
//                    break;
//                }
//                
//                row = [grid objectAtIndex:blankPos[0]];
//                nextRow = [grid objectAtIndex:blankPos[0] + 1];
//                
//                num = [nextRow objectAtIndex:blankPos[1]];
//                [nextRow replaceObjectAtIndex:blankPos[1] withObject:@0];
//                [row replaceObjectAtIndex:blankPos[1] withObject:num];
//                
//                blankPos[0] += 1;
//                
//                printf("\n");
//                printGrid(grid);
//                break;
//            }
//            case 'a':
//            {
//                if (blankPos[1] == 2) {
//                    break;
//                }
//                
//                row = [grid objectAtIndex:blankPos[0]];
//                
//                num = [row objectAtIndex:blankPos[1] + 1];
//                [row replaceObjectAtIndex:blankPos[1] withObject:num];
//                [row replaceObjectAtIndex:(blankPos[1] + 1) withObject:@0];
//                
//                blankPos[1] += 1;
//                
//                printf("\n");
//                printGrid(grid);
//                break;
//
//            }
//            case 's':
//                if (blankPos[0] == 0) {
//                    break;
//                }
//                
//                row = [grid objectAtIndex:blankPos[0]];
//                nextRow = [grid objectAtIndex:blankPos[0] - 1];
//                
//                num = [nextRow objectAtIndex:blankPos[1]];
//                [nextRow replaceObjectAtIndex:blankPos[1] withObject:@0];
//                [row replaceObjectAtIndex:blankPos[1] withObject:num];
//                
//                blankPos[0] -= 1;
//                
//                printf("\n");
//                printGrid(grid);
//                break;
//            case 'd':
//                if (blankPos[1] == 0) {
//                    break;
//                }
//                
//                row = [grid objectAtIndex:blankPos[0]];
//                
//                num = [row objectAtIndex:blankPos[1] - 1];
//                [row replaceObjectAtIndex:blankPos[1] withObject:num];
//                [row replaceObjectAtIndex:(blankPos[1] - 1) withObject:@0];
//                
//                blankPos[1] -= 1;
//                
//                printf("\n");
//                printGrid(grid);
//                break;
//            default:
//                break;
//        }
//    }
//    return 0;
//}
//

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

