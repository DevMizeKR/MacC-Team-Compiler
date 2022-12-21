//
//  Sound.swift
//  DeliveryRun iOS
//
//  Created by David_ADA on 2022/11/02.
//

import Foundation
import AVFoundation

class GameSound {
    var gameSound:AVAudioPlayer
    
    static let shared:GameSound = {
        let instance = GameSound(gameSoundPlayer: AVAudioPlayer())
        return instance
    }()
    
    init(gameSoundPlayer: AVAudioPlayer) {
        self.gameSound = AVAudioPlayer()
    }
    
    func playGameSound(soundName: String) {
        let url = Bundle.main.url(forResource:  soundName, withExtension: "wav")
        do {
            gameSound = try AVAudioPlayer(contentsOf: url!)
            gameSound.setVolume(1.0, fadeDuration: 1.0)
            gameSound.play()
        } catch {
            print("GameSound Error \(error)")
        }
    }
    func offGameSound() {
        gameSound.setVolume(0.0, fadeDuration: 0)
    }
}
class BackgroundSound {
    
    var backgroundSound:AVAudioPlayer
    
    
    static let shared:BackgroundSound = {
        let instance = BackgroundSound(backgroundPlayer: AVAudioPlayer())
        return instance
    }()
    
    
    init(backgroundPlayer: AVAudioPlayer) {
        self.backgroundSound = AVAudioPlayer()
    }
    
    func playBackground(soundName:String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        do {
            backgroundSound = try AVAudioPlayer(contentsOf: url!)
            backgroundSound.setVolume(0.7, fadeDuration: 1)
            backgroundSound.numberOfLoops = -1
            backgroundSound.play()
        } catch {
            print("SoundError \(error)")
        }
    }
    
    func stopBackground() {
        backgroundSound.setVolume(0.0, fadeDuration: 1)
        backgroundSound.numberOfLoops = 1
        backgroundSound.stop()
    }
}

// MARK: Sounds 0... 게임내 사운드를 담당
