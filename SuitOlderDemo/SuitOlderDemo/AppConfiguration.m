
#import "AppConfiguration.h"
#import <objc/runtime.h>
#import <AVFoundation/AVFoundation.h>

@interface AppConfiguration ()


@end

@implementation AppConfiguration


+ (AppConfiguration *)sharedConfiguration {
    static dispatch_once_t pred;
    static AppConfiguration *sharedInstance = nil;
    dispatch_once(&pred, ^{ sharedInstance = [[self alloc] init]; });
    return sharedInstance;
}


@end




