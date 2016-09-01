//
//  PunchButton.h
//  myFirstBeatEmUp
//
//  Created by Gilang Esha Gautama on 3/10/13.
//  Copyright 2013 Gautama LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class PunchButton;

@protocol PunchButtonDelegate

-(void)punchButton:(PunchButton *)punchButton isHoldingDirection:(CGPoint)direction;
-(void)punchButtonTouchBegan:(PunchButton *)punchButton;
-(void)punchButtonTouchEnded:(PunchButton *)punchButton;

@end

@interface PunchButton : CCSprite <CCTouchOneByOneDelegate> {
   
    float _radius;
    CGPoint _direction;
    
}

@property(nonatomic,weak)id <PunchButtonDelegate> delegate;
@property(nonatomic,assign)BOOL isHeld;

+(id)punchBtnWithFile:(NSString *)fileName radius:(float)radius;
-(id)initWithFile:(NSString *)filename radius:(float)radius;

@end
