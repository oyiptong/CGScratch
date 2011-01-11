//
//  CGScratchAppDelegate.h
//  CGScratch
//
//  Created by Olivier Yiptong on 11-01-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CGScratchViewController;

@interface CGScratchAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CGScratchViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CGScratchViewController *viewController;

@end

