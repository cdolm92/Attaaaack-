//
//  Player.swift
//  Attaaaack!
//
//  Created by Christella on 2/5/16.
//  Copyright © 2016 Christella. All rights reserved.
//

import Foundation

class Player: Character {
    private var _name = "Player"
    
    var name: String {
        return _name
    }
    
    convenience init(name:String, hp: Int, attackPwr: Int) {
        self.init(startingHP: hp, attackPwr: attackPwr)
        
        _name = name
    }
}