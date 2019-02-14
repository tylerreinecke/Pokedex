//
//  FavoritesVC-TableView.swift
//  Pokedex
//
//  Created by Tyler Reinecke on 2/13/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit

extension FavoritesVC : UITableViewDataSource, UITableViewDelegate{

    func height(for index: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return height(for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokeCell") as! PokeTCell
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        cell.initCellFrom(size: CGSize(width: tableView.frame.width, height: height(for: indexPath)))
        pokemon = Constants.favorites[indexPath.row]
        cell.updatePokemon(to: pokemon)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pokemon = Constants.favorites[indexPath.row]
        
        self.performSegue(withIdentifier: "toDetailsVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? DetailsVC {
            nextVC.pokemon = pokemon
        }
    }
}
