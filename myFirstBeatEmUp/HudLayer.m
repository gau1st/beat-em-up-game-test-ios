//
//  HudLayer.m
//  myFirstBeatEmUp
//
//  Created by Gilang Esha Gautama on 3/9/13.
//  Copyright 2013 Gautama LLC. All rights reserved.
//

#import "HudLayer.h"


@implementation HudLayer

-(id)init {
    if ((self = [super init])) {
        
        _punchBtn = [PunchButton punchBtnWithFile:@"button.png" radius:64];
        _punchBtn.position = ccp(420.0, 64.0);
        _punchBtn.opacity = 100;
        [self addChild:_punchBtn];
        
        _dPad = [SimpleDPad dPadWithFile:@"pd_dpad.png" radius:64];
        _dPad.position = ccp(64.0, 64.0);
        _dPad.opacity = 100;
        [self addChild:_dPad];
        
    }
    return self;
}

@end

