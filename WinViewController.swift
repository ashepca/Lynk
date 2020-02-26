//
//  WinViewController.swift
//  Lynk
//
//  Created by Andrew Shepherd on 2018-08-29.
//  Copyright © 2020 Blue Oak Apps. All rights reserved.
//

import UIKit
import AVFoundation

protocol winViewDelegateProtocol {
}

class WinViewController: UIViewController {

    //variables, constants and outlets
    var gamesWonTotal = UserDefaults.standard.integer(forKey: "GamesWonCounter")
    var winViewDelegate: winViewDelegateProtocol!
    
    @IBOutlet weak var okWinOutlet: UIButton!
    @IBOutlet weak var awardImageOutlet: UIImageView!
    @IBOutlet weak var winTitleOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        if gamesWonTotal == 10 || gamesWonTotal == 50 || gamesWonTotal == 100 || gamesWonTotal == 500 || gamesWonTotal == 1000 {
            okWinOutlet.setTitle("Collect Tool", for: .normal)
        }
        playSound(playSoundFile: "win")        
        okWinOutlet.buttonDesign()
        
        //display win title and image based on number of games won
        switch gamesWonTotal {
            case 10:
                winTitleOutlet.text = "10 Games Won!"
                awardImageOutlet.image = UIImage(named: "sawPlain")
            case 50:
                winTitleOutlet.text = "50 Games Won!"
                awardImageOutlet.image = UIImage(named: "wrenchesPlain")
            case 100:
                winTitleOutlet.text = "100 Games Won!"
                awardImageOutlet.image = UIImage(named: "screwdriversPlain")
            case 500:
                winTitleOutlet.text = "500 Games Won!"
                awardImageOutlet.image = UIImage(named: "levelPlain")
            case 1000:
                winTitleOutlet.text = "1000 Games Won!"
                awardImageOutlet.image = UIImage(named: "hammerPlain")
            default:
                winTitleOutlet.text = "Congratulations!"
                awardImageOutlet.image = UIImage(named: "winChainLinks")
        }
    }

    //dismiss win VC
    @IBAction func okWinAction(_ sender: UIButton) {
        playSound(playSoundFile: "buttonClick")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
