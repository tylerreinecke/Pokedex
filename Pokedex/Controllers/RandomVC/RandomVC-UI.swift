//
//  ViewController.swift
//  Pokedex
//
//  Created by Tyler Reinecke on 2/14/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit

extension RandomVC {

    func initUI() {
        setupViewSelect()
        setupTableView()
        setupCollectionView()
        view.addSubview(ranTableView)
        self.navigationController?.navigationBar.tintColor = Constants.reddish
        self.tabBarController?.tabBar.tintColor = Constants.reddish
    }
    
    func setupTableView() {
        ranTableView = UITableView(frame: CGRect(x: 0, y: viewSelect.frame.maxY, width: view.frame.width, height: view.frame.height - 30))
        ranTableView.register(PokeTCell.self,forCellReuseIdentifier: "pokeCell")
        ranTableView.delegate = self
        ranTableView.dataSource = self
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        ranCollectionView = UICollectionView(frame: CGRect(x: 0, y: viewSelect.frame.maxY + 5, width: view.frame.width, height: view.frame.height - 30), collectionViewLayout: layout)
        ranCollectionView.register(PokeCCell.self, forCellWithReuseIdentifier: "pokeCCell")
        ranCollectionView.delegate = self
        ranCollectionView.dataSource = self
        ranCollectionView.backgroundColor = .white
        ranCollectionView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }
    
    @objc func selectView() {
        if viewSelect.selectedSegmentIndex == 0 {
            view.addSubview(ranTableView)
            ranCollectionView.removeFromSuperview()
        } else {
            view.addSubview(ranCollectionView)
            ranTableView.removeFromSuperview()
        }
    }
    
    func setupViewSelect() {
        viewSelect = UISegmentedControl(items: ["Table", "Grid"])
        viewSelect.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        viewSelect.center = CGPoint(x: view.frame.width / 2, y: 115)
        viewSelect.selectedSegmentIndex = 0
        viewSelect.addTarget(self, action: #selector(selectView), for: .valueChanged)
        viewSelect.tintColor = Constants.reddish
        view.addSubview(viewSelect)
    }
}
