//
//  GameScene.h
//  myFirstBeatEmUp
//
//  Created by Gilang Esha Gautama on 3/9/13.
//  Copyright 2013 Gautama LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameLayer.h"
#import "HudLayer.h"

@interface GameScene : CCScene {
    
}

@property(nonatomic,weak)GameLayer *gameLayer;
@property(nonatomic,weak)HudLayer *hudLayer;

@end
