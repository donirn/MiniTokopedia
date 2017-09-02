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
    
    func getProducts(parameters: SearchParameters, completionHandler: @escaping (ProductCollection)->()){
        let fshop = parameters.gold ? "2" : "0"
        let url = "https://ace.tokopedia.com/search/v2.5/product?q=samsung&pmin=\(parameters.minPrice)&pmax=\(parameters.maxPrice)&wholesale=\(parameters.wholesale)&official=\(parameters.official)&fshop=\(fshop)&start=\(parameters.page*10)&rows=10"
        
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
