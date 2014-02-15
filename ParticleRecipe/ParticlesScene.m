//
//  MyScene.m
//  ParticleRecipe
//
//  Created by Hijazi on 2/4/14.
//  Copyright (c) 2014 iReka Soft. All rights reserved.
//

#import "ParticlesScene.h"

@implementation ParticlesScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        winSize = size;
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:0.0];
        
        SKButton *button = [[SKButton alloc] init];
        button.title.text= @"Snow Particle";
        button.position = CGPointMake(size.width/2, 150);
        [button.title setFontSize:20.0];
        [button setTouchUpTarget:self action:@selector(runSnowParticle)];
        button.zPosition = 3;
        
        [self addChild:button];
        
        button = [[SKButton alloc] init];
        button.title.text= @"Rain Particle";
        [button.title setFontSize:20.0];        
        button.position = CGPointMake(size.width/2, 203);
        [button setTouchUpTarget:self action:@selector(runRainParticle)];
        button.zPosition = 3;
        
        [self addChild:button];
        
    }
    return self;
}

- (void)removeAllParticles
{
    for (SKNode *node in self.children){
        if ([node isKindOfClass:[SKEmitterNode class]]){
            [node removeFromParent];
        }
    }
}

- (void)runRainParticle{
    
    [self removeAllParticles];
    
    
    NSString *myParticlePath = [[NSBundle mainBundle] pathForResource:@"RainParticle" ofType:@"sks"];
    
    SKEmitterNode *myParticle = [NSKeyedUnarchiver unarchiveObjectWithFile:myParticlePath];
    myParticle.position = CGPointMake(winSize.width/2,winSize.height);
    myParticle.numParticlesToEmit = 100;
    myParticle.particlePositionRange = CGVectorMake(myParticle.particlePositionRange.dx*IF_IPAD_TWO, myParticle.particlePositionRange.dy);

    
    [self addChild:myParticle];
}

- (void)runSnowParticle{
    
    [self removeAllParticles];
    
    
    NSString *filename = @"SnowParticle";
    
    NSString *myParticlePath = [[NSBundle mainBundle] pathForResource:filename ofType:@"sks"];

    
    SKEmitterNode *myParticle = [NSKeyedUnarchiver unarchiveObjectWithFile:myParticlePath];
    myParticle.position = CGPointMake(winSize.width/2,winSize.height);

    // use this to limit the ammount of particle
    myParticle.numParticlesToEmit = 80;
    myParticle.particlePositionRange = CGVectorMake(myParticle.particlePositionRange.dx*IF_IPAD_TWO, myParticle.particlePositionRange.dy);
    
    [self addChild:myParticle];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        //CGPoint location = [touch locationInNode:self];
    
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
