//
//  narrowList.swift
//  Pokedex
//
//  Created by Tyler Reinecke on 2/14/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit

class narrowList {
    static func narrowString(_ input: String) {
        Constants.filtered.removeAll()
        for poke in Constants.pokemon {
            if input == poke.name {
                Constants.filtered.append(poke)
            }
        }
    }
    
    static func narrowNum(_ num: Int) {
        Constants.filtered.removeAll()
        for poke in Constants.pokemon {
            if num == poke.number {
                Constants.filtered.append(poke)
            }
        }
    }
    
    static func narrowFilter(_ types: [String], _ minHP: Int, _ minATK: Int, _ minDEF: Int) {
        Constants.filtered.removeAll()
        for poke in Constants.pokemon {
            for type in types {
                if poke.types.contains(type) {
                    if poke.health >= minHP && poke.attack >= minATK && poke.defense >= minDEF {
                        Constants.filtered.append(poke)
                        break
                    }
                }
            }
        }
    }
    
}
