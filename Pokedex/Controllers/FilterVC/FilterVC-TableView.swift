//
//  ViewController.swift
//  Pokedex
//
//  Created by Tyler Reinecke on 2/14/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit

extension FilterVC: UITableViewDataSource, UITableViewDelegate {

    func height(for index: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return height(for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.allTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "typeCell") as! TypeCell
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        cell.awakeFromNib()
        cell.initCellFrom(size: CGSize(width: tableView.frame.width, height: height(for: indexPath)))
        type = Constants.allTypes[indexPath.row]
        cell.updateLabel(type)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTypes.append(Constants.allTypes[indexPath.row])
    }
    
    

}
