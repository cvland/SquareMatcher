//
//  Draggable.m
//  SquareMatcher
//
//  Created by Christian Wieland on 12/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Draggable.h"

@implementation Draggable

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint touchPoint = [[touches anyObject]locationInView:self];
    startLocation = touchPoint;
    [[self superview]bringSubviewToFront:self];
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 1.0;
        self.frame = CGRectMake(self.frame.origin.x-5, self.frame.origin.y-5, self.frame.size.width+10, self.frame.size.height+10);
    }];
    
    NSArray * subviews = [[self superview] subviews];
    
    for (UIView *subview in subviews){
        if (subview != self) {
            [UIView animateWithDuration:0.25 animations:^{
                subview.alpha = 0.5;
            }];
        }
    }
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint touchPoint = [[touches anyObject]locationInView:self];
    CGRect frame = [self frame];
    frame.origin.x += touchPoint.x - startLocation.x;
    frame.origin.y += touchPoint.y - startLocation.y;
    [self setFrame:frame];
    
    
}

@end
