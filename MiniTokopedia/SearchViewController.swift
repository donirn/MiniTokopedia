//
//  ViewController.swift
//  MiniTokopedia
//
//  Created by Doni on 2017-09-01.
//  Copyright © 2017 Doni. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let networkManager = NetworkManager()
    var products = ProductCollection(values: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let productViewCellNib = UINib(nibName: "ProductViewCell", bundle: nil)
        collectionView.register(productViewCellNib, forCellWithReuseIdentifier: "productViewCell")
        
        networkManager.getProducts{products in
            self.products = products
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

extension SearchViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return products.values.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productViewCell", for: indexPath) as? ProductViewCell{
            let product = products.values[indexPath.row]
            cell.nameLabel.text = product.name
            cell.priceLabel.text = product.price
            cell.imageView.image = #imageLiteral(resourceName: "placeholder")
            return cell
        }
        
        return UICollectionViewCell()
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout{
    private static let sectionInsets = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
    private static let minimumLineSpacing: CGFloat = 2
    private static let minimumInterItemSpacing: CGFloat = 1
    private static let itemsPerRow = 2
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = SearchViewController.sectionInsets.left +
            CGFloat(SearchViewController.itemsPerRow) * SearchViewController.minimumInterItemSpacing +
            SearchViewController.sectionInsets.right
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / CGFloat(SearchViewController.itemsPerRow)
        let heightPerItem = widthPerItem * 1.5
        
        return CGSize(width: widthPerItem, height: heightPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return SearchViewController.sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return SearchViewController.minimumLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return SearchViewController.minimumInterItemSpacing
    }
}
