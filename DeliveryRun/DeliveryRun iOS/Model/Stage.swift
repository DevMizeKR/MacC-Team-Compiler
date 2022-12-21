//
//  Stage.swift
//  DeliveryRun iOS
//
//  Created by HWANG-C-K on 2022/11/22.
//

import UIKit
import Foundation

class Stage: Codable{
    let name: String
    let image: String
    let targetRecord: Float
    var myRecord: Float
    var star: Int {
        get {
            if myRecord == 0.0 { return 0 }
            if targetRecord - 15 >= myRecord { return 3 }
            else if targetRecord >= myRecord { return 2 }
            else if targetRecord + 15 >= myRecord { return 1 }
            return 0
        }
    }
    var isLock: Bool
    
    init(name: String, image: String, targetRecord: Float, myRecord:Float,isLock: Bool) {
        self.name = name
        self.image = image
        self.targetRecord = targetRecord
        self.myRecord = myRecord
        self.isLock = isLock
    }
}

