//
//  RandomVC.swift
//  Pokedex
//
//  Created by Tyler Reinecke on 2/14/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit

class RandomVC: UIViewController {

    var pokemon : Pokemon!
    
    var ranTableView : UITableView!
    var ranCollectionView : UICollectionView!
    var cellSize : CGSize!
    
    var viewSelect : UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Random"

        PopulateRandom.populateRandom()
        initUI()
    }
}
