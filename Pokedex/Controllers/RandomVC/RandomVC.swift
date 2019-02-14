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

        // Do any additional setup after loading the view.
        PopulateRandom.populateRandom()
        initUI()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
