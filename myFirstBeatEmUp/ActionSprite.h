//
//  ActionSprite.h
//  myFirstBeatEmUp
//
//  Created by Gilang Esha Gautama on 3/9/13.
//  Copyright 2013 Gautama LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ActionSprite : CCSprite {
    
}

@property(nonatomic,assign)BoundingBox hitBox;
@property(nonatomic,assign)BoundingBox attackBox;

-(BoundingBox)createBoundingBoxWithOrigin:(CGPoint)origin size:(CGSize)size;

//actions
@property(nonatomic,strong)id idleAction;
@property(nonatomic,strong)id playingGuitarAction;
@property(nonatomic,strong)id attackAction;
@property(nonatomic,strong)id attackAction2;
@property(nonatomic,strong)id walkAction;
@property(nonatomic,strong)id hurtAction;
@property(nonatomic,strong)id knockedOutAction;

//states
@property(nonatomic,assign)ActionState actionState;

//attributes
@property(nonatomic,assign)float walkSpeed;
@property(nonatomic,assign)float hitPoints;
@property(nonatomic,assign)float damage;

//movement
@property(nonatomic,assign)CGPoint velocity;
@property(nonatomic,assign)CGPoint desiredPosition;

//measurements
@property(nonatomic,assign)float centerToSides;
@property(nonatomic,assign)float centerToBottom;

//action methods
-(void)idle;
-(void)attack;
-(void)attack2;
-(void)playingGuitar;
-(void)hurtWithDamage:(float)damage;
-(void)knockout;
-(void)walkWithDirection:(CGPoint)direction;

//scheduled methods
-(void)update:(ccTime)dt;

@end
