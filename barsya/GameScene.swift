//
//  GameScene.swift
//  barsya
//
//  Created by Ted Vtorov on 12.04.2023.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let circle1 = SKShapeNode(circleOfRadius: 30)
    
    func getrandompoint() -> CGPoint {
        let displaySize: CGRect = UIScreen.main.bounds
        let displayWidth = Int(displaySize.width/2)
        let displayHeight = Int(displaySize.height/2)
        
        return CGPoint(x: Double(Int.random(in: -displayWidth..<displayWidth)), y: Double(Int.random(in: -displayHeight..<displayHeight)))
    }
    
    override func didMove(to view: SKView) {
        
        NSLog("Start") //Using NSLog just to print the current time
        
        
        circle1.position = CGPoint(x: 0, y: 0)
        circle1.strokeColor = SKColor.black
        circle1.glowWidth = 1.0
        circle1.fillColor = SKColor.red
        addChild(circle1)
        
        recursive()
        
        
        
//        let moveaction = SKAction.move(to: getrandompoint(), duration: 2)
//        let zeromove = SKAction.move(to: CGPoint(x: 0, y: 0), duration: 1)
//        let stopmove = SKAction.removeFromParent()
//        circle1.run(SKAction.repeat(SKAction.sequence([moveaction, zeromove]), count: 5))
      
    }
    
    func recursive(){

        let recursive = SKAction.sequence([SKAction.move(to: getrandompoint(), duration: 1)])
        circle1.run(recursive, completion: {self.recursive()})
        }

    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
