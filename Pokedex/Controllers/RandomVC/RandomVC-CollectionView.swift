//
//  ViewController.swift
//  Pokedex
//
//  Created by Tyler Reinecke on 2/14/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit

extension RandomVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        self.cellSize = CGSize(width: view.frame.width / 5, height: view.frame.width / 5 + 20)
        return self.cellSize
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokeCCell", for: indexPath) as! PokeCCell
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        cell.awakeFromNib()
        cell.initCellFrom(size: self.cellSize)
        pokemon = Constants.random20[indexPath.row]
        cell.updatePokemon(to: pokemon)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pokemon = Constants.random20[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: self)
    }
}
