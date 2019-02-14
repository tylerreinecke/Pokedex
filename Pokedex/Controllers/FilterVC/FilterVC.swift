//
//  FilterVC.swift
//  Pokedex
//
//  Created by Tyler Reinecke on 2/14/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit

class FilterVC: UIViewController {
    
    var minHealth : Int!
    var minAttack : Int!
    var minDefense : Int!
    
    var healthLabel : UILabel!
    var attackLabel: UILabel!
    var defenseLabel : UILabel!
    
    var setHealth : UITextField!
    var setAttack : UITextField!
    var setDefense : UITextField!
    
    var typeTableView : UITableView!
    
    var filterResults : UIButton!
    
    var type : String!
    var selectedTypes = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        minHealth = 0
        minAttack = 0
        minDefense = 0
        selectedTypes = [String]()
    }
    
}
