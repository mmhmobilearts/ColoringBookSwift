//
//  KSQueue.m
//  Pigment
//


#import "KSQueue.h"


@interface KSQueue ()
@property (strong) NSMutableArray *data;
@end

@implementation KSQueue
-(instancetype)init{
    if (self = [super init]){
        _data = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)enqueue:(id)anObject{
    [self.data addObject:anObject];
}

-(id)dequeue{
    
    if (self.data.count > 0) {
        id headObject = [self.data objectAtIndex:0];
        if (headObject != nil) {
            [self.data removeObjectAtIndex:0];
        }
        return headObject;
    }

    return nil;
}
@end
