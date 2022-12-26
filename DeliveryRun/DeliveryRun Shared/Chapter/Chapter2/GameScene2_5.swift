//
//  GameScene2_5.swift
//  DeliveryRun iOS
//
//  Created by David_ADA on 2022/12/26.
//

import Foundation
import SpriteKit

class GameScene2_5: GameScene {
    
    override var endPoint: Double {
        120000.0
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        print("GameScene2_5 On")
    }
    
}
