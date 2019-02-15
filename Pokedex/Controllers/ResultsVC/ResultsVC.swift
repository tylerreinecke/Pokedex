//
//  ResultsVC.swift
//  Pokedex
//
//  Created by Tyler Reinecke on 2/11/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit

class ResultsVC: UIViewController {

    var pokemon : Pokemon!
    
    var types = [String]()
    var filteredList = [Pokemon]()
    
    var resTableView : UITableView!
    var resCollectionView : UICollectionView!
    var cellSize : CGSize!
    
    var resViewSelect : UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Results"
        
        initUI()
    }
}
