//
//  AllVC.swift
//  Pokedex
//
//  Created by Tyler Reinecke on 2/11/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    var pokemon : Pokemon!
    
    var allTableView : UITableView!
    var allCollectionView : UICollectionView!
    var cellSize : CGSize!
    
    var viewSelect : UISegmentedControl!
    var searchBar : UISearchBar!
    var filterButton : UIButton!
    var randomizeButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Pokédex"
        
        initUI()
        
    }
}
