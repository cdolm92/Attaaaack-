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
    
    var player1: Player!
    var player2: Player!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player1 = Player(name: "PopOp23", hp: 110, attackPwr: 20)
        
        player2 = Player(name: "Knii46", hp: 110, attackPwr: 20)
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
        }
        
    }
  
    @IBAction func player2AttackTapped(sender: AnyObject) {
        
        if
        
        
    }

}

