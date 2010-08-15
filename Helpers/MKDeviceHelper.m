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

@end
