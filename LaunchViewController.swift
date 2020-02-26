//
//  LaunchViewController.swift
//  Lynk
//
//  Created by Andrew Shepherd on 2018-08-29.
//  Copyright © 2020 Blue Oak Apps. All rights reserved.
//

import UIKit
import AVFoundation

// Assigned global short forms for colours
let cr = UIColor.clear
let we = UIColor.white
let rd = UIColor(displayP3Red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
let oe = UIColor.orange
let yw = UIColor.yellow
let gn = UIColor(displayP3Red: 0.376, green: 0.816, blue: 0.247, alpha: 1.0)
let bk = UIColor.black
let gy = UIColor.gray
let bn = UIColor.brown
let be = UIColor.blue
let pe = UIColor.purple

//global variables
var audioPlayer : AVAudioPlayer!

class LaunchViewController: UIViewController {

    // class variables and outlets
    var volumeChoice = UserDefaults.standard.bool(forKey: "Volume")
    var audioPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // User defaults - assigning default values
        UserDefaults.standard.register(defaults: ["GamesWonCounter" : 0])
        UserDefaults.standard.register(defaults: ["Volume" : true])
        UserDefaults.standard.register(defaults: ["SizePackChoice" : 101])
        UserDefaults.standard.register(defaults: ["PuzzleNumber" : 1])
    }

    // click sound for all buttons
    @IBAction func buttonPressedAction(_ sender: UIButton) {
        playSound(playSoundFile: "buttonClick")
    }
    
    // opens link to Blue Oak Apps
    @IBAction func blueOakAppsAction(_ sender: UIButton) {
        guard let url = URL(string: "http://www.blueoakapps.com") else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

//global extension with a button design
extension UIButton {
    func buttonDesign() {
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 4
        self.layer.cornerRadius = 10
    }
}

//global functions for playing sound - wav and mp3
func playSound(playSoundFile: String) {
    if UserDefaults.standard.bool(forKey: "Volume") != false {
        let soundURL = Bundle.main.url(forResource: playSoundFile, withExtension: "wav")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        } catch {
            print(error)
        }
        audioPlayer.play()
    }
}

func playSound2(playSoundFile: String) {
    if UserDefaults.standard.bool(forKey: "Volume") != false {
        let soundURL = Bundle.main.url(forResource: playSoundFile, withExtension: "mp3")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        } catch {
            print(error)
        }
        audioPlayer.play()
    }
}



