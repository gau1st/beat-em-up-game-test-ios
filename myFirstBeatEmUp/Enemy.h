//
//  Enemy.h
//  myFirstBeatEmUp
//
//  Created by Gilang Esha Gautama on 3/10/13.
//  Copyright 2013 Gautama LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "ActionSprite.h"

@interface Enemy : ActionSprite {
    
}

@property(nonatomic,assign)double nextDecisionTime;

@end
