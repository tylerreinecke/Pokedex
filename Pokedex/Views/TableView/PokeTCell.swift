//
//  PokeCell.swift
//  Pokedex
//
//  Created by Tyler Reinecke on 2/11/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit

class PokeTCell: UITableViewCell {
    
    var nameLabel : UILabel!
    var nameTypeLabel : UILabel!
    var numLabel : UILabel!
    var pokePic : PokeImageView!
    var size : CGSize!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func initCellFrom(size: CGSize) {
        self.size = size
        pokePic = PokeImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        pokePic.center = CGPoint(x: 45, y: size.height / 2)
        contentView.addSubview(pokePic)
        
        numLabel = UILabel(frame: CGRect(x: size.width - 70, y: 0, width: 60, height: size.height))
        numLabel.textAlignment = .right
        numLabel.textColor = UIColor.gray
        contentView.addSubview(numLabel)
        
        nameLabel = UILabel(frame: CGRect(x: pokePic.frame.maxX + 10, y: 0, width: numLabel.frame.minX - (pokePic.frame.maxX + 10), height: 50))
        nameLabel.textAlignment = .left
        
        contentView.addSubview(nameLabel)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updatePokemon(to newPokemon: Pokemon) {
        
        let splitNameArray = newPokemon.name.split(separator: " ", maxSplits: 1).map(String.init)
        if splitNameArray.count > 1 {
            nameLabel = UILabel(frame: CGRect(x: pokePic.frame.maxX + 10, y: 0, width: numLabel.frame.minX - (pokePic.frame.maxX + 10), height: 50))
            nameLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
            nameLabel.text = splitNameArray[0]
            contentView.addSubview(nameLabel)
            
            nameTypeLabel = UILabel(frame: CGRect(x: pokePic.frame.maxX + 10, y: nameLabel.frame.maxY - 10, width: numLabel.frame.minX - (pokePic.frame.maxX + 10), height: 25))
            nameTypeLabel.textAlignment = .left
            nameTypeLabel.text = splitNameArray[1]
            contentView.addSubview(nameTypeLabel)
        } else {
            nameLabel = UILabel(frame: CGRect(x: pokePic.frame.maxX + 10, y: 0, width: numLabel.frame.minX - (pokePic.frame.maxX + 10), height: size.height))
            nameLabel.text = splitNameArray[0]
            nameLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
            contentView.addSubview(nameLabel)
        }
        
        numLabel.text = "#\(newPokemon.number!)"
        pokePic.imageFromServerURL(newPokemon.imageUrl, placeHolder: UIImage(named: "questionImage")) //change default image
    }
}
