//
//  Defines.h
//  myFirstBeatEmUp
//
//  Created by Gilang Esha Gautama on 3/9/13.
//  Copyright (c) 2013 Gautama LLC. All rights reserved.
//

#ifndef myFirstBeatEmUp_Defines_h
#define myFirstBeatEmUp_Defines_h

// 1 - convenience measurements
#define SCREEN [[CCDirector sharedDirector] winSize]
#define CENTER ccp(SCREEN.width/2, SCREEN.height/2)
#define CURTIME CACurrentMediaTime()

// 2 - convenience functions
#define random_range(low,high) (arc4random()%(high-low+1))+low
#define frandom (float)arc4random()/UINT64_C(0x100000000)
#define frandom_range(low,high) ((high-low)*frandom)+low

// 3 - enumerations
typedef enum _ActionState {
    kActionStateNone = 0,
    kActionStateIdle,
    kActionStateAttack,
    kActionStateAttack2,
    kActionStatePlayingGuitar,
    kActionStateWalk,
    kActionStateHurt,
    kActionStateKnockedOut
} ActionState;

// 4 - structures
typedef struct _BoundingBox {
    CGRect actual;
    CGRect original;
} BoundingBox;

#endif
