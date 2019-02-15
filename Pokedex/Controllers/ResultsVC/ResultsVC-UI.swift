//
//  ResultsVC-UI.swift
//  Pokedex
//
//  Created by Tyler Reinecke on 2/11/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit

extension ResultsVC {

    func initUI() {
        setupViewSelect()
        setupTableView()
        setupCollectionView()
        view.addSubview(resTableView)
        self.navigationController?.navigationBar.tintColor = Constants.reddish
        self.tabBarController?.tabBar.tintColor = Constants.reddish
    }
    
    func setupTableView() {
        resTableView = UITableView(frame: CGRect(x: 0, y: resViewSelect.frame.maxY, width: view.frame.width, height: view.frame.height - 30))
        resTableView.register(PokeTCell.self,forCellReuseIdentifier: "pokeCell")
        resTableView.delegate = self
        resTableView.dataSource = self
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        resCollectionView = UICollectionView(frame: CGRect(x: 0, y: resViewSelect.frame.maxY + 5, width: view.frame.width, height: view.frame.height - 30), collectionViewLayout: layout)
        resCollectionView.register(PokeCCell.self, forCellWithReuseIdentifier: "pokeCCell")
        resCollectionView.delegate = self
        resCollectionView.dataSource = self
        resCollectionView.backgroundColor = .white
        resCollectionView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }
    
    @objc func selectView() {
        if resViewSelect.selectedSegmentIndex == 0 {
            view.addSubview(resTableView)
            resCollectionView.removeFromSuperview()
        } else {
            view.addSubview(resCollectionView)
            resTableView.removeFromSuperview()
        }
    }
    
    func setupViewSelect() {
        resViewSelect = UISegmentedControl(items: ["Table", "Grid"])
        resViewSelect.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        resViewSelect.center = CGPoint(x: view.frame.width / 2, y: 115)
        resViewSelect.selectedSegmentIndex = 0
        resViewSelect.addTarget(self, action: #selector(selectView), for: .valueChanged)
        resViewSelect.tintColor = Constants.reddish
        view.addSubview(resViewSelect)
    }
}
