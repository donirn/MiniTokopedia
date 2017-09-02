//
//  NetworkManager.swift
//  MiniTokopedia
//
//  Created by Doni on 2017-09-01.
//  Copyright © 2017 Doni. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class NetworkManager: NSObject {
    private var isLoadingProducts = false
    
    func getProducts(page: Int, completionHandler: @escaping (ProductCollection)->()){
        let url = "https://ace.tokopedia.com/search/v2.5/product?q=samsung&pmin=10000&pmax=100000&wholesale=true&official=true&fshop=2&start=\(page*10)&rows=10"
        
        if !isLoadingProducts{
            isLoadingProducts = true
            Alamofire.request(url).validate().responseJSON { (response) in
                switch response.result{
                case .success(let value):
                    let json = JSON(value)
                    let products = ProductCollection(fromJSON: json["data"])
                    completionHandler(products)
                case .failure(let error):
                    print(error)
                }
                self.isLoadingProducts = false
            }
        }
    }
    
    func getProductImage(url: String, completionHandler: @escaping (UIImage?)->()){
        Alamofire.request(url).responseImage { response in
            if let image = response.result.value{
                completionHandler(image)
            } else {
                completionHandler(nil)
            }
        }
    }
}
