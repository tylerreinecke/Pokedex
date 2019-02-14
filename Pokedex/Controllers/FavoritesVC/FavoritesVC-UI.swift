//
//  FavoritesVC-UI.swift
//  Pokedex
//
//  Created by Tyler Reinecke on 2/11/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit

extension FavoritesVC {
    func setupTableView() {
        favTableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        favTableView.register(PokeTCell.self,forCellReuseIdentifier: "pokeCell")
        favTableView.delegate = self
        favTableView.dataSource = self
        view.addSubview(favTableView)
        self.navigationController?.navigationBar.tintColor = Constants.reddish
        self.tabBarController?.tabBar.tintColor = Constants.reddish
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupTableView()
    }
}
