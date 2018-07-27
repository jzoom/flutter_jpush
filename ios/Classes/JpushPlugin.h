#import <Flutter/Flutter.h>

@interface JpushPlugin : NSObject<FlutterPlugin>

@property(strong,nonatomic)FlutterResult asyCallback;

- (void)didRegistRemoteNotification:(NSString *)token;


@end
