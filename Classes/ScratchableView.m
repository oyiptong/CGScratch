//
//  ScratchableView.m
//  CGScratch
//
//  Created by Olivier Yiptong on 11-01-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ScratchableView.h"


@implementation ScratchableView


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
		scratchable = [UIImage imageNamed:@"scratchable.jpg"].CGImage;
		width = CGImageGetWidth(scratchable);
		height = CGImageGetHeight(scratchable);
		self.opaque = NO;
		CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceGray();
		
		CFMutableDataRef pixels = CFDataCreateMutable( NULL , width * height );
		alphaPixels = CGBitmapContextCreate( CFDataGetMutableBytePtr( pixels ) , width , height , 8 , width , colorspace , kCGImageAlphaNone );
		provider = CGDataProviderCreateWithCFData(pixels);
		
		
		CGContextSetFillColorWithColor(alphaPixels, [UIColor blackColor].CGColor);
		CGContextFillRect(alphaPixels, frame);
		
		CGContextSetStrokeColorWithColor(alphaPixels, [UIColor whiteColor].CGColor);
		CGContextSetLineWidth(alphaPixels, 20.0);
		CGContextSetLineCap(alphaPixels, kCGLineCapRound);
		
		CGImageRef mask = CGImageMaskCreate(width, height, 8, 8, width, provider, nil, NO);
		scratched = CGImageCreateWithMask(scratchable, mask);
		
		CGImageRelease(mask);
		CGColorSpaceRelease(colorspace);
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
	CGContextDrawImage(UIGraphicsGetCurrentContext() , [self bounds] , scratched);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event touchesForView:self] anyObject];
	firstTouch = YES;
	location = [touch locationInView:self];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [[event touchesForView:self] anyObject];
	
	if (firstTouch) {
		firstTouch = NO;
		previousLocation = [touch previousLocationInView:self];
	} else {
		location = [touch locationInView:self];
		previousLocation = [touch previousLocationInView:self];
	}
	
	// Render the stroke
	[self renderLineFromPoint:previousLocation toPoint:location];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event touchesForView:self] anyObject];
	if (firstTouch) {
		firstTouch = NO;
		previousLocation = [touch previousLocationInView:self];
		
		[self renderLineFromPoint:previousLocation toPoint:location];
	}
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
}

- (void) renderLineFromPoint:(CGPoint)start toPoint:(CGPoint)end {
	
	CGContextMoveToPoint(alphaPixels, start.x, start.y);
	CGContextAddLineToPoint(alphaPixels, end.x, end.y);
	CGContextStrokePath(alphaPixels);
	[self setNeedsDisplay];
}

- (void)dealloc {
	CGContextRelease(alphaPixels);
	CGImageRelease(scratchable);
	CGDataProviderRelease(provider);
    [super dealloc];
}


@end
