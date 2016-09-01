//
//  SimpleDPad.h
//  myFirstBeatEmUp
//
//  Created by Gilang Esha Gautama on 3/10/13.
//  Copyright 2013 Gautama LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class SimpleDPad;

@protocol SimpleDPadDelegate <NSObject>

-(void)simpleDPad:(SimpleDPad *)simpleDPad didChangeDirectionTo:(CGPoint)direction;
-(void)simpleDPad:(SimpleDPad *)simpleDPad isHoldingDirection:(CGPoint)direction;
-(void)simpleDPadTouchEnded:(SimpleDPad *)simpleDPad;

@end

@interface SimpleDPad : CCSprite <CCTouchOneByOneDelegate> {
   
    float _radius;
    CGPoint _direction;
    
}

@property(nonatomic,weak)id <SimpleDPadDelegate> delegate;
@property(nonatomic,assign)BOOL isHeld;

+(id)dPadWithFile:(NSString *)fileName radius:(float)radius;
-(id)initWithFile:(NSString *)filename radius:(float)radius;

@end
