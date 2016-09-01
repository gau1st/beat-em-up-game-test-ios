//
//  HudLayer.h
//  myFirstBeatEmUp
//
//  Created by Gilang Esha Gautama on 3/9/13.
//  Copyright 2013 Gautama LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SimpleDPad.h"
#import "PunchButton.h"

@interface HudLayer : CCLayer {
    
}

@property(nonatomic,weak)SimpleDPad *dPad;
@property(nonatomic,weak)PunchButton *punchBtn;

@end
