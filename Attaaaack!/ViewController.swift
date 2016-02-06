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
    
    var player1: Player!
    var player2: Player!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGame()
       
    }
    
    func startGame() {
        
        
        player1 = Player(name: "PopOp23", hp: 110, attackPwr: 20)
        
        player2 = Player(name: "Knii46", hp: 110, attackPwr: 20)
        
        player1HpLbl.text = "\(player1.hp) HP"
        player2HpLbl.text = "\(player2.hp) HP"
        
        if player1Img.hidden == true{
            player1Img.hidden = false
            
        }
        
        if player2Img.hidden == true {
            player2Img.hidden = false
        }
        
    }
    
    func startGameAgain() {
    
        NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: "startGame", userInfo: nil, repeats: false)
        
       
    
        
    }
    

    @IBAction func player1AttackTapped(sender: AnyObject) {
       
        if player2.attenptAttack(player1.attackPwr) {
            printLbl.text = "\(player1.name) Attacked \(player2.name) for \(player1.attackPwr) HP"
            player2HpLbl.text = "\(player2.hp) HP"
        } else {
            printLbl.text = "Attack was unsuccesful"
        }
        
        if !player2.isAlive {
            player2HpLbl.text = ""
            printLbl.text = "\(player1.name) killed \(player2.name)"
            player2Img.hidden = true
           
            startGameAgain()
            
        }
        
       
        
    }
    
    
  
    @IBAction func player2AttackTapped(sender: AnyObject) {
        
        if player1.attenptAttack(player2.attackPwr) {
            printLbl.text = "\(player2.name) attacked \(player1.name) for \(player2.attackPwr) HP"
            player1HpLbl.text = "\(player1.hp) HP"
        } else {
            printLbl.text = "Attack was unsuccessful"
        }
        
        if !player1.isAlive {
            player1HpLbl.text = ""
            printLbl.text = "\(player2.name) killed \(player1.name)"
            player1Img.hidden = true
            
            startGameAgain()
            
        }
        
}
 
    @IBAction func playAgainTapped(sender: AnyObject) {
        
        
    }

}

