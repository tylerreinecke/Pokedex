//
//  FilterVCdfd.swift
//  Pokedex
//
//  Created by Tyler Reinecke on 2/14/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit

extension FilterVC {
    
    func initUI() {
        setupAttack()
        setupHealth()
        setupDefense()
        setupTypeTableView()
        setupFilterButton()
        self.navigationController?.navigationBar.tintColor = Constants.reddish
        self.tabBarController?.tabBar.tintColor = Constants.reddish
        
    }
    
    func setupHealth() {
        self.minHealth = 0

        setHealth = UITextField(frame: CGRect(x: 50, y: 115, width: 150, height: 40))
        setHealth.center = CGPoint(x: setAttack.frame.minX / 2, y: setAttack.frame.midY)
        setHealth.textAlignment = .center
        setHealth.adjustsFontSizeToFitWidth = true
        setHealth.placeholder = "Set Min HP: "
        view.addSubview(setHealth)
    }
    
    func setupAttack() {
        self.minAttack = 0
        
        setAttack = UITextField(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
        setAttack.center = CGPoint(x: view.frame.width / 2, y: 135)
        setAttack.textAlignment = .center
        setAttack.adjustsFontSizeToFitWidth = true
        setAttack.placeholder = "Set Min ATK: "
        view.addSubview(setAttack)
        
    }
    
    func setupDefense() {
        self.minDefense = 0
        
        setDefense = UITextField(frame: CGRect(x: view.frame.width - 150, y: 115, width: 150, height: 40))
        setDefense.center = CGPoint(x: setAttack.frame.maxX + ((view.frame.width - setAttack.frame.maxX) / 2), y: setAttack.frame.midY)
        setDefense.textAlignment = .center
        setDefense.adjustsFontSizeToFitWidth = true
        setDefense.placeholder = "Set Min DEF: "
        view.addSubview(setDefense)
    }
    
    func setupTypeTableView() {
        typeTableView = UITableView(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: view.frame.height - 200 - 150))
        typeTableView.register(TypeCell.self,forCellReuseIdentifier: "typeCell")
        typeTableView.delegate = self
        typeTableView.dataSource = self
        typeTableView.allowsMultipleSelection = true
        typeTableView.allowsMultipleSelectionDuringEditing = true
        view.addSubview(typeTableView)
    }
    
    func setupFilterButton() {
        filterResults = UIButton(frame: CGRect(x: 0, y: view.frame.height - 150, width: view.frame.width, height: 70))
        filterResults.setTitle("Show filtered list", for: .normal)
        filterResults.backgroundColor = Constants.reddish
        filterResults.addTarget(self, action: #selector(filter), for: .touchUpInside)
        view.addSubview(filterResults)
    }
    
    @objc func filter() {
        adjustValues()
        narrowList.narrowFilter(selectedTypes, minHealth, minAttack, minDefense)
        self.performSegue(withIdentifier: "toFilteredResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? ResultsVC {
            nextVC.types = selectedTypes
        }
    }

    func adjustValues() {
        if let newMinHealth = Int(setHealth.text!) {
            minHealth = newMinHealth
        }
        if let newMinAttack = Int(setAttack.text!) {
            minAttack = newMinAttack
        }
        if let newMinDefense = Int(setDefense.text!) {
            minDefense = newMinDefense
        }
    }

}
