//
//  ProductCollection.swift
//  MiniTokopedia
//
//  Created by Doni on 2017-09-02.
//  Copyright © 2017 Doni. All rights reserved.
//

import UIKit
import SwiftyJSON

class ProductCollection: NSObject {
    var values: [Product]
    
    init(values: [Product]){
        self.values = values
    }
    
    convenience init(fromJSON json: JSON) {
        var products = [Product]()
        for productJSON in json.arrayValue{
            if let product = Product(fromJSON: productJSON){
                products.append(product)
            }
        }
        self.init(values: products)
    }
}
