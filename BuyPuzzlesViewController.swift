//
//  BuyPuzzlesViewController.swift
//  Lynk
//
//  Created by Andrew Shepherd on 2018-08-29.
//  Copyright © 2020 Blue Oak Apps. All rights reserved.
//

import UIKit
import AVFoundation
import StoreKit

protocol buyPuzzlesViewDelegateProtocol {
    func updateLockedPuzzlePacks()
}

class BuyPuzzlesViewController: UIViewController, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    //variables and outlets
    var buyPuzzlesViewDelegate: buyPuzzlesViewDelegateProtocol!
    var sizePuzzlePackChoosen = UserDefaults.standard.integer(forKey: "SizePackChoice")
    var unlockedPuzzlePacks : [Int] = UserDefaults.standard.array(forKey: "UnlockedPuzzlePacks") as! [Int]
    var volumeChoice = UserDefaults.standard.bool(forKey: "Volume")

    @IBOutlet weak var buyPuzzlesOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //stlying VC buttons
        buyPuzzlesOutlet.titleLabel?.textAlignment = .center
        
        //loading product list from app store
        if(SKPaymentQueue.canMakePayments()) {
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
    
    //dismiss VC if no unlock button choosen
    @IBAction func cancelAction(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    //unlocks puzzle pack if real money used and updates lock icons
    @IBAction func unlockRealMoneyAction(_ sender: UIButton) {
        if sizePuzzlePackChoosen == 102 {
            for product in list {
                let prodID = product.productIdentifier
                if(prodID == "com.blueoakapps.Lynk.unlockpuzzlepack102") {
                    p = product
                    buyProduct()
                }
            }
        } else if sizePuzzlePackChoosen == 103 {
            for product in list {
                let prodID = product.productIdentifier
                if(prodID == "com.blueoakapps.Lynk.unlockpuzzlepack103") {
                    p = product
                    buyProduct()
                }
            }
        } else if sizePuzzlePackChoosen == 104 {
            for product in list {
                let prodID = product.productIdentifier
                if(prodID == "com.blueoakapps.Lynk.unlockpuzzlepack104") {
                    p = product
                    buyProduct()
                }
            }
        }
        else if sizePuzzlePackChoosen == 105 {
            for product in list {
                let prodID = product.productIdentifier
                if(prodID == "com.blueoakapps.Lynk.unlockpuzzlepack105") {
                    p = product
                    buyProduct()
                }
            }
        } else if sizePuzzlePackChoosen == 106 {
            for product in list {
                let prodID = product.productIdentifier
                if(prodID == "com.blueoakapps.Lynk.unlockpuzzlepack106") {
                    p = product
                    buyProduct()
                }
            }
        } else if sizePuzzlePackChoosen == 107 {
            for product in list {
                let prodID = product.productIdentifier
                if(prodID == "com.blueoakapps.Lynk.unlockpuzzlepack107") {
                    p = product
                    buyProduct()
                }
            }
        }
    }
    
    func buyProduct() {
        let pay = SKPayment(product: p)
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().add(pay as SKPayment)
    }
    
    func unlocksWithMoney() {
        unlockedPuzzlePacks.append(sizePuzzlePackChoosen)
        UserDefaults.standard.set(unlockedPuzzlePacks, forKey: "UnlockedPuzzlePacks")
        playSound(playSoundFile: "unlock")
        buyPuzzlesViewDelegate.updateLockedPuzzlePacks()
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    var list = [SKProduct]()
    var p = SKProduct()
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        let myProduct = response.products
        for product in myProduct {
            list.append(product)
            
            //obtaining local currency symbol
            let currencyCode = product.priceLocale.currencyCode
            var currencySymbol = "$"
            
            if currencyCode! == "CAD" || currencyCode == "USD" {
                currencySymbol = "$"
            } else if currencyCode! == "CNY" || currencyCode == "JPY" {
                currencySymbol = "¥"
            } else if currencyCode! == "EUR" {
                currencySymbol = "€"
            } else if currencyCode! == "GBP" {
                currencySymbol = "£"
            } else if currencyCode! == "CHF" {
                currencySymbol = "CHF"
            } else if currencyCode! == "DKK" || currencyCode! == "NOK" || currencyCode! == "SEK"{
                currencySymbol = "kr"
            } else {
                currencySymbol = "$"
            }

            //updating button text to include local pricing and currency symbol
            if currencySymbol == "€" || currencySymbol == "kr" {
                buyPuzzlesOutlet.setTitle("\(product.price) \(currencySymbol)", for: .normal)
            } else {
                buyPuzzlesOutlet.setTitle("\(currencySymbol)\(product.price)", for: .normal)
            }
        }
        buyPuzzlesOutlet.isEnabled = true
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction: AnyObject in transactions {
            let trans = transaction as! SKPaymentTransaction
            switch trans.transactionState {
            case .purchased:
                unlocksWithMoney()
                queue.finishTransaction(trans)
            case .failed:
                print("buy error")
                queue.finishTransaction(trans)
                break
            default:
                print("Default")
                break
            }
        }
    }
}
