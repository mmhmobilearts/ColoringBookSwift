//
//  Stack.h
//  Pigment
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Stack : NSObject<NSFastEnumeration>

@property (nonatomic, assign, readonly) NSUInteger count;

- (id)initWithArray:(NSArray*)array;

- (void)pushObject:(id)object;
- (void)pushObjects:(NSArray*)objects;
- (id)popObject;
- (id)peekObject;
@end

NS_ASSUME_NONNULL_END
