//
//  Character.swift
//  Attaaaack!
//
//  Created by Christella on 2/5/16.
//  Copyright © 2016 Christella. All rights reserved.
//

import Foundation

class Character {
    
    private var _hp: Int = 100
    private var _attackPwr: Int = 10
    
    var attackPwr: Int {
        return _attackPwr
    }
    
    var hp: Int {
        return _hp
    }
    
    var isAlive: Bool {
        get {
            if hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    init (startingHP: Int, attackPwr: Int) {
        self._hp = startingHP
        self._attackPwr = attackPwr
    }
    
    func attenptAttack(attackPwr: Int) -> Bool {
        self._hp -= attackPwr
        
        return true
    }
    
}