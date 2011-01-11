//
//  ScratchView.m
//  CGScratch
//
//  Created by Olivier Yiptong on 11-01-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ScratchView.h"
#import "ScratchableView.h"


@implementation ScratchView


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}

- (void)awakeFromNib {
	ScratchableView *scratchableView = [[ScratchableView alloc] initWithFrame:self.frame];
	[self addSubview:scratchableView];
	
	UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.jpg"]];
	[self addSubview:background];
	[self bringSubviewToFront:scratchableView];
}

- (void)dealloc {
    [super dealloc];
}


@end
