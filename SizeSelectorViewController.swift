//
//  SizeSelectorViewController.swift
//  Lynk
//
//  Created by Andrew Shepherd on 2018-08-29.
//  Copyright © 2020 Blue Oak Apps. All rights reserved.
//

import UIKit
import AVFoundation
import StoreKit

class SizeSelectorViewController: UIViewController, SKProductsRequestDelegate, SKPaymentTransactionObserver {

    // variables and outlets
    var puzzlePackChoosen = 101
    var unlockedPuzzlePacks = [101]
    var pack101DoneArray = Array(repeating: false, count: 20)
    var pack102DoneArray = Array(repeating: false, count: 20)
    var pack103DoneArray = Array(repeating: false, count: 20)
    var pack104DoneArray = Array(repeating: false, count: 20)
    var pack105DoneArray = Array(repeating: false, count: 20)
    var pack106DoneArray = Array(repeating: false, count: 20)
    var pack107DoneArray = Array(repeating: false, count: 20)
    var volumeChoice = UserDefaults.standard.bool(forKey: "Volume")
    
    @IBOutlet weak var volumeOutlet: UIButton!
    @IBOutlet weak var restoreOutlet: UIButton!
    @IBOutlet var packOutlets: [UIButton]!
    @IBOutlet var lockOutlets: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        //styling restore
        restoreOutlet.titleLabel?.textAlignment = .center
        
        //registering if volume setting is on or off
        if volumeChoice == true {
            volumeOutlet.setImage(UIImage(named: "volumeIcon"), for: .normal)
        } else {
            volumeOutlet.setImage(UIImage(named: "muteIcon"), for: .normal)
        }

        //setting user defaults for all puzzle packs
        UserDefaults.standard.register(defaults: ["UnlockedPuzzlePacks" : unlockedPuzzlePacks])
        UserDefaults.standard.register(defaults: ["Pack101DoneCounter" : pack101DoneArray])
        UserDefaults.standard.register(defaults: ["Pack102DoneCounter" : pack102DoneArray])
        UserDefaults.standard.register(defaults: ["Pack103DoneCounter" : pack103DoneArray])
        UserDefaults.standard.register(defaults: ["Pack104DoneCounter" : pack104DoneArray])
        UserDefaults.standard.register(defaults: ["Pack105DoneCounter" : pack105DoneArray])
        UserDefaults.standard.register(defaults: ["Pack106DoneCounter" : pack106DoneArray])
        UserDefaults.standard.register(defaults: ["Pack107DoneCounter" : pack107DoneArray])
        
        unlockedPuzzlePacks = UserDefaults.standard.array(forKey: "UnlockedPuzzlePacks") as! [Int]
        
        //displaying lock image or not based on whether the pack has been unlocked
        for lock in 0...5 {
            if unlockedPuzzlePacks.contains(lockOutlets[lock].tag) {
                lockOutlets[lock].alpha = 0
            }
        }
        
        //loading product list from app store
        if(SKPaymentQueue.canMakePayments()) {
            
            //NEED TO CREATE THESE IN APP STORE
            let productID: NSSet = NSSet(objects: "com.blueoakapps.Lynk.unlockpuzzlepack102", "com.blueoakapps.Lynk.unlockpuzzlepack103", "com.blueoakapps.Lynk.unlockpuzzlepack104", "com.blueoakapps.Lynk.unlockpuzzlepack105", "com.blueoakapps.Lynk.unlockpuzzlepack106", "com.blueoakapps.Lynk.unlockpuzzlepack107")
            let request: SKProductsRequest = SKProductsRequest(productIdentifiers: productID as! Set<String>)
            request.delegate = self
            request.start()
        } else {
            print("please enable IAPS")
        }
    }
    
    //Clearing SKPaymentQueue
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        SKPaymentQueue.default().remove(self)
    }
    
    //updating volume choice, if changed on VCs above in stack
    override func viewWillAppear(_ animated: Bool) {
        volumeChoice = UserDefaults.standard.bool(forKey: "Volume")
        if volumeChoice == true {
            volumeOutlet.setImage(UIImage(named: "volumeIcon"), for: .normal)
        } else {
            volumeOutlet.setImage(UIImage(named: "muteIcon"), for: .normal)
        }
    }
    
    //lauching puzzle selector VC if pack unlocked, or launching buy puzzles VC to unlock pack
    @IBAction func packSelectionAction(_ sender: UIButton) {
        puzzlePackChoosen = sender.tag
        UserDefaults.standard.set(puzzlePackChoosen, forKey: "SizePackChoice")
        if unlockedPuzzlePacks.contains(puzzlePackChoosen) {
            playSound(playSoundFile: "buttonClick")
            performSegue(withIdentifier: "goToPuzzleSelectionSegue", sender: self)
        } else {
            playSound2(playSoundFile: "storeBell")
            let buyPuzzlesVC = storyboard?.instantiateViewController(withIdentifier: "BuyPuzzlesViewController") as! BuyPuzzlesViewController
            buyPuzzlesVC.buyPuzzlesViewDelegate = self
            present(buyPuzzlesVC, animated: true, completion: nil)
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
    
    //restoring purchases, i.e. previously unlocked puzzle packs
    @IBAction func restorePurchasesAction(_ sender: UIButton) {
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
 
    var list = [SKProduct]()
    var p = SKProduct()

    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        let myProduct = response.products
        for product in myProduct {
            list.append(product)
        }
        restoreOutlet.isEnabled = true
    }

    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        for transaction in queue.transactions {
            let t: SKPaymentTransaction = transaction
            let prodID = t.payment.productIdentifier as String
            switch prodID {
                case "com.blueoakapps.Lynk.unlockpuzzlepack102":
                    unlockedPuzzlePacks.append(102)
                case "com.blueoakapps.Lynk.unlockpuzzlepack103":
                    unlockedPuzzlePacks.append(103)
                case "com.blueoakapps.Lynk.unlockpuzzlepack104":
                    unlockedPuzzlePacks.append(104)
                case "com.blueoakapps.Lynk.unlockpuzzlepack105":
                    unlockedPuzzlePacks.append(105)
                case "com.blueoakapps.Lynk.unlockpuzzlepack106":
                    unlockedPuzzlePacks.append(106)
                case "com.blueoakapps.Lynk.unlockpuzzlepack107":
                    unlockedPuzzlePacks.append(107)
                default:
                    print("IAP not found")
            }
            for lock in 0...5 {
                if unlockedPuzzlePacks.contains(lockOutlets[lock].tag) {
                    lockOutlets[lock].alpha = 0
                }
            }
            UserDefaults.standard.set(unlockedPuzzlePacks, forKey: "UnlockedPuzzlePacks")
        }
    }
    
    //No purchases made directly from this VC, but this function is required to meet protocols so restore purchases button works
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
    }

}

// extension to update this VC (lock icons) based on unlocking actions taken on buy puzzle VC
extension SizeSelectorViewController: buyPuzzlesViewDelegateProtocol {
    func updateLockedPuzzlePacks() {
        unlockedPuzzlePacks = UserDefaults.standard.array(forKey: "UnlockedPuzzlePacks") as! [Int]
        for lock in 0...5 {
            if unlockedPuzzlePacks.contains(lockOutlets[lock].tag) {
                lockOutlets[lock].alpha = 0
            }
        }
    }
}
