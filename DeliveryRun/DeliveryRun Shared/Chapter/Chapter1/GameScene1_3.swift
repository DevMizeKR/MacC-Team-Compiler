//
//  GameScene1_3.swift
//  DeliveryRun iOS
//
//  Created by David_ADA on 2022/12/26.
//

import Foundation
import SpriteKit
class GameScene1_3: GameScene {
    
    override var endPoint: Double {
        120000.0
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        print("GameScene1_3 On")
    }
    
}
