//
//  ViewController.swift
//  Pokedex
//
//  Created by Tyler Reinecke on 2/14/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit

class PopulateRandom {
    
    static var inArray : Bool!

    static func populateRandom() {
        Constants.random20.removeAll()
        for _ in 0..<20 {
            self.inArray = true //defaults true in order to enter while loop to check for duplicates
            var ranPokemon = Constants.pokemon.randomElement()
            while self.inArray {
                if !Constants.random20.contains(where: {$0.number == ranPokemon!.number}) {
                    Constants.random20.append(ranPokemon!)
                    self.inArray = false
                }
                ranPokemon = Constants.pokemon.randomElement()
            }
        }
    }
}
