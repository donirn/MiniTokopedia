//
//  NetworkManager.swift
//  MiniTokopedia
//
//  Created by Doni on 2017-09-01.
//  Copyright © 2017 Doni. All rights reserved.
//

import UIKit
import Alamofire

class NetworkManager: NSObject {
    func getProducts(){
        let url = "https://ace.tokopedia.com/search/v2.5/product?q=samsung&pmin=10000&pmax=100000&wholesale=true&official=true&fshop=2&start=0&rows=10"
        Alamofire.request(url).responseJSON { (response) in
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
        }
    }
}
