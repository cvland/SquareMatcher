//
//  MainView.m
//  SquareMatcher
//
//  Created by Christian Wieland on 12/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MainView.h"
#import "Draggable.h"

@implementation MainView
/*
- (NSMutableDictionary *) getCards {
    if (!cards) {
        cards = [[NSMutableDictionary alloc] init];
    }
    return cards;
}

- (void) addCard:(UIImage*) cardImage withName: (NSString*) cardName {
    [[self getCards] setObject:cardImage forKey:cardName];
}

- (UIImage *) getCard: (NSString*) cardName {
    @try {
        
        UIImage *cardImage = [cards objectForKey:cardName];
        
        if (!cardImage) {
            [self addCard:[UIImage imageNamed:cardName] withName:cardName];
        }
        
        
        return cardImage;
    }
    @catch (NSException *exception) {
        NSLog(@"Error %@ was not found!", cardName);
    }
    return nil;
}
*/


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    cardViewsArray = [[NSMutableArray alloc]initWithCapacity:10];
    UIImage *image = [UIImage imageNamed:@"fox.png"];
    
    int startX = 100;
    int startY = 50;
    int y = startY;
    int distance = image.size.height;
    for (int i=0; i<3; i++) {
        UIImageView *cardView = [[Draggable alloc] initWithFrame:CGRectMake(startX, y, image.size.width, image.size.height) ];
        [cardView setImage:image];
        [cardView setUserInteractionEnabled:YES];
        [cardView setAlpha:1.0];
        [cardViewsArray addObject:cardView];
        
        y = y + distance;
        [self addSubview:cardView];
    }
 
}


@end
