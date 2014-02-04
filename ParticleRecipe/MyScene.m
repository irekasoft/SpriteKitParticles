//
//  MyScene.m
//  ParticleRecipe
//
//  Created by Hijazi on 2/4/14.
//  Copyright (c) 2014 iReka Soft. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:0.0];
        
        SKButton *button = [[SKButton alloc] init];
        button.title.text= @"Snow Particle";
        button.position = CGPointMake(160, 150);
        [button setTouchUpTarget:self action:@selector(runSnowParticle)];
        button.zPosition = 3;
        
        [self addChild:button];
        
        button = [[SKButton alloc] init];
        button.title.text= @"Rain Particle";
        button.position = CGPointMake(160, 203);
        [button setTouchUpTarget:self action:@selector(runRainParticle)];
        button.zPosition = 3;
        
        [self addChild:button];
        
    }
    return self;
}

- (void)removeAllParticles{
    
    for (SKNode *node in self.children){
        
        if ([node isKindOfClass:[SKEmitterNode class]]){
            
            [node removeFromParent];
            
        }
        
        
    }
    
}

- (void)runRainParticle{
    
    [self removeAllParticles];
    
    NSLog(@"hi");
    
    NSString *myParticlePath = [[NSBundle mainBundle] pathForResource:@"RainParticle" ofType:@"sks"];
    
    SKEmitterNode *myParticle = [NSKeyedUnarchiver unarchiveObjectWithFile:myParticlePath];
    myParticle.position = CGPointMake(160,568);
//    myParticle.particleLifetime = 0;
    
    [self addChild:myParticle];
}

- (void)runSnowParticle{
    
    [self removeAllParticles];    
    
    NSLog(@"hi");    
    
    NSString *myParticlePath = [[NSBundle mainBundle] pathForResource:@"SnowParticle" ofType:@"sks"];
    
    SKEmitterNode *myParticle = [NSKeyedUnarchiver unarchiveObjectWithFile:myParticlePath];
    myParticle.position = CGPointMake(160,568);
//    myParticle.particleLifetime = 0;
    
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
