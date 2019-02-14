//
//  AllVC-UI.swift
//  Pokedex
//
//  Created by Tyler Reinecke on 2/11/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit

extension SearchVC {
    
    func initUI() {
        setupSearchBar()
        setupViewSelect()
        setupFilterButton()
        setupRandomizeButton()
        setupTableView()
        setupCollectionView()
        self.navigationController?.navigationBar.tintColor = Constants.reddish
        self.tabBarController?.tabBar.tintColor = Constants.reddish
        view.addSubview(allTableView)
    }
    
    func setupSearchBar() {
        searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: view.frame.width - 100, height: 30))
        searchBar.center = CGPoint(x: view.frame.width / 2, y: 115)
        searchBar.placeholder = "Enter a Pokémon name or number:"
        searchBar.backgroundColor = .white
        
        view.addSubview(searchBar)
        
    }
    
    func setupFilterButton() {
        filterButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width / 5, height: 30))
        filterButton.center = CGPoint(x: searchBar.frame.minX + 3, y: viewSelect.frame.midY)
        filterButton.setTitle("Filter", for: .normal)
        filterButton.layer.cornerRadius = 5
        filterButton.backgroundColor = Constants.reddish
        filterButton.addTarget(self, action: #selector(toFilter), for: .touchUpInside)
        view.addSubview(filterButton)
    }
    
    func setupRandomizeButton() {
        randomizeButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width / 5, height: 30))
        randomizeButton.center = CGPoint(x: searchBar.frame.maxX - 3, y: viewSelect.frame.midY)
        randomizeButton.setTitle("Random", for: .normal)
        randomizeButton.layer.cornerRadius = 5
        randomizeButton.backgroundColor = Constants.reddish
        randomizeButton.addTarget(self, action: #selector(randomize), for: .touchUpInside)
        view.addSubview(randomizeButton)
    }
    
    func setupViewSelect() {
        viewSelect = UISegmentedControl(items: ["Table", "Grid"])
        viewSelect.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        viewSelect.center = CGPoint(x: view.frame.width / 2, y:  150)
        viewSelect.selectedSegmentIndex = 0
        viewSelect.addTarget(self, action: #selector(selectView), for: .valueChanged)
        viewSelect.tintColor = Constants.reddish
        view.addSubview(viewSelect)
    }
    
    func setupTableView() {
        allTableView = UITableView(frame: CGRect(x: 0, y: viewSelect.frame.maxY, width: view.frame.width, height: view.frame.height - 30))
        allTableView.register(PokeTCell.self,forCellReuseIdentifier: "pokeCell")
        allTableView.delegate = self
        allTableView.dataSource = self
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        allCollectionView = UICollectionView(frame: CGRect(x: 0, y: viewSelect.frame.maxY + 5, width: view.frame.width, height: view.frame.height - 30), collectionViewLayout: layout)
        allCollectionView.register(PokeCCell.self, forCellWithReuseIdentifier: "pokeCCell")
        allCollectionView.delegate = self
        allCollectionView.dataSource = self
        allCollectionView.backgroundColor = .white
        allCollectionView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }
    
    @objc func selectView() {
        if viewSelect.selectedSegmentIndex == 0 {
            view.addSubview(allTableView)
            allCollectionView.removeFromSuperview()
        } else {
            view.addSubview(allCollectionView)
            allTableView.removeFromSuperview()
        }
    }
    
    @objc func randomize() {
        self.performSegue(withIdentifier: "toRandom", sender: self)
    }
    
    @objc func toFilter() {
        self.performSegue(withIdentifier: "toFilter", sender: self)
        //pass a copy of the master pokemon array with all the non-conforming elements removed
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? DetailsVC {
           nextVC.pokemon = self.pokemon
        }
    }
    
    
}



/*          WAY TO SORT AND FILTER ARRAYS
 let arr = [1, 2, 3, 4, 5]
 let filtered = arr.filter { (x) -> Bool in
 x > 3
 }
 */
