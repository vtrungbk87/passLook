//
//  Extensions.swift
//  youtubeFeed
//
//  Created by Van Trung on 3/9/17.
//  Copyright © 2017 Van Trung. All rights reserved.
//

import UIKit

extension UIView{
    func addContrainsWithFormat (format: String, views: UIView...){
        var viewDictionary = [String : UIView]()
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            viewDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewDictionary))
    }
}

extension UIColor{
    static func rgb (red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

let imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView{
    
    var imageUrlString: String?
    
    func loadImageUsingUrlString(urlString: String){
        
        imageUrlString = urlString

        image = UIImage(named: "loading_image")
        
        let url = URL(string: urlString)
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage{
            self.image = imageFromCache
            return
        }
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, err) in
            if err != nil{
                print (err ?? "")
                return
            }
            DispatchQueue.main.async {
                let imageToCache = UIImage(data: data!)
                imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)

                if self.imageUrlString == urlString{
                    self.image = imageToCache
                }
            }
        }).resume()
    }
}


