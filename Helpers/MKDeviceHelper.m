//
//  MKDeviceHelper.m
//  DeviceHelper
//
//  Created by Mugunth Kumar on 15-Aug-10.
//  Copyright 2010 Steinlogic. All rights reserved.
//	File created using Singleton XCode Template by Mugunth Kumar (http://mugunthkumar.com
//  Permission granted to do anything, commercial/non-commercial with this file apart from removing the line/URL above

#import "MKDeviceHelper.h"


static MKDeviceHelper *_instance;
@implementation MKDeviceHelper

+ (MKDeviceHelper*)sharedInstance
{
	@synchronized(self) {
		
        if (_instance == nil) {
			
            _instance = [[super allocWithZone:NULL] init];
            
            // Allocate/initialize any member variables of the singleton class her
            // example
			//_instance.member = @"";
        }
    }
    return _instance;
}


#pragma mark Singleton Methods

+ (id)allocWithZone:(NSZone *)zone
{	
	return [[self sharedInstance]retain];	
}


- (id)copyWithZone:(NSZone *)zone
{
    return self;	
}

- (id)retain
{	
    return self;	
}

- (unsigned)retainCount
{
    return NSUIntegerMax;  //denotes an object that cannot be released
}

- (void)release
{
    //do nothing
}

- (id)autorelease
{
    return self;	
}

- (BOOL) isMicrophoneAvailable
{
	AVAudioSession *ptr = [AVAudioSession sharedInstance];
	return ptr.inputIsAvailable;
}

- (void) vibrateWithSound
{
	AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
}

-(void) vibrateWithoutSound
{
	AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (BOOL) isCameraAvailable
{
	return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL) isVideoCameraAvailable
{
	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	NSArray *sourceTypes = [UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
	[picker release];
	
	if (![sourceTypes containsObject:(NSString *)kUTTypeMovie ]){
		
		return NO;
	}
	
	return YES;
}

- (BOOL) isFrontCameraAvailable
{
#ifdef __IPHONE_4_0
	return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
#else
	return NO;
#endif
	
}

- (BOOL) isCameraFlashAvailable
{
#ifdef __IPHONE_4_0
	return [UIImagePickerController isFlashAvailableForCameraDevice:UIImagePickerControllerCameraDeviceRear];
#else
	return NO;
#endif
}

// later when Apple adds a camera flash to the front camera in iPhone 5 or 6 or whatever, this function can be uncommented :)
/*
- (BOOL) isCameraFlashAvailableForFrontCamera
{
#ifdef __IPHONE_5_0 or 6?!?
	return [UIImagePickerController isFlashAvailableForCameraDevice:UIImagePickerControllerCameraDeviceFront];
#else
	return NO;
#endif
}
*/

- (BOOL) canSendEmail
{
	return [MFMailComposeViewController canSendMail];
}

- (BOOL) canSendSMS
{
#ifdef __IPHONE_4_0
	return [MFMessageComposeViewController canSendText];
#else
	return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"sms://"]];
#endif
}

- (BOOL) canMakePhoneCalls
{
	return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel://"]];
}

- (BOOL) isMultitaskingCapable
{
	UIDevice* device = [UIDevice currentDevice];
	BOOL backgroundSupported = NO;
	if ([device respondsToSelector:@selector(isMultitaskingSupported)])
		backgroundSupported = device.multitaskingSupported;
	
	return backgroundSupported;
}

- (BOOL) isCompassAvailable
{
	BOOL compassAvailable = NO;
	
#ifdef __IPHONE_3_0
	compassAvailable = [CLLocationManager headingAvailable];
#else
	CLLocationManager *cl = [[CLLocationManager alloc] init];	
	compassAvailable = cl.headingAvailable;		
	[cl release];
#endif
	
	return compassAvailable;

}

- (BOOL) isGyroscopeAvailable
{
#ifdef __IPHONE_4_0
	CMMotionManager *motionManager = [[CMMotionManager alloc] init];
	BOOL gyroAvailable = motionManager.gyroAvailable;
	[motionManager release];
	return gyroAvailable;
#else
	return NO;
#endif
	
}


@end
