//
//  GameLayer.m
//  myFirstBeatEmUp
//
//  Created by Gilang Esha Gautama on 3/9/13.
//  Copyright 2013 Gautama LLC. All rights reserved.
//

#import "GameLayer.h"
#import "Enemy.h"
#import "GameScene.h"
#import "SimpleAudioEngine.h"


@implementation GameLayer

- (id) init {
    if ((self = [super init])) {
       
        tick = 0;
        holdTime = 0;
        punchHold = NO;
        combo = 0;
        _actors = [[CCNode alloc] init];
        
        // Load audio
        [[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"Main BGM.mp3"];
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"Main BGM.mp3"];
        [[SimpleAudioEngine sharedEngine] preloadEffect:@"pd_hit0.mp3"];
        [[SimpleAudioEngine sharedEngine] preloadEffect:@"pd_hit1.mp3"];
        [[SimpleAudioEngine sharedEngine] preloadEffect:@"pd_herodeath.mp3"];
        [[SimpleAudioEngine sharedEngine] preloadEffect:@"pd_botdeath.mp3"];
        
        [self setTouchEnabled:YES];
        [self addChild:_actors z:-5];
        [self initTileMap];
        [self initHero];
        [self initEnemies];
        [self scheduleUpdate];
    }
    return self;
}

- (void) initTileMap {
    
    _tileMap = [CCTMXTiledMap tiledMapWithTMXFile:@"pd_tilemap.tmx"];
    for (CCTMXLayer *child in [_tileMap children]) {
        [[child texture] setAliasTexParameters];
    }
    
    [self addChild:_tileMap z:-6];
}

-(void)initHero {
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"scott_sprites.plist"];
    _hero = [[Hero alloc] init];
    [_actors addChild:_hero z:100];
    _hero.position = ccp(_hero.centerToSides, 80);
    _hero.desiredPosition = _hero.position;
    [_hero idle];
    
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /*
    if (tick < 30) {
        tick = 0;
        if (combo == 0) {
            combo = 1;
            [_hero attack2];
            if (_hero.actionState == kActionStateAttack) {
                Enemy *enemy;
                CCARRAY_FOREACH(_enemy, enemy) {
                    if (enemy.actionState != kActionStateKnockedOut) {
                        if (fabsf(_hero.position.y - enemy.position.y) < 10) {
                            if (CGRectIntersectsRect(_hero.attackBox.actual, enemy.hitBox.actual)) {
                                [enemy hurtWithDamage:_hero.damage];
                            }
                        }
                    }
                }
            }
        } else {
            combo = 0;
            [_hero attack];
            if (_hero.actionState == kActionStateAttack) {
                Enemy *enemy;
                CCARRAY_FOREACH(_enemy, enemy) {
                    if (enemy.actionState != kActionStateKnockedOut) {
                        if (fabsf(_hero.position.y - enemy.position.y) < 10) {
                            if (CGRectIntersectsRect(_hero.attackBox.actual, enemy.hitBox.actual)) {
                                [enemy hurtWithDamage:_hero.damage];
                            }
                        }
                    }
                }
            }
        }
    
    } else {
        tick = 0;
        [_hero attack];
        if (_hero.actionState == kActionStateAttack) {
            Enemy *enemy;
            CCARRAY_FOREACH(_enemy, enemy) {
                if (enemy.actionState != kActionStateKnockedOut) {
                    if (fabsf(_hero.position.y - enemy.position.y) < 10) {
                        if (CGRectIntersectsRect(_hero.attackBox.actual, enemy.hitBox.actual)) {
                            [enemy hurtWithDamage:_hero.damage];
                        }
                    }
                }
            }
        }
    }
    */
}


-(void)punchButtonTouchBegan:(PunchButton *)punchButton {
    
    if (tick < 30) {
        tick = 0;
        if (combo == 0) {
            combo = 1;
            [_hero attack2];
            if (_hero.actionState == kActionStateAttack) {
                Enemy *enemy;
                CCARRAY_FOREACH(_enemy, enemy) {
                    if (enemy.actionState != kActionStateKnockedOut) {
                        if (fabsf(_hero.position.y - enemy.position.y) < 10) {
                            if (CGRectIntersectsRect(_hero.attackBox.actual, enemy.hitBox.actual)) {
                                [enemy hurtWithDamage:_hero.damage];
                            }
                        }
                    }
                }
            }
        } else {
            combo = 0;
            [_hero attack];
            if (_hero.actionState == kActionStateAttack) {
                Enemy *enemy;
                CCARRAY_FOREACH(_enemy, enemy) {
                    if (enemy.actionState != kActionStateKnockedOut) {
                        if (fabsf(_hero.position.y - enemy.position.y) < 10) {
                            if (CGRectIntersectsRect(_hero.attackBox.actual, enemy.hitBox.actual)) {
                                [enemy hurtWithDamage:_hero.damage];
                            }
                        }
                    }
                }
            }
        }
        
    } else {
        tick = 0;
        [_hero attack];
        if (_hero.actionState == kActionStateAttack) {
            Enemy *enemy;
            CCARRAY_FOREACH(_enemy, enemy) {
                if (enemy.actionState != kActionStateKnockedOut) {
                    if (fabsf(_hero.position.y - enemy.position.y) < 10) {
                        if (CGRectIntersectsRect(_hero.attackBox.actual, enemy.hitBox.actual)) {
                            [enemy hurtWithDamage:_hero.damage];
                        }
                    }
                }
            }
        }
    }
}

-(void)punchButton:(PunchButton *)punchButton isHoldingDirection:(CGPoint)direction
{
    if (!punchHold) {
        punchHold = YES;
    }
    
    if (holdTime > 30) {
        
        [_hero playingGuitar];
    }
    
}

-(void)punchButtonTouchEnded:(PunchButton *)punchButton
{
    punchHold = NO;
    holdTime = 0;
}


-(void)simpleDPad:(SimpleDPad *)simpleDPad didChangeDirectionTo:(CGPoint)direction {
    [_hero walkWithDirection:direction];

}

-(void)simpleDPadTouchEnded:(SimpleDPad *)simpleDPad {
    if (_hero.actionState == kActionStateWalk) {
        [_hero idle];
    }

}

-(void)simpleDPad:(SimpleDPad *)simpleDPad isHoldingDirection:(CGPoint)direction {
    [_hero walkWithDirection:direction];
}

-(void)setViewpointCenter:(CGPoint) position {
    
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    
    int x = MAX(position.x, winSize.width / 2);
    int y = MAX(position.y, winSize.height / 2);
    x = MIN(x, (_tileMap.mapSize.width * _tileMap.tileSize.width)
            - winSize.width / 2);
    y = MIN(y, (_tileMap.mapSize.height * _tileMap.tileSize.height)
            - winSize.height/2);
    CGPoint actualPosition = ccp(x, y);
    
    CGPoint centerOfView = ccp(winSize.width/2, winSize.height/2);
    CGPoint viewPoint = ccpSub(centerOfView, actualPosition);
    self.position = viewPoint;
}

-(void)update:(ccTime)dt {
    if (tick < 100) {
        tick += 1;
    }
    
    if (punchHold) {
        holdTime += 1;
    }
    
    [_hero update:dt];
    [self updateEnemies:dt];
    [self updatePositions];
    [self reorderActors];
    [self setViewpointCenter:_hero.position];
}

-(void)updatePositions {
    float posX = MIN(_tileMap.mapSize.width * _tileMap.tileSize.width - _hero.centerToSides, MAX(_hero.centerToSides, _hero.desiredPosition.x));
    float posY = MIN(2.5 * _tileMap.tileSize.height + _hero.centerToBottom, MAX(_hero.centerToBottom, _hero.desiredPosition.y));
    _hero.position = ccp(posX, posY);
    
    // Update robots
    Enemy *enemy;
    CCARRAY_FOREACH(_enemy, enemy) {
        posX = MIN(_tileMap.mapSize.width * _tileMap.tileSize.width - enemy.centerToSides, MAX(enemy.centerToSides, enemy.desiredPosition.x));
        posY = MIN(3 * _tileMap.tileSize.height + enemy.centerToBottom, MAX(enemy.centerToBottom, enemy.desiredPosition.y));
        enemy.position = ccp(posX, posY);
    }
}

-(void)initEnemies {
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"pd_sprites.plist"];
    int enemyCount = 10;
    self.enemy = [[CCArray alloc] initWithCapacity:enemyCount];
    
    for (int i = 0; i < enemyCount; i++) {
        Enemy *enemy = [[Enemy alloc] init];
        [_actors addChild:enemy z:100];
        [_enemy addObject:enemy];
        
        int minX = SCREEN.width + enemy.centerToSides;
        int maxX = _tileMap.mapSize.width * _tileMap.tileSize.width - enemy.centerToSides;
        int minY = enemy.centerToBottom;
        int maxY = 3 * _tileMap.tileSize.height + enemy.centerToBottom;
        enemy.scaleX = -1;
        enemy.position = ccp(random_range(minX, maxX), random_range(minY, maxY));
        enemy.desiredPosition = enemy.position;
        [enemy idle];
    }
    
   
}

-(void)updateEnemies:(ccTime)dt {
    int alive = 0;
    Enemy *enemy;
    float distanceSQ;
    int randomChoice = 0;
    CCARRAY_FOREACH(_enemy, enemy) {
        [enemy update:dt];
        if (enemy.actionState != kActionStateKnockedOut) {
            //1
            alive++;
            
            //2
            if (CURTIME > enemy.nextDecisionTime) {
                distanceSQ = ccpDistanceSQ(enemy.position, _hero.position);
                
                //3
                if (distanceSQ <= 50 * 50) {
                    enemy.nextDecisionTime = CURTIME + frandom_range(0.1, 0.5);
                    randomChoice = random_range(0, 1);
                    
                    if (randomChoice == 0) {
                        if (_hero.position.x > enemy.position.x) {
                            enemy.scaleX = 1.0;
                        } else {
                            enemy.scaleX = -1.0;
                        }
                        
                        //4
                        [enemy attack];
                        if (enemy.actionState == kActionStateAttack) {
                            if (fabsf(_hero.position.y - enemy.position.y) < 10) {
                                if (CGRectIntersectsRect(_hero.hitBox.actual, enemy.attackBox.actual)) {
                                    [_hero hurtWithDamage:enemy.damage];
                                    
                                    //end game checker here
                                    if (_hero.actionState == kActionStateKnockedOut && [_hud getChildByTag:5] == nil) {
                                        [self endGame];
                                    }
                                }
                            }
                        }
                    } else {
                        [enemy idle];
                    }
                } else if (distanceSQ <= SCREEN.width * SCREEN.width) {
                    //5
                    enemy.nextDecisionTime = CURTIME + frandom_range(0.5, 1.0);
                    randomChoice = random_range(0, 2);
                    if (randomChoice == 0) {
                        CGPoint moveDirection = ccpNormalize(ccpSub(_hero.position, enemy.position));
                        [enemy walkWithDirection:moveDirection];
                    } else {
                        [enemy idle];
                    }
                }
            }
        }
    }
    
    //end game checker here
    if (alive == 0 && [_hud getChildByTag:5] == nil) {
        [self endGame];
        [_hero knockout];
    }
}

-(void)reorderActors {
    
    ActionSprite *sprite;
    CCARRAY_FOREACH(_actors.children, sprite) {
        [_actors reorderChild:sprite z:-(sprite.position.y)];
    }
    
}

-(void)endGame {
    CCLabelTTF *restartLabel = [CCLabelTTF labelWithString:@"RESTART" fontName:@"Arial" fontSize:30];
    CCMenuItemLabel *restartItem = [CCMenuItemLabel itemWithLabel:restartLabel target:self selector:@selector(restartGame)];
    CCMenu *menu = [CCMenu menuWithItems:restartItem, nil];
    menu.position = CENTER;
    menu.tag = 5;
    [_hud addChild:menu z:5];
}

-(void)restartGame {
    [[CCDirector sharedDirector] replaceScene:[GameScene node]];
}

-(void)dealloc {
    [self unscheduleUpdate];
}

@end
