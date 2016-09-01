//
//  Hero.m
//  myFirstBeatEmUp
//
//  Created by Gilang Esha Gautama on 3/9/13.
//  Copyright 2013 Gautama LLC. All rights reserved.
//

#import "Hero.h"
#import "SimpleAudioEngine.h"

@implementation Hero

-(id)init {
    if ((self = [super initWithSpriteFrameName:@"scott_idle_00.png"])) {
        int i;
        
        //idle animation
        CCArray *idleFrames = [CCArray arrayWithCapacity:8];
        for (i = 0; i < 8; i++) {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"scott_idle_%02d.png", i]];
            [idleFrames addObject:frame];
        }
        CCAnimation *idleAnimation = [CCAnimation animationWithSpriteFrames:[idleFrames getNSArray] delay:1.0/12.0];
        self.idleAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:idleAnimation]];
        
        
        
        // attack animation
        CCArray *attackFrames = [CCArray arrayWithCapacity:3];
        for (i = 0; i < 3; i++) {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"scott_pummel_%02d.png", i]];
            [attackFrames addObject:frame];
        }
        CCAnimation *attackAnimation = [CCAnimation animationWithSpriteFrames:[attackFrames getNSArray] delay:1.0/10.0];
        self.attackAction = [CCSequence actions:[CCAnimate actionWithAnimation:attackAnimation], [CCCallFunc actionWithTarget:self selector:@selector(idle)], nil];
        
        
        
        // attack 2 animation
        CCArray *attack2Frames = [CCArray arrayWithCapacity:3];
        for (i = 3; i < 6; i++) {
            CCSpriteFrame *frame2 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"scott_pummel_%02d.png", i]];
            [attack2Frames addObject:frame2];
        }
        CCAnimation *attack2Animation = [CCAnimation animationWithSpriteFrames:[attack2Frames getNSArray] delay:1.0/10.0];
        self.attackAction2 = [CCSequence actions:[CCAnimate actionWithAnimation:attack2Animation], [CCCallFunc actionWithTarget:self selector:@selector(idle)], nil];
        
        
        // walk animation
        CCArray *walkFrames = [CCArray arrayWithCapacity:8];
        for (i = 0; i < 8; i++) {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"scott_dash_%02d.png", i]];
            [walkFrames addObject:frame];
        }
        CCAnimation *walkAnimation = [CCAnimation animationWithSpriteFrames:[walkFrames getNSArray] delay:1.0/12.0];
        self.walkAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:walkAnimation]];
        
        
        //hurt animation
        CCArray *hurtFrames = [CCArray arrayWithCapacity:3];
        for (i = 0; i < 3; i++) {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"scott_guitar_%02d.png", i]];
            [hurtFrames addObject:frame];
        }
        CCAnimation *hurtAnimation = [CCAnimation animationWithSpriteFrames:[hurtFrames getNSArray] delay:1.0/12.0];
        self.hurtAction = [CCSequence actions:[CCAnimate actionWithAnimation:hurtAnimation], [CCCallFunc actionWithTarget:self selector:@selector(idle)], nil];
        
        //knocked out animation
        CCArray *knockedOutFrames = [CCArray arrayWithCapacity:8];
        for (i = 0; i < 8; i++) {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"scott_victory_%02d.png", i]];
            [knockedOutFrames addObject:frame];
        }
        CCAnimation *knockedOutAnimation = [CCAnimation animationWithSpriteFrames:[knockedOutFrames getNSArray] delay:1.0/12.0];
        self.knockedOutAction = [CCSequence actions:[CCAnimate actionWithAnimation:knockedOutAnimation], nil];
        
        //guitar animation
        CCArray *guitarFrames = [CCArray arrayWithCapacity:3];
        for (i = 0; i < 6; i++) {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"scott_guitar_%02d.png", i]];
            [guitarFrames addObject:frame];
        }
        CCAnimation *guitarAnimation = [CCAnimation animationWithSpriteFrames:[guitarFrames getNSArray] delay:1.0/12.0];
        self.playingGuitarAction = [CCSequence actions:[CCAnimate actionWithAnimation:guitarAnimation], [CCCallFunc actionWithTarget:self selector:@selector(idle)], nil];
        
        self.centerToBottom = 39.0;
        self.centerToSides = 29.0;
        self.hitPoints = 500.0;
        self.damage = 20.0;
        self.walkSpeed = 80;
        
        // Create bounding boxes
        self.hitBox = [self createBoundingBoxWithOrigin:ccp(-self.centerToSides, -self.centerToBottom) size:CGSizeMake(self.centerToSides * 1.5, self.centerToBottom * 2)];
        self.attackBox = [self createBoundingBoxWithOrigin:ccp(self.centerToSides, -10) size:CGSizeMake(20, 20)];
    }
    return self;
}

-(void)knockout {
    [super knockout];
    [[SimpleAudioEngine sharedEngine] playEffect:@"pd_herodeath.mp3"];
}

@end
