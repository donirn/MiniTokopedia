//
//  ViewController.swift
//  MiniTokopedia
//
//  Created by Doni on 2017-09-01.
//  Copyright © 2017 Doni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let networkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        networkManager.getProducts{products in
            for product in products.values{
                print("name: \(product.name) | price: \(product.price) | image: \(product.imageUri)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

