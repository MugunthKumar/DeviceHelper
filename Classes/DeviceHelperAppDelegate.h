//
//  DeviceHelperAppDelegate.h
//  DeviceHelper
//
//  Created by Mugunth Kumar on 15-Aug-10.
//  Copyright Steinlogic 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIDevice_MKAdditions.h"

@class DeviceHelperViewController;

@interface DeviceHelperAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    DeviceHelperViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet DeviceHelperViewController *viewController;

@end

