//
//  DetailsVC-UI.swift
//  Pokedex
//
//  Created by Tyler Reinecke on 2/11/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit

extension DetailsVC {
    /*
    //Put UI vars here//
    var pokemon : Pokemon!
    
    let pokePic : UIImageView!
    let numLabel : UILabel!
    let numLabel : UILabel!
    let speciesLabel : UILabel!
    let healthLabel : UILabel!
    let attackLabel : UILabel!
    let defenseLabel : UILabel!
    let spAttackLabel : UILabel!
    let spDefenseLabel : UILabel!
    let speedLabel : UILabel!
    let types : UILabel!
    let webButton : UIButton!
    let addFavoritesButton : UIBarButtonItem!
    */
    
    func initUI() {
        self.title = "Details"
        
        addFavoritesButton = UIBarButtonItem(image: UIImage(named: "addFavorites"), style: .plain, target: self, action: #selector(addFavsPressed))
        webButton = UIBarButtonItem(image: UIImage(named: "wwwIcon"), style: .plain, target: self, action: #selector(loadWebSearch))
        self.navigationItem.rightBarButtonItems = [addFavoritesButton, webButton]
        
        pokePic = PokeImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        pokePic.imageFromServerURL(pokemon.imageUrl, placeHolder: UIImage(named: "questionImage"))
        pokePic.center = CGPoint(x: view.frame.width / 2, y: 195)
        view.addSubview(pokePic)
        
        
        
        nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        nameLabel.text = pokemon.name
        nameLabel.font = UIFont.boldSystemFont(ofSize: 40.0)
        nameLabel.textAlignment = .center
        nameLabel.center = CGPoint(x: view.frame.width / 2, y: pokePic.frame.maxY + 35)
        view.addSubview(nameLabel)
        
        speciesLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 30))
        speciesLabel.text = pokemon.species
        speciesLabel.font = UIFont.systemFont(ofSize: 25.0)
        speciesLabel.textAlignment = .center
        speciesLabel.center = CGPoint(x: view.frame.width / 2, y: nameLabel.frame.maxY + 20)
        view.addSubview(speciesLabel)
        
        if pokemon.species == "" {
            let splitNameArray = pokemon.name.split(separator: " ", maxSplits: 1).map(String.init)
            nameLabel.text = splitNameArray[0]
            speciesLabel.text = splitNameArray[1]
        }
        
        numLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 30))
        numLabel.text = "#\(pokemon.number!)"
        numLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        numLabel.textColor = UIColor.gray
        numLabel.textAlignment = .center
        numLabel.center = CGPoint(x: view.frame.width / 2, y: speciesLabel.frame.maxY + 20)
        view.addSubview(numLabel)
        
        healthLabel = UILabel(frame: CGRect(x: 0, y: numLabel.frame.maxY + 120, width: view.frame.width, height: 30))
        healthLabel.text = "HP: \(pokemon.health!)"
        healthLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        healthLabel.textAlignment = .center
        view.addSubview(healthLabel)
        
        attackLabel = UILabel(frame: CGRect(x: 0, y: healthLabel.frame.maxY + 10, width: view.frame.width, height: 30))
        attackLabel.text = "ATK: \(pokemon.attack!)"
        attackLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        attackLabel.textAlignment = .center
        view.addSubview(attackLabel)
        
        defenseLabel = UILabel(frame: CGRect(x: 0, y: attackLabel.frame.maxY + 10, width: view.frame.width, height: 30))
        defenseLabel.text = "DEF: \(pokemon.defense!)"
        defenseLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        defenseLabel.textAlignment = .center
        view.addSubview(defenseLabel)
        
        spAttackLabel = UILabel(frame: CGRect(x: 0, y: defenseLabel.frame.maxY + 10, width: view.frame.width, height: 30))
        spAttackLabel.text = "SPA: \(pokemon.specialAttack!)"
        spAttackLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        spAttackLabel.textAlignment = .center
        view.addSubview(spAttackLabel)
        
        spDefenseLabel = UILabel(frame: CGRect(x: 0, y: spAttackLabel.frame.maxY + 10, width: view.frame.width, height: 30))
        spDefenseLabel.text = "SPD: \(pokemon.specialDefense!)"
        spDefenseLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        spDefenseLabel.textAlignment = .center
        view.addSubview(spDefenseLabel)
        
        speedLabel = UILabel(frame: CGRect(x: 0, y: spDefenseLabel.frame.maxY + 10, width: view.frame.width, height: 30))
        speedLabel.text = "SPE: \(pokemon.speed!)"
        speedLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        speedLabel.textAlignment = .center
        view.addSubview(speedLabel)
    }
}
