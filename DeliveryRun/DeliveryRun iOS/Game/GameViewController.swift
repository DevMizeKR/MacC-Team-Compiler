//
//  GameViewController.swift
//  DeliveryRun iOS
//
//  Created by David_ADA on 2022/10/11.
//


import Foundation
import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

class GameViewController: UIViewController {
    let userDefaultData = UserDefaultData()
    
    // Pause Screen IBOutlet
    @IBOutlet weak var pauseBackView: UIView!
    @IBOutlet weak var pauseView: UIView!
    @IBOutlet weak var pauseLabel: UILabel!
    
    // End Screen IBOutlet
    @IBOutlet weak var endBackView: UIView!
    @IBOutlet weak var endView: UIView!
    @IBOutlet weak var endTitleLabel: UILabel!
    @IBOutlet weak var targetRecordLabel: UILabel!
    @IBOutlet weak var nowRecordLabel: UILabel!
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Pause Screen
        pauseView.backgroundColor = .deliveryrunPurple
        pauseView.layer.cornerRadius = 10
        pauseView.layer.borderWidth = 1
        pauseView.layer.borderColor = UIColor.white.cgColor
        
        pauseLabel.text = "PAUSE"
        pauseLabel.font = UIFont(name: "BMJUAOTF", size: 30)
        pauseLabel.textAlignment = .center
        pauseLabel.textColor = .white
        
        pauseBackView.alpha = 1.0
        pauseBackView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        pauseBackView.isHidden = true
        
        
        // End Screen
        endBackView.alpha = 1.0
        endBackView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        endBackView.isHidden = true
        
        endView.backgroundColor = .deliveryrunPurple
        endView.layer.cornerRadius = 10
        endView.layer.borderWidth = 1
        endView.layer.borderColor = UIColor.white.cgColor
        
        endTitleLabel.text = "배달 완료"
        endTitleLabel.font = UIFont(name: "BMJUAOTF", size: 40)
        endTitleLabel.textAlignment = .center
        endTitleLabel.textColor = .white
        
        targetRecordLabel.text = "목표 기록 : 00:00:00"
        targetRecordLabel.font = UIFont(name: "BMJUAOTF", size: 20)
        targetRecordLabel.textAlignment = .center
        targetRecordLabel.textColor = .white
        
        nowRecordLabel.font = UIFont(name: "BMJUAOTF", size: 20)
        nowRecordLabel.textAlignment = .center
        nowRecordLabel.textColor = .white
        
        
        // Present the scene
        if let scene = GKScene(fileNamed: "Stage1") {
            // Root 노드 생성
            if let sceneNode = scene.rootNode as! GameScene? {
                sceneNode.viewController = self
                sceneNode.scaleMode = .aspectFill

                if let view = self.view as! SKView? {
                    view.presentScene(sceneNode)
                    view.ignoresSiblingOrder = false
                }
            }
        }
    }
    
    // MARK: - Pause Screen IBAction
    @IBAction func replayPressed(_ sender: UIButton) {
        if let view = self.view as! SKView?, let gameScene = view.scene as? GameScene {
            pauseBackView.isHidden = true
            gameScene.view?.isPaused = false
        }
    }
    
    @IBAction func restartPressed(_ sender: UIButton) {
        if let view = self.view as! SKView?, let gameScene = view.scene as? GameScene {
            pauseBackView.isHidden = true
            gameScene.view?.isPaused = false
        }
        if let scene = GKScene(fileNamed: "Stage1") {
            if let sceneNode = scene.rootNode as! GameScene? {
                sceneNode.viewController = self
                sceneNode.scaleMode = .aspectFill

                if let view = self.view as! SKView? {
                    view.presentScene(sceneNode)
                    view.ignoresSiblingOrder = false
                }
            }
        }
    }
    
    @IBAction func homePressed(_ sender: UIButton) {
        let stage = UIStoryboard.init(name: "Stage", bundle: nil)
        guard let StageViewController = stage.instantiateViewController(identifier: "StageViewController") as? StageViewController else { return }
        StageViewController.modalPresentationStyle = .fullScreen
        self.present(StageViewController, animated: false, completion: nil)
    }
    
    
    // MARK: - End Screen IBAction
    @IBAction func retryPressed(_ sender: UIButton) {
        endBackView.isHidden = true
        if let scene = GKScene(fileNamed: "Stage1") {
            if let sceneNode = scene.rootNode as! GameScene? {
                sceneNode.viewController = self
                sceneNode.scaleMode = .aspectFill

                if let view = self.view as! SKView? {
                    view.presentScene(sceneNode)
                    view.ignoresSiblingOrder = false
                }
            }
        }
    }
}

let storyTexts = ["시작", "텍스트2", "텍스트3","끝"]
