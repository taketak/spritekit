//
//  GameScene.m
//  SpriteKit03
//
//  Created by 武内駿 on 2015/06/19.
//  Copyright (c) 2015年 Syun Takeuchi. All rights reserved.
//  スプライトキットと物理テスト

#import "GameScene.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    
    self.physicsWorld.gravity=CGVectorMake(0.0, -9.8);
    //画面枠
    self.physicsBody=[SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    
    
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel.text = @"Wall";
    myLabel.fontSize = 65;
    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                   CGRectGetMidY(self.frame));
    {
        SKPhysicsBody *pd=[SKPhysicsBody bodyWithRectangleOfSize:myLabel.frame.size];
        myLabel.physicsBody=pd;
        myLabel.physicsBody.dynamic=NO;
        
    }
    [self addChild:myLabel];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.xScale = 0.2;
        sprite.yScale = 0.2;
        sprite.position = location;
        {
            //円形ボディ
            SKPhysicsBody *pb=[SKPhysicsBody bodyWithCircleOfRadius:30];
            //反発
            pb.restitution=0.8;
            //速度
            pb.velocity=CGVectorMake(300, 300);
            sprite.physicsBody=pb;
        }
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
