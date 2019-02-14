//
//  FavoritesVC.swift
//  Pokedex
//
//  Created by Tyler Reinecke on 2/11/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit

class FavoritesVC: UIViewController {
  
    var favTableView : UITableView!
    var pokemon : Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Favorites"
        
        setupTableView()
       
        // Do any additional setup after loading the view.
    }
}
