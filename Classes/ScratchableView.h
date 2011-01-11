//
//  ScratchableView.h
//  CGScratch
//
//  Created by Olivier Yiptong on 11-01-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ScratchableView : UIView {
	float width;
	float height;
	CGPoint	location;
	CGPoint	previousLocation;
	BOOL firstTouch;
	CGImageRef scratchable;
	CGImageRef scratched;
	CGContextRef alphaPixels;
	CGDataProviderRef provider;
}

- (void) renderLineFromPoint:(CGPoint)start toPoint:(CGPoint)end;

@end
