//
//  MKDeviceHelper.h
//  DeviceHelper
//
//  Created by Mugunth Kumar on 15-Aug-10.
//  Copyright 2010 Steinlogic. All rights reserved.
//	File created using Singleton XCode Template by Mugunth Kumar (http://mugunthkumar.com
//  Permission granted to do anything, commercial/non-commercial with this file apart from removing the line/URL above

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>

#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioServices.h>
#import <CoreLocation/CoreLocation.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <CoreMotion/CoreMotion.h>

@interface MKDeviceHelper : NSObject {

}

+ (MKDeviceHelper*) sharedInstance;

@end
