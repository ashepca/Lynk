//
//  TrophyRoomViewController.swift
//  Lynk
//
//  Created by Andrew Shepherd on 2018-08-29.
//  Copyright © 2020 Blue Oak Apps. All rights reserved.
//

import UIKit
import AVFoundation

class TrophyRoomViewController: UIViewController {
  
    //variables, constants and outlets
    var gamesWonTotal = UserDefaults.standard.integer(forKey: "GamesWonCounter")
    var volumeChoice = UserDefaults.standard.bool(forKey: "Volume")
    
    @IBOutlet weak var volumeOutlet: UIButton!
    @IBOutlet var toolOutlets: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //displaying volume icon based on setting
        if volumeChoice == true {
            volumeOutlet.setImage(UIImage(named: "volumeIcon"), for: .normal)
        } else {
            volumeOutlet.setImage(UIImage(named: "muteIcon"), for: .normal)
        }
        
        //displaying trophies faded if you haven't won them yet
        if gamesWonTotal >= 10 {
            toolOutlets[0].alpha = 1
        }
        if gamesWonTotal >= 50 {
            toolOutlets[1].alpha = 1
        }
        if gamesWonTotal >= 100 {
            toolOutlets[2].alpha = 1
        }
        if gamesWonTotal >= 500 {
            toolOutlets[3].alpha = 1
        }
        if gamesWonTotal >= 1000 {
            toolOutlets[4].alpha = 1
        }

        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when) {
            playSound(playSoundFile: "win")
        }
    }

    //return to launch VC
    @IBAction func backButtonAction(_ sender: UIButton) {
        playSound(playSoundFile: "buttonClick")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    //setting volume and icon based on selection
    @IBAction func volumeChoiceAction(_ sender: UIButton) {
        if volumeChoice == true {
            volumeChoice = false
            volumeOutlet.setImage(UIImage(named: "muteIcon"), for: .normal)
            UserDefaults.standard.set(volumeChoice, forKey: "Volume")
        } else if volumeChoice == false {
            volumeChoice = true
            volumeOutlet.setImage(UIImage(named: "volumeIcon"), for: .normal)
            UserDefaults.standard.set(volumeChoice, forKey: "Volume")
            playSound(playSoundFile: "buttonClick")
        }
    }
}
