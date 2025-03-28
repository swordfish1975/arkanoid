//
//  GameScene.swift
//  Arkanoid
//
//  Created by konstantin on 17/12/2018.
//  Copyright © 2018 konstantin. All rights reserved.
//

import SpriteKit
import GameplayKit
struct PhysicsBodies{
    static let BallPhBodMask: UInt32 = 1
    static let BrickPhBodMask: UInt32 = 2
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    var ball: SKSpriteNode?
    var paddle: SKSpriteNode?
    
    
    
    override func didMove(to view: SKView) {
        ball = self.childNode(withName: "Ball") as? SKSpriteNode
        paddle = self.childNode(withName: "Paddle") as? SKSpriteNode
        self.physicsWorld.contactDelegate = self
        ball?.physicsBody?.applyImpulse(CGVector(dx: 150, dy: 150))
        let border = SKPhysicsBody(edgeLoopFrom: (view.scene?.frame)!)
        border.friction = 0
        self.physicsBody = border
        
        
        
        }
        
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLoc = touch.location(in: self)
            paddle?.position.x = touchLoc.x
        }
        
    }
        
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLoc = touch.location(in: self)
            paddle?.position.x = touchLoc.x
        }
        
    }
    func didBegin(_ contact: SKPhysicsContact) {
        var bodyA = contact.bodyA.node
        var bodyB = contact.bodyB.node
        if bodyA?.physicsBody?.categoryBitMask == PhysicsBodies.BallPhBodMask && bodyB?.physicsBody?.categoryBitMask == PhysicsBodies.BrickPhBodMask{
            bodyB?.removeFromParent()
        }
        if bodyA?.physicsBody?.categoryBitMask == PhysicsBodies.BrickPhBodMask && bodyB?.physicsBody?.categoryBitMask == PhysicsBodies.BallPhBodMask{
            bodyA?.removeFromParent()
        }
        
    }
    
    
    
    
    
}
