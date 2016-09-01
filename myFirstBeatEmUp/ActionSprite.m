//
//  ActionSprite.m
//  myFirstBeatEmUp
//
//  Created by Gilang Esha Gautama on 3/9/13.
//  Copyright 2013 Gautama LLC. All rights reserved.
//

#import "ActionSprite.h"
#import "SimpleAudioEngine.h"

@implementation ActionSprite

- (void) idle {
    if (_actionState != kActionStateIdle) {
        [self stopAllActions];
        [self runAction:_idleAction];
        _actionState = kActionStateIdle;
        _velocity = CGPointZero;
    }
}

-(void)attack {
    if (_actionState == kActionStateIdle || _actionState == kActionStateAttack || _actionState == kActionStateAttack2 || _actionState == kActionStateWalk) {
        [self stopAllActions];
        [self runAction:_attackAction];
        _actionState = kActionStateAttack;
    }
}

-(void)attack2 {
    if (_actionState == kActionStateIdle || _actionState == kActionStateAttack || _actionState == kActionStateAttack2 ||_actionState == kActionStateWalk) {
        [self stopAllActions];
        [self runAction:_attackAction2];
        _actionState = kActionStateAttack2;
    }
}

-(void)playingGuitar {
    if (_actionState == kActionStateIdle || _actionState == kActionStateAttack || _actionState == kActionStateAttack2 || _actionState == kActionStateWalk) {
        [self stopAllActions];
        [self runAction:_playingGuitarAction];
        _actionState = kActionStatePlayingGuitar;
    }
}

-(void)walkWithDirection:(CGPoint)direction {
    if (_actionState == kActionStateIdle) {
        [self stopAllActions];
        [self runAction:_walkAction];
        _actionState = kActionStateWalk;
    }
    if (_actionState == kActionStateWalk) {
        _velocity = ccp(direction.x * _walkSpeed, direction.y * _walkSpeed);
        if (_velocity.x >= 0) self.scaleX = 1.0;
        else self.scaleX = -1.0;
    }
}

-(void)hurtWithDamage:(float)damage {
    if (_actionState != kActionStateKnockedOut) {
        [self stopAllActions];
        [self runAction:_hurtAction];
        _actionState = kActionStateHurt;
        _hitPoints -= damage;
        
        int randomSound = random_range(0, 1);
        [[SimpleAudioEngine sharedEngine] playEffect:[NSString stringWithFormat:@"pd_hit%d.mp3", randomSound]];
        
        if (_hitPoints <= 0.0) {
            [self knockout];
        }
    }
}

-(void)knockout {
    [self stopAllActions];
    [self runAction:_knockedOutAction];
    _hitPoints = 0.0;
    _actionState = kActionStateKnockedOut;
}

-(void)update:(ccTime)dt {
    if (_actionState == kActionStateWalk) {
        _desiredPosition = ccpAdd(position_, ccpMult(_velocity, dt));
    }
}

-(BoundingBox)createBoundingBoxWithOrigin:(CGPoint)origin size:(CGSize)size {
    BoundingBox boundingBox;
    boundingBox.original.origin = origin;
    boundingBox.original.size = size;
    boundingBox.actual.origin = ccpAdd(position_, ccp(boundingBox.original.origin.x, boundingBox.original.origin.y));
    boundingBox.actual.size = size;
    return boundingBox;
}

-(void)transformBoxes {
    _hitBox.actual.origin = ccpAdd(position_, ccp(_hitBox.original.origin.x * scaleX_, _hitBox.original.origin.y * scaleY_));
    _hitBox.actual.size = CGSizeMake(_hitBox.original.size.width * scaleX_, _hitBox.original.size.height * scaleY_);
    _attackBox.actual.origin = ccpAdd(position_, ccp(_attackBox.original.origin.x * scaleX_, _attackBox.original.origin.y * scaleY_));
    _attackBox.actual.size = CGSizeMake(_attackBox.original.size.width * scaleX_, _attackBox.original.size.height * scaleY_);
}

-(void)setPosition:(CGPoint)position {
    [super setPosition:position];
    [self transformBoxes];
}

@end
