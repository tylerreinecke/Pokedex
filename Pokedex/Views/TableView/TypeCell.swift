//
//  typeCell.swift
//  Pokedex
//
//  Created by Tyler Reinecke on 2/14/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit

class TypeCell: UITableViewCell {
    
    var typeLabel : UILabel!
    var size : CGSize!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func initCellFrom(size: CGSize) {
        self.size = size
        
        typeLabel = UILabel(frame: CGRect(x: 15, y: 10, width: size.width, height: 20))
        typeLabel.textAlignment = .left
        typeLabel.font = UIFont.systemFont(ofSize: 14.0)
        contentView.addSubview(typeLabel)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.accessoryType = selected ? .checkmark : .none
    }
    
    func updateLabel(_ type: String) {
        typeLabel.text = type
    }

}
