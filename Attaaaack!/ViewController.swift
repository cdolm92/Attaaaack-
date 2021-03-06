//
//  ViewController.swift
//  Attaaaack!
//
//  Created by Christella on 2/5/16.
//  Copyright © 2016 Christella. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var printLbl: UILabel!
    
    @IBOutlet weak var player1HpLbl: UILabel!
    
    @IBOutlet weak var player2HpLbl: UILabel!
    
    @IBOutlet weak var player1Img: UIImageView!

    @IBOutlet weak var player2Img: UIImageView!
    
    @IBOutlet weak var gameOver: UILabel!
    
    @IBOutlet weak var playAgainBtn: UIButton!
    
    @IBOutlet weak var player1Btn: UIButton!
    
    @IBOutlet weak var player2Btn: UIButton!
    
    var player1: Player!
    var player2: Player!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGame()
       
    }
    
    func startGame() {
        let char1HP = Int(arc4random_uniform(UInt32(200)))
        let char2HP = Int(arc4random_uniform(UInt32(200)))
        
        
        gameOver.hidden = true
        playAgainBtn.hidden = true

        player1 = Player(name: "PopOp23", hp: char1HP, attackPwr: generateAttackPwr())
        
        player2 = Player(name: "Knii46", hp: char2HP, attackPwr: generateAttackPwr())
        
        player1HpLbl.text = "\(player1.hp) HP"
        player2HpLbl.text = "\(player2.hp) HP"
        
        if player1Img.hidden == true{
            player1Img.hidden = false
            
        }
        
        if player2Img.hidden == true {
            player2Img.hidden = false
        }
        
        printLbl.hidden = false
        player1HpLbl.hidden = false
        player2HpLbl.hidden = false
        
    }
    
    func startGameAgain() {
        NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "startGame", userInfo: nil, repeats: false)
        
}
    
    func gameIsOver() {
        printLbl.hidden = false
        player1HpLbl.hidden = true
        player2HpLbl.hidden = true
        player1Img.hidden = true
        player2Img.hidden = true
        
        gameOver.hidden = false
        playAgainBtn.hidden = false
    
    }
    
    func enableBtn() {
        if self.player2Btn.enabled == false {
            self.player2Btn.enabled = true
        }
        
        if self.player1Btn.enabled == false {
            self.player1Btn.enabled = true
        }
    }
    
    func generateAttackPwr() -> Int {
        return Int(arc4random_uniform(30))
    
    }
    

    @IBAction func player1AttackTapped(sender: AnyObject) {
        
         let newPwr = generateAttackPwr()
     
        
       self.player2Btn.enabled = false
        NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "enableBtn", userInfo: nil, repeats: false)
        
        
       if player2.attenptAttack(newPwr) {
            printLbl.text = "\(player1.name) Attacked \(player2.name) for \(newPwr) HP"
            player2HpLbl.text = "\(player2.hp) HP"
        } else {
            printLbl.text = "Attack was unsuccesful"
        }
        
        if !player2.isAlive {
            player2HpLbl.text = ""
            printLbl.text = "\(player1.name) killed \(player2.name)"
            player2Img.hidden = true
           
            gameIsOver()
            
        }
        
}
    
    
  @IBAction func player2AttackTapped(sender: AnyObject) {
   let newPwr = generateAttackPwr()
    
    
    self.player1Btn.enabled = false
    NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "enableBtn", userInfo: nil, repeats: false)

    
        if player1.attenptAttack(newPwr) {
            printLbl.text = "\(player2.name) attacked \(player1.name) for \(newPwr) HP"
            player1HpLbl.text = "\(player1.hp) HP"
        } else {
            printLbl.text = "Attack was unsuccessful"
        }
        
        if !player1.isAlive {
            player1HpLbl.text = ""
            printLbl.text = "\(player2.name) killed \(player1.name)"
            player1Img.hidden = true
            
            gameIsOver()
            
        }
        
}
 
    @IBAction func playAgainTapped(sender: AnyObject) {
        startGameAgain()
        
    }

}

