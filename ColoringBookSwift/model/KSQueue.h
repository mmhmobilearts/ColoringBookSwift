//
//  KSQueue.h
//  Pigment
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KSQueue : NSObject
-(void)enqueue:(id)anObject;
-(id)dequeue;
@end

NS_ASSUME_NONNULL_END
