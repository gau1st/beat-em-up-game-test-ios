//
//  GameLayer.h
//  myFirstBeatEmUp
//
//  Created by Gilang Esha Gautama on 3/9/13.
//  Copyright 2013 Gautama LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SimpleDPad.h"
#import "PunchButton.h"
#import "HudLayer.h"
#import "Hero.h"

@interface GameLayer : CCLayer <PunchButtonDelegate, SimpleDPadDelegate> {

    CCTMXTiledMap *_tileMap;
    Hero *_hero;
    CCNode *_actors;
    int tick;
    int holdTime;
    BOOL punchHold;
    int combo;
    CCMenu *menuPause;

}

@property(nonatomic,weak)HudLayer *hud;
@property(nonatomic,strong)CCArray *enemy;

@end
