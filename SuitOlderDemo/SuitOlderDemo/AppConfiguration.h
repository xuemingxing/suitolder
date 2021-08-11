

#import <Foundation/Foundation.h>

@interface AppConfiguration : NSObject

+ (AppConfiguration *)sharedConfiguration;
#pragma mark - 长辈模式
@property (nonatomic, assign) BOOL appOldMode;

@end
