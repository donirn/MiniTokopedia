//
//  NetworkManager.swift
//  MiniTokopedia
//
//  Created by Doni on 2017-09-01.
//  Copyright © 2017 Doni. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NetworkManager: NSObject {
    func getProducts(){
        let url = "https://ace.tokopedia.com/search/v2.5/product?q=samsung&pmin=10000&pmax=100000&wholesale=true&official=true&fshop=2&start=0&rows=10"
        Alamofire.request(url).validate().responseJSON { (response) in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                let products = ProductCollection(fromJSON: json["data"])
                for product in products.values{
                    print("name: \(product.name) | price: \(product.price) | image: \(product.imageUri)")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
