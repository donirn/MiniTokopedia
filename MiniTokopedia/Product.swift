//
//  Product.swift
//  MiniTokopedia
//
//  Created by Doni on 2017-09-02.
//  Copyright © 2017 Doni. All rights reserved.
//

import UIKit
import SwiftyJSON

class Product: NSObject {
    let name: String
    let price: String
    let imageUri: String
    
    init(name: String, price: String, imageUri: String) {
        self.name = name
        self.price = price
        self.imageUri = imageUri
    }
    
    convenience init?(fromJSON json:JSON){
        if let name = json["name"].string,
            let price = json["price"].string,
            let image_uri = json["image_uri"].string{
            self.init(name: name,price: price, imageUri:image_uri)
        } else {
            return nil
        }
    }
}
