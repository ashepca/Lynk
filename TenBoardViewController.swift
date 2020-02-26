//
//  TenBoardViewController.swift
//  Lynk
//
//  Created by Andrew Shepherd on 2018-08-29.
//  Copyright © 2020 Blue Oak Apps. All rights reserved.
//

import UIKit
import AVFoundation

class TenBoardViewController: UIViewController {
  
    @IBOutlet weak var volumeOutlet: UIButton!
    @IBOutlet weak var checkMark: UIImageView!
    @IBOutlet var targetOutlets: [UIImageView]!
    @IBOutlet var chainOutlets: [UIButton]!
    @IBOutlet var linkOutlets: [UIImageView]!
    @IBOutlet weak var NumberOutlet: UITextField!
    
    var target1Center : CGPoint!
    var target2Center : CGPoint!
    var target3Center : CGPoint!
    var target4Center : CGPoint!
    var target5Center : CGPoint!
    var target6Center : CGPoint!
    var target7Center : CGPoint!
    var target8Center : CGPoint!
    var target9Center : CGPoint!
    var target10Center : CGPoint!
    var target11Center : CGPoint!
    var target12Center : CGPoint!
    var target13Center : CGPoint!
    var target14Center : CGPoint!
    var target15Center : CGPoint!
    var target16Center : CGPoint!
    var target17Center : CGPoint!
    
    var chain1Center : CGPoint!
    var chain2Center : CGPoint!
    var chain3Center : CGPoint!
    var chain4Center : CGPoint!
    var chain5Center : CGPoint!
    var chain6Center : CGPoint!
    var chain7Center : CGPoint!
    var chain8Center : CGPoint!
    var chain9Center : CGPoint!
    var chain10Center : CGPoint!
    var chain11Center : CGPoint!
    var chain12Center : CGPoint!
    var chain13Center : CGPoint!
    var chain14Center : CGPoint!
    var chain15Center : CGPoint!
    var chain16Center : CGPoint!
    var chain17Center : CGPoint!
 
    var word1 : String = ""
    var word2 : String = ""
    var word3 : String = ""
    var word4 : String = ""
    var word5 : String = ""
    var word6 : String = ""
    var word7 : String = ""
    var word8 : String = ""
    var word9 : String = ""
    var word10 : String = ""
    var word11 : String = ""
    var word12 : String = ""
    var word13 : String = ""
    var word14 : String = ""
    var word15 : String = ""
    var word16 : String = ""
    var word17 : String = ""
    
    var volumeChoice = UserDefaults.standard.bool(forKey: "Volume")
    let sizePuzzlePackChoosen = UserDefaults.standard.integer(forKey: "SizePackChoice")
    let puzzleNum = UserDefaults.standard.integer(forKey: "PuzzleNumber")
    var puzzlesDoneArray : [Bool] = []
    var gamesWonTotal = UserDefaults.standard.integer(forKey: "GamesWonCounter")
    
    var puzzleAnchor : String = ""
    var puzzleArray : [String] = []
    var answerArray : [String] = []
    var answerBoolsClockwise = [Bool](repeating: false, count: 17)
    var answerBoolsCounterClock = [Bool](repeating: false, count: 17)
    let keyBools = [Bool](repeating: true, count: 17)
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        //registering if volume setting is on or off
        if volumeChoice == true {
            volumeOutlet.setImage(UIImage(named: "volumeIcon"), for: .normal)
        } else {
            volumeOutlet.setImage(UIImage(named: "muteIcon"), for: .normal)
        }
        
        NumberOutlet.text = String(puzzleNum)

        //assigning chain title values based on puzzle pack and puzzle number selected
        puzzlesDoneArray = UserDefaults.standard.array(forKey: "Pack\(sizePuzzlePackChoosen)DoneCounter") as! [Bool]
        switch sizePuzzlePackChoosen {
        case 101:
            puzzleAnchor = PuzzlesFile101().puzAnchor[puzzleNum - 1]
            answerArray = PuzzlesFile101().puzArray[puzzleNum - 1]
            if puzzlesDoneArray[puzzleNum - 1] == true {
                puzzleArray = PuzzlesFile101().puzArray[puzzleNum - 1]
                for index in 1...17 {
                    chainOutlets[index].isUserInteractionEnabled = false
                }
            } else {
                puzzleArray = PuzzlesFile101().puzArray[puzzleNum - 1].shuffled()
                while puzzleArray == answerArray {
                    puzzleArray = PuzzlesFile101().puzArray[puzzleNum - 1].shuffled()
                }
            }
        case 102:
            puzzleAnchor = PuzzlesFile102().puzAnchor[puzzleNum - 1]
            answerArray = PuzzlesFile102().puzArray[puzzleNum - 1]
            if puzzlesDoneArray[puzzleNum - 1] == true {
                puzzleArray = PuzzlesFile102().puzArray[puzzleNum - 1]
                for index in 1...17 {
                    chainOutlets[index].isUserInteractionEnabled = false
                }
            } else {
                puzzleArray = PuzzlesFile102().puzArray[puzzleNum - 1].shuffled()
                while puzzleArray == answerArray {
                    puzzleArray = PuzzlesFile102().puzArray[puzzleNum - 1].shuffled()
                }
            }
        case 103:
            puzzleAnchor = PuzzlesFile103().puzAnchor[puzzleNum - 1]
            answerArray = PuzzlesFile103().puzArray[puzzleNum - 1]
            if puzzlesDoneArray[puzzleNum - 1] == true {
                puzzleArray = PuzzlesFile103().puzArray[puzzleNum - 1]
                for index in 1...17 {
                    chainOutlets[index].isUserInteractionEnabled = false
                }
            } else {
                puzzleArray = PuzzlesFile103().puzArray[puzzleNum - 1].shuffled()
                while puzzleArray == answerArray {
                    puzzleArray = PuzzlesFile103().puzArray[puzzleNum - 1].shuffled()
                }
            }
        case 104:
            puzzleAnchor = PuzzlesFile104().puzAnchor[puzzleNum - 1]
            answerArray = PuzzlesFile104().puzArray[puzzleNum - 1]
            if puzzlesDoneArray[puzzleNum - 1] == true {
                puzzleArray = PuzzlesFile104().puzArray[puzzleNum - 1]
                for index in 1...17 {
                    chainOutlets[index].isUserInteractionEnabled = false
                }
            } else {
                puzzleArray = PuzzlesFile104().puzArray[puzzleNum - 1].shuffled()
                while puzzleArray == answerArray {
                    puzzleArray = PuzzlesFile104().puzArray[puzzleNum - 1].shuffled()
                }
            }
        case 105:
            puzzleAnchor = PuzzlesFile105().puzAnchor[puzzleNum - 1]
            answerArray = PuzzlesFile105().puzArray[puzzleNum - 1]
            if puzzlesDoneArray[puzzleNum - 1] == true {
                puzzleArray = PuzzlesFile105().puzArray[puzzleNum - 1]
                for index in 1...17 {
                    chainOutlets[index].isUserInteractionEnabled = false
                }
            } else {
                puzzleArray = PuzzlesFile105().puzArray[puzzleNum - 1].shuffled()
                while puzzleArray == answerArray {
                    puzzleArray = PuzzlesFile105().puzArray[puzzleNum - 1].shuffled()
                }
            }
        case 106:
            puzzleAnchor = PuzzlesFile106().puzAnchor[puzzleNum - 1]
            answerArray = PuzzlesFile106().puzArray[puzzleNum - 1]
            if puzzlesDoneArray[puzzleNum - 1] == true {
                puzzleArray = PuzzlesFile106().puzArray[puzzleNum - 1]
                for index in 1...17 {
                    chainOutlets[index].isUserInteractionEnabled = false
                }
            } else {
                puzzleArray = PuzzlesFile106().puzArray[puzzleNum - 1].shuffled()
                while puzzleArray == answerArray {
                    puzzleArray = PuzzlesFile106().puzArray[puzzleNum - 1].shuffled()
                }
            }
        case 107:
            puzzleAnchor = PuzzlesFile107().puzAnchor[puzzleNum - 1]
            answerArray = PuzzlesFile107().puzArray[puzzleNum - 1]
            if puzzlesDoneArray[puzzleNum - 1] == true {
                puzzleArray = PuzzlesFile107().puzArray[puzzleNum - 1]
                for index in 1...17 {
                    chainOutlets[index].isUserInteractionEnabled = false
                }
            } else {
                puzzleArray = PuzzlesFile107().puzArray[puzzleNum - 1].shuffled()
                while puzzleArray == answerArray {
                    puzzleArray = PuzzlesFile107().puzArray[puzzleNum - 1].shuffled()
                }
            }
        default:
            puzzleAnchor = PuzzlesFile101().puzAnchor[puzzleNum - 1]
            puzzleArray = PuzzlesFile101().puzArray[puzzleNum - 1].shuffled()
            puzzleArray = PuzzlesFile101().puzArray[puzzleNum - 1].shuffled()
            while puzzleArray == answerArray {
                puzzleArray = PuzzlesFile101().puzArray[puzzleNum - 1].shuffled()
            }
        }
        
        // placing selected title values into chain pieces
        chainOutlets[0].setTitle(puzzleAnchor, for: .normal)
        for index in 1...17 {
            chainOutlets[index].setTitle(puzzleArray[index - 1], for: .normal)
        }
 
        target1Center = targetOutlets[0].center
        target2Center = targetOutlets[1].center
        target3Center = targetOutlets[2].center
        target4Center = targetOutlets[3].center
        target5Center = targetOutlets[4].center
        target6Center = targetOutlets[5].center
        target7Center = targetOutlets[6].center
        target8Center = targetOutlets[7].center
        target9Center = targetOutlets[8].center
        target10Center = targetOutlets[9].center
        target11Center = targetOutlets[10].center
        target12Center = targetOutlets[11].center
        target13Center = targetOutlets[12].center
        target14Center = targetOutlets[13].center
        target15Center = targetOutlets[14].center
        target16Center = targetOutlets[15].center
        target17Center = targetOutlets[16].center
  
        for link in 1...17 {
            addPanGesture(view: chainOutlets[link])
        }
        
        chain1Center = chainOutlets[1].center
        chain2Center = chainOutlets[2].center
        chain3Center = chainOutlets[3].center
        chain4Center = chainOutlets[4].center
        chain5Center = chainOutlets[5].center
        chain6Center = chainOutlets[6].center
        chain7Center = chainOutlets[7].center
        chain8Center = chainOutlets[8].center
        chain9Center = chainOutlets[9].center
        chain10Center = chainOutlets[10].center
        chain11Center = chainOutlets[11].center
        chain12Center = chainOutlets[12].center
        chain13Center = chainOutlets[13].center
        chain14Center = chainOutlets[14].center
        chain15Center = chainOutlets[15].center
        chain16Center = chainOutlets[16].center
        chain17Center = chainOutlets[17].center
        
        checkLinks()
    }
    
    func addPanGesture(view: UIView) {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(TenBoardViewController.handlePan(sender:)))
        view.addGestureRecognizer(pan)
    }
    
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        let movingChain = sender.view!
        let translation = sender.translation(in: view)
        let newTarget = movingChain.tag
        var intersectDetect = false
        
        switch sender.state {
            case .began, .changed:
                movingChain.center = CGPoint(x: movingChain.center.x + translation.x, y: movingChain.center.y + translation.y)
                sender.setTranslation(CGPoint.zero, in: view)
            case .ended:
                for targetIndex in 0...16 {
                    if movingChain.frame.intersects(targetOutlets[targetIndex].frame) {
                        for chainLink in 1...17 {
                            if chainOutlets[chainLink].tag == targetIndex + 1 {
                                UIView.animate(withDuration: 0.3, animations: {
                                    self.chainOutlets[chainLink].center = self.targetOutlets[newTarget - 1].center
                                })
                                chainOutlets[chainLink].tag = newTarget
                            }
                        }
                        movingChain.tag = targetIndex + 1
                        UIView.animate(withDuration: 0.3, animations: {
                            movingChain.center = self.targetOutlets[targetIndex].center
                            playSound(playSoundFile: "buttonClick")
                        })
                        intersectDetect = true
                    }
                }
                if intersectDetect == false {
                    UIView.animate(withDuration: 0.3, animations: {
                        movingChain.center = self.targetOutlets[newTarget - 1].center
                        playSound(playSoundFile: "buttonClick")
                    })
                }
                for index in 1...17 {
                    let tempWord = chainOutlets[index].title(for: .normal)!
                    let whereTempWord = answerArray.firstIndex(of: tempWord)
                    if whereTempWord == chainOutlets[index].tag - 1 || whereTempWord == abs(chainOutlets[index].tag - 1 - 16) {
                        answerBoolsCounterClock[whereTempWord!] = true
                        answerBoolsClockwise[abs(whereTempWord! - 16)] = true
                    } else {
                        answerBoolsCounterClock[whereTempWord!] = false
                        answerBoolsClockwise[abs(whereTempWord! - 16)] = false
                    }
                }
                
                checkLinks()
                
                if keyBools == answerBoolsCounterClock || keyBools == answerBoolsClockwise {
                    NumberOutlet.alpha = 0
                    checkMark.alpha = 1
                    playSound(playSoundFile: "win")
                    puzzlesDoneArray = UserDefaults.standard.array(forKey: "Pack\(sizePuzzlePackChoosen)DoneCounter") as! [Bool]
                    puzzlesDoneArray[puzzleNum - 1] = true
                    UserDefaults.standard.set(puzzlesDoneArray, forKey: "Pack\(sizePuzzlePackChoosen)DoneCounter")
                    for index in 1...17 {
                        chainOutlets[index].isUserInteractionEnabled = false
                    }
                    
                    //update games won count
                    gamesWonTotal += 1
                    UserDefaults.standard.set(gamesWonTotal, forKey: "GamesWonCounter")
                    
                    //display win VC if a trophy is won
                    if gamesWonTotal == 10 || gamesWonTotal == 50 || gamesWonTotal == 100 || gamesWonTotal == 500 || gamesWonTotal == 1000 {
                       let winVC = storyboard?.instantiateViewController(withIdentifier: "WinViewController") as! WinViewController
                       winVC.winViewDelegate = self as? winViewDelegateProtocol
                       present(winVC, animated: true, completion: nil)
                    }
                }
            
            default:
                break
        }
    }
    
    //checks each time if any words that belong next to each other (regardless of position) are next to each other
    //if so, the link piece between them will be alpha 1, if not it will be alpha 0.3
    func checkLinks() {
        for index in 1...17 {
            switch chainOutlets[index].tag {
            case 1:
                word1 = chainOutlets[index].title(for: .normal)!
            case 2:
                word2 = chainOutlets[index].title(for: .normal)!
            case 3:
                word3 = chainOutlets[index].title(for: .normal)!
            case 4:
                word4 = chainOutlets[index].title(for: .normal)!
            case 5:
                word5 = chainOutlets[index].title(for: .normal)!
            case 6:
                word6 = chainOutlets[index].title(for: .normal)!
            case 7:
                word7 = chainOutlets[index].title(for: .normal)!
            case 8:
                word8 = chainOutlets[index].title(for: .normal)!
            case 9:
                word9 = chainOutlets[index].title(for: .normal)!
            case 10:
                word10 = chainOutlets[index].title(for: .normal)!
            case 11:
                word11 = chainOutlets[index].title(for: .normal)!
            case 12:
                word12 = chainOutlets[index].title(for: .normal)!
            case 13:
                word13 = chainOutlets[index].title(for: .normal)!
            case 14:
                word14 = chainOutlets[index].title(for: .normal)!
            case 15:
                word15 = chainOutlets[index].title(for: .normal)!
            case 16:
                word16 = chainOutlets[index].title(for: .normal)!
            case 17:
                word17 = chainOutlets[index].title(for: .normal)!
            default:
                print("No title");
            }
        }
        let word1Place = answerArray.firstIndex(of: word1)
        let word2Place = answerArray.firstIndex(of: word2)
        let word3Place = answerArray.firstIndex(of: word3)
        let word4Place = answerArray.firstIndex(of: word4)
        let word5Place = answerArray.firstIndex(of: word5)
        let word6Place = answerArray.firstIndex(of: word6)
        let word7Place = answerArray.firstIndex(of: word7)
        let word8Place = answerArray.firstIndex(of: word8)
        let word9Place = answerArray.firstIndex(of: word9)
        let word10Place = answerArray.firstIndex(of: word10)
        let word11Place = answerArray.firstIndex(of: word11)
        let word12Place = answerArray.firstIndex(of: word12)
        let word13Place = answerArray.firstIndex(of: word13)
        let word14Place = answerArray.firstIndex(of: word14)
        let word15Place = answerArray.firstIndex(of: word15)
        let word16Place = answerArray.firstIndex(of: word16)
        let word17Place = answerArray.firstIndex(of: word17)
        
        if word1Place! == 0 || word1Place! - 16 == 0 {
            if linkOutlets[0].alpha != 1 {
                linkOutlets[0].alpha = 1
                playSound(playSoundFile: "metalClink")
            }
        } else {
            linkOutlets[0].alpha = 0.3
        }
        if abs(word1Place! - word2Place!) == 1 {
            if linkOutlets[1].alpha != 1 {
               linkOutlets[1].alpha = 1
               playSound(playSoundFile: "metalClink")
            }
        } else {
            linkOutlets[1].alpha = 0.3
        }
        if abs(word2Place! - word3Place!) == 1 {
            if linkOutlets[2].alpha != 1 {
                linkOutlets[2].alpha = 1
                playSound(playSoundFile: "metalClink")
            }
        } else {
            linkOutlets[2].alpha = 0.3
        }
        if abs(word3Place! - word4Place!) == 1 {
            if linkOutlets[3].alpha != 1 {
                linkOutlets[3].alpha = 1
                playSound(playSoundFile: "metalClink")
            }
        } else {
            linkOutlets[3].alpha = 0.3
        }
        if abs(word4Place! - word5Place!) == 1 {
            if linkOutlets[4].alpha != 1 {
                linkOutlets[4].alpha = 1
                playSound(playSoundFile: "metalClink")
            }
        } else {
            linkOutlets[4].alpha = 0.3
        }
        if abs(word5Place! - word6Place!) == 1 {
            if linkOutlets[5].alpha != 1 {
                linkOutlets[5].alpha = 1
                playSound(playSoundFile: "metalClink")
            }
        } else {
            linkOutlets[5].alpha = 0.3
        }
        if abs(word6Place! - word7Place!) == 1 {
            if linkOutlets[6].alpha != 1 {
                linkOutlets[6].alpha = 1
                playSound(playSoundFile: "metalClink")
            }
        } else {
            linkOutlets[6].alpha = 0.3
        }
        if abs(word7Place! - word8Place!) == 1 {
            if linkOutlets[7].alpha != 1 {
                linkOutlets[7].alpha = 1
                playSound(playSoundFile: "metalClink")
            }
        } else {
            linkOutlets[7].alpha = 0.3
        }
        if abs(word8Place! - word9Place!) == 1 {
            if linkOutlets[8].alpha != 1 {
                linkOutlets[8].alpha = 1
                playSound(playSoundFile: "metalClink")
            }
        } else {
            linkOutlets[8].alpha = 0.3
        }
        if abs(word9Place! - word10Place!) == 1 {
            if linkOutlets[9].alpha != 1 {
                linkOutlets[9].alpha = 1
                playSound(playSoundFile: "metalClink")
            }
        } else {
            linkOutlets[9].alpha = 0.3
        }
        if abs(word10Place! - word11Place!) == 1 {
            if linkOutlets[10].alpha != 1 {
                linkOutlets[10].alpha = 1
                playSound(playSoundFile: "metalClink")
            }
        } else {
            linkOutlets[10].alpha = 0.3
        }
        if abs(word11Place! - word12Place!) == 1 {
            if linkOutlets[11].alpha != 1 {
                linkOutlets[11].alpha = 1
                playSound(playSoundFile: "metalClink")
            }
        } else {
            linkOutlets[11].alpha = 0.3
        }
        if abs(word12Place! - word13Place!) == 1 {
            if linkOutlets[12].alpha != 1 {
                linkOutlets[12].alpha = 1
                playSound(playSoundFile: "metalClink")
            }
        } else {
            linkOutlets[12].alpha = 0.3
        }
        if abs(word13Place! - word14Place!) == 1 {
            if linkOutlets[13].alpha != 1 {
                linkOutlets[13].alpha = 1
                playSound(playSoundFile: "metalClink")
            }
        } else {
            linkOutlets[13].alpha = 0.3
        }
        if abs(word14Place! - word15Place!) == 1 {
            if linkOutlets[14].alpha != 1 {
                linkOutlets[14].alpha = 1
                playSound(playSoundFile: "metalClink")
            }
        } else {
            linkOutlets[14].alpha = 0.3
        }
        if abs(word15Place! - word16Place!) == 1 {
            if linkOutlets[15].alpha != 1 {
                linkOutlets[15].alpha = 1
                playSound(playSoundFile: "metalClink")
            }
        } else {
            linkOutlets[15].alpha = 0.3
        }
        if abs(word16Place! - word17Place!) == 1 {
            if linkOutlets[16].alpha != 1 {
                linkOutlets[16].alpha = 1
                playSound(playSoundFile: "metalClink")
            }
        } else {
            linkOutlets[16].alpha = 0.3
        }
        if word17Place! == 16 || word17Place! == 0 {
            if linkOutlets[17].alpha != 1 {
                linkOutlets[17].alpha = 1
                playSound(playSoundFile: "metalClink")
            }
        } else {
            linkOutlets[17].alpha = 0.3
        }
    }
    
    //back to lower VC in stack
    @IBAction func backButtonAction(_ sender: UIButton) {
        playSound(playSoundFile: "buttonClick")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

    //styling volume icon based on volume setting selection
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



