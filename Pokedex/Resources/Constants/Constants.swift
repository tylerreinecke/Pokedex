//
//  Constants.swift
//  Pokedex
//
//  Created by Tyler Reinecke on 2/11/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit

class Constants {
    
    static let pokemon = PokemonGenerator.getPokemonArray()
    static var filtered = [Pokemon]()
    static var favorites = [Pokemon]()
    static var random20 = [Pokemon]()
    static let imageCache = NSCache<NSString, UIImage>()
    static let allTypes = ["Normal", "Fighting", "Flying", "Poison", "Ground", "Rock", "Bug", "Ghost", "Steel", "Fire", "Water", "Grass", "Electric", "Psychic", "Ice", "Dragon", "Dark", "Fairy", "???"]
    static let reddish = UIColor(red: 195/255, green: 62/255, blue: 56/255, alpha: 1)
}

