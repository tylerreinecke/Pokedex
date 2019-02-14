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
        
        healthLabel = UILabel(frame: CGRect(x: 50, y: 115, width: 150, height: 40))
        healthLabel.center = CGPoint(x: attackLabel.frame.minX / 2, y: attackLabel.frame.midY)
        healthLabel.textAlignment = .center
        healthLabel.text = "Min HP: \(minHealth!)"
        view.addSubview(healthLabel)
        
        setHealth = UITextField(frame: CGRect(x: healthLabel.frame.minX, y: healthLabel.frame.maxY + 10, width: healthLabel.frame.width, height: healthLabel.frame.height))
        setHealth.center = CGPoint(x: healthLabel.frame.midY, y: healthLabel.frame.maxY + 20)
        setHealth.adjustsFontSizeToFitWidth = true
        setHealth.placeholder = "Set Min HP: "
        view.addSubview(setHealth)
    }
    
    func setupAttack() {
        self.minAttack = 0
        
        attackLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
        attackLabel.center = CGPoint(x: view.frame.width / 2, y: 135)
        attackLabel.textAlignment = .center
        attackLabel.text = "Min ATK: \(minAttack!)"
        view.addSubview(attackLabel)
        
        setAttack = UITextField(frame: CGRect(x: attackLabel.frame.minX, y: attackLabel.frame.maxY + 10, width: attackLabel.frame.width, height: attackLabel.frame.height))
        setAttack.center = CGPoint(x: attackLabel.frame.midY, y: attackLabel.frame.maxY + 20)
        setAttack.adjustsFontSizeToFitWidth = true
        setAttack.placeholder = "Set Min ATK: "
        view.addSubview(setAttack)
        
    }
    
    func setupDefense() {
        self.minDefense = 0
        
        defenseLabel = UILabel(frame: CGRect(x: view.frame.width - 150, y: 115, width: 150, height: 40))
        defenseLabel.center = CGPoint(x: attackLabel.frame.maxX + ((view.frame.width - attackLabel.frame.maxX) / 2), y: attackLabel.frame.midY)
        defenseLabel.textAlignment = .center
        defenseLabel.text = "Min DEF: \(minDefense!)"
        view.addSubview(defenseLabel)
        
        setDefense = UITextField(frame: CGRect(x: defenseLabel.frame.minX, y: defenseLabel.frame.maxY + 10, width: defenseLabel.frame.width, height: defenseLabel.frame.height))
        setDefense.center = CGPoint(x: defenseLabel.frame.midY, y: defenseLabel.frame.maxY + 20)
        setDefense.adjustsFontSizeToFitWidth = true
        setDefense.placeholder = "Set Min DEF: "
        view.addSubview(setDefense)
    }
    
    func setupTypeTableView() {
        typeTableView = UITableView(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: view.frame.height - 200 - 70))
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
        self.performSegue(withIdentifier: "toFilteredResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? ResultsVC {
            nextVC.types = selectedTypes
        }
    }
}
