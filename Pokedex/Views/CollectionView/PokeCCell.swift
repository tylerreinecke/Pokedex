//
//  PokeCCell.swift
//  Pokedex
//
//  Created by Tyler Reinecke on 2/12/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit

class PokeCCell: UICollectionViewCell {
    
    var nameLabel : UILabel!
    var nameTypeLabel : UILabel!
    var pokePic : PokeImageView!
    var size : CGSize!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func initCellFrom(size: CGSize) {
        self.size = size
        
        pokePic = PokeImageView(frame: CGRect(x: 0, y: 0, width: size.width - 10 , height: size.width - 10))
        pokePic.center = CGPoint(x: size.width / 2, y: size.height / 2 - 30)
        contentView.addSubview(pokePic)
        
        nameLabel = UILabel(frame: CGRect(x: 0, y: pokePic.frame.maxY, width: size.width, height: 20))
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.boldSystemFont(ofSize: 14.0)
        contentView.addSubview(nameLabel)
    }
    
    func updatePokemon(to newPokemon: Pokemon) {
        let splitNameArray = newPokemon.name.split(separator: " ", maxSplits: 1).map(String.init)
        nameLabel.text = splitNameArray[0]
        pokePic.imageFromServerURL(newPokemon.imageUrl, placeHolder: UIImage(named: "questionImage")) //change default image
    }
    
    
}
