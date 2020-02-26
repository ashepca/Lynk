//
//  PuzzleSelectorViewController.swift
//  Lynk
//
//  Created by Andrew Shepherd on 2018-08-29.
//  Copyright © 2020 Blue Oak Apps. All rights reserved.
//

import UIKit
import AVFoundation
import StoreKit

class PuzzleSelectorViewController: UIViewController {
   
    //variables, constants and outlets
    var puzzleNumber = 1
    let sizePuzzlePackChoosen = UserDefaults.standard.integer(forKey: "SizePackChoice")
    var puzzlesDoneArray : [Bool] = []
    var volumeChoice = UserDefaults.standard.bool(forKey: "Volume")
    var gamesWonTotal = UserDefaults.standard.integer(forKey: "GamesWonCounter")
    
    @IBOutlet weak var volumeOutlet: UIButton!
    @IBOutlet var puzzleChoiceOutlet: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting volume icon based on setting
        if volumeChoice == true {
            volumeOutlet.setImage(UIImage(named: "volumeIcon"), for: .normal)
        } else {
            volumeOutlet.setImage(UIImage(named: "muteIcon"), for: .normal)
        }
        
        //setting the star icon to indicate if a puzzle is completed already
        puzzlesDoneArray = UserDefaults.standard.array(forKey: "Pack\(sizePuzzlePackChoosen)DoneCounter") as! [Bool]
        for puzzle in 0...19 {
            if puzzlesDoneArray[puzzle] == true {
                puzzleChoiceOutlet[puzzle].setBackgroundImage(UIImage(named: "checkMark"), for: .normal)
                puzzleChoiceOutlet[puzzle].setTitle("", for: .normal)
            }
        }
    }
    
    //setting puzzle done star, volume choices when view appears (i.e. forward or backward)
    override func viewWillAppear(_ animated: Bool) {
        puzzlesDoneArray = UserDefaults.standard.array(forKey: "Pack\(sizePuzzlePackChoosen)DoneCounter") as! [Bool]
        for puzzle in 0...19 {
            if puzzlesDoneArray[puzzle] == true {
                puzzleChoiceOutlet[puzzle].setBackgroundImage(UIImage(named: "checkMark"), for: .normal)
                puzzleChoiceOutlet[puzzle].setTitle("", for: .normal)
            }
        }
        volumeChoice = UserDefaults.standard.bool(forKey: "Volume")
        if volumeChoice == true {
            volumeOutlet.setImage(UIImage(named: "volumeIcon"), for: .normal)
        } else {
            volumeOutlet.setImage(UIImage(named: "muteIcon"), for: .normal)
        }
        // asks for a rating review if more than 10 games have been won (only runs 3 times a year per apple logic)
        if gamesWonTotal >= 10 {
           SKStoreReviewController.requestReview()
        }
    }
    
    //back button moves to VC lower in stack
    @IBAction func backButtonAction(_ sender: UIButton) {
        playSound(playSoundFile: "buttonClick")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    //setting volume button setting and icon
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
    
    //open the correct board size VC depening on puzzle pack choosen
    @IBAction func puzzleChoice(_ sender: UIButton) {
        playSound(playSoundFile: "buttonClick")
        puzzleNumber = sender.tag
        UserDefaults.standard.set(puzzleNumber, forKey: "PuzzleNumber")
        performSegue(withIdentifier: "tenBoardSegue", sender: self)
    }
}

