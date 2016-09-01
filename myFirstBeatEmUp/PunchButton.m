//
//  PunchButton.m
//  myFirstBeatEmUp
//
//  Created by Gilang Esha Gautama on 3/10/13.
//  Copyright 2013 Gautama LLC. All rights reserved.
//

#import "PunchButton.h"


@implementation PunchButton

+(id)punchBtnWithFile:(NSString *)fileName radius:(float)radius {
    return [[self alloc] initWithFile:fileName radius:radius];
}

-(id)initWithFile:(NSString *)filename radius:(float)radius {
    if ((self = [super initWithFile:filename])) {
        _radius = radius;
        _direction = CGPointZero;
        _isHeld = NO;
        [self scheduleUpdate];
    }
    return self;
}

-(void)onEnterTransitionDidFinish {
    [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:1 swallowsTouches:YES];
}

-(void) onExit {
    [[[CCDirector sharedDirector] touchDispatcher] removeDelegate:self];
}

-(void)update:(ccTime)dt {
    if (_isHeld) {
        [_delegate punchButton:self isHoldingDirection:_direction];
    }
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    
    CGPoint location = [[CCDirector sharedDirector] convertToGL:[touch locationInView:[touch view]]];
    
    float distanceSQ = ccpDistanceSQ(location, position_);
    if (distanceSQ <= _radius * _radius) {
        [_delegate punchButtonTouchBegan:self];
        _isHeld = YES;
        return YES;
    }
    return NO;
}

-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
    //CGPoint location = [[CCDirector sharedDirector] convertToGL:[touch locationInView:[touch view]]];
    //[self updateDirectionForTouchLocation:location];
}

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    _direction = CGPointZero;
    _isHeld = NO;
    [_delegate punchButtonTouchEnded:self];
}

@end
