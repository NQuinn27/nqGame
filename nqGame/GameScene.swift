//
//  GameScene.swift
//  nqGame
//
//  Created by Niall Quinn on 28/08/2014.
//  Copyright (c) 2014 Niall Quinn. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var rocket = SKSpriteNode()
    
    
    override func didMoveToView(view: SKView) {
        
        //Physics
        self.physicsWorld.gravity = CGVectorMake(0.0, -5.0)
        
        //Rocket
        var rocketTexture = SKTexture(imageNamed: "rocket")
        rocketTexture.filteringMode = SKTextureFilteringMode.Nearest
        
        rocket = SKSpriteNode(texture: rocketTexture)
        rocket.setScale(0.5)
        rocket.position = CGPointMake(self.frame.size.width*0.35, self.frame.size.height*0.6)
        
        rocket.physicsBody = SKPhysicsBody(circleOfRadius: rocket.size.height/2)
        rocket.physicsBody.dynamic = true
        rocket.physicsBody.allowsRotation = false
        
        self.addChild(rocket)
        
        //Ground
        var groundTexture = SKTexture(imageNamed: "ground")
        var sprite = SKSpriteNode(texture: groundTexture)
        sprite.setScale(2.0)
        sprite.position = CGPointMake(self.size.width/2, sprite.size.height/2)
        self.addChild(sprite)
        
        var ground = SKNode()
        ground.position = CGPointMake(0, groundTexture.size().height)
        ground.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.frame.size.width, groundTexture.size().height*2.0))
        ground.physicsBody.dynamic = false
        self.addChild(ground)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            rocket.physicsBody.velocity = CGVectorMake(0, 0)
            rocket.physicsBody.applyImpulse(CGVectorMake(0, 25))
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
