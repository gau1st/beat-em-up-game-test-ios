//
//  GameScene.m
//  myFirstBeatEmUp
//
//  Created by Gilang Esha Gautama on 3/9/13.
//  Copyright 2013 Gautama LLC. All rights reserved.
//

#import "GameScene.h"


@implementation GameScene

- (id) init {
    
    if ((self = [super init])) {
        _gameLayer = [GameLayer node];
        [self addChild:_gameLayer z:0];
        _hudLayer = [HudLayer node];
        [self addChild:_hudLayer z:1];
        _hudLayer.dPad.delegate = _gameLayer;
        _hudLayer.punchBtn.delegate = _gameLayer;
        _gameLayer.hud = _hudLayer;
    }
    
    return self;
}

@end
