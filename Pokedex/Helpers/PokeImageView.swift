//
//  PokeImageView.swift
//  Pokedex
//
//  Created by Tyler Reinecke on 2/12/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//  Credit to Anand Chandra
//

import UIKit

class PokeImageView: UIImageView {
    
    var imageURLString : String?
    
    func imageFromServerURL(_ URLString: String, placeHolder: UIImage?, _ completion: ((_ image: UIImage?) -> ())? = nil) {
        
        imageURLString = URLString
        
        self.image = placeHolder
        if let cachedImage = Constants.imageCache.object(forKey: NSString(string: URLString)) {
            self.image = cachedImage
            if let completion = completion { completion(cachedImage) }
            return
        }
        
        guard let url = URL(string: URLString) else {
            if let completion = completion { completion(nil) }
            return
        }
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
            print("RESPONSE FROM API: \(response)")
            if error != nil {
                DispatchQueue.main.async {
                    self.image = placeHolder
                }
                if let completion = completion { completion(nil) }
                return
            }
            DispatchQueue.main.async {
                guard let data = data, let downloadedImage = UIImage(data: data) else {
                    if let completion = completion { completion(nil) }
                    return
                }
                
                Constants.imageCache.setObject(downloadedImage, forKey: NSString(string: URLString))
                if self.imageURLString == URLString {
                    self.image = downloadedImage
                    if let completion = completion { completion(downloadedImage) }
                } else {
                    if let completion = completion { completion(nil) }
                }
                
            }
        }).resume()
        
    }
    
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
