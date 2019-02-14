//
//  DetailsVC.swift
//  Pokedex
//
//  Created by Tyler Reinecke on 2/10/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit
import WebKit

class DetailsVC: UIViewController {
    
    //Put UI vars here//
    var pokemon : Pokemon!
    
    var pokePic : PokeImageView!
    var nameLabel : UILabel!
    var numLabel : UILabel!
    var speciesLabel : UILabel!
    var healthLabel : UILabel!
    var attackLabel : UILabel!
    var defenseLabel : UILabel!
    var spAttackLabel : UILabel!
    var spDefenseLabel : UILabel!
    var speedLabel : UILabel!
    var types : UILabel!
    var webButton : UIBarButtonItem!
    var addFavoritesButton : UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        initUI()
        
    }
    
    @objc func addFavsPressed() {
        if !Constants.favorites.contains(where: {$0.number == self.pokemon.number}) {
            Constants.favorites.append(pokemon)
        }
    }
    
    @objc func loadWebSearch() {
        guard let safeName = pokemon.name!.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            return
        }
        let urlString = "https://google.com/search?q=\(safeName)"
        guard let url = URL(string: urlString) else {
            return
        }
        UIApplication.shared.open(url)
    }
}
