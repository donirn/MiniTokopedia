//
//  FilterViewController.swift
//  MiniTokopedia
//
//  Created by Doni on 2017-09-02.
//  Copyright © 2017 Doni. All rights reserved.
//

import UIKit
import RangeSeekSlider

class FilterViewController: UIViewController {
    @IBOutlet weak var minPriceLabel: UILabel!
    @IBOutlet weak var maxPriceLabel: UILabel!
    @IBOutlet weak var priceSlider: RangeSeekSlider!
    
    var delegate: FilterViewControllerDelegate?
    
    var minPrice = 100
    var maxPrice = 8000000
    var wholesale = true
    var official = true
    var gold = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        priceSlider.delegate = self
    }
    
    @IBAction func closeButtonDidTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func applyButtonDidTapped(_ sender: Any) {
        let searchParameters = SearchParameters(page: 0, minPrice: minPrice, maxPrice: maxPrice, wholesale: wholesale, official: official, gold: gold)
        delegate?.filterViewController(self, didApply: searchParameters)
        dismiss(animated: true, completion: nil)
    }
}

extension FilterViewController: RangeSeekSliderDelegate{
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
        minPriceLabel.text = "Rp \(Int(minValue))"
        maxPriceLabel.text = "Rp \(Int(maxValue))"
        minPrice = Int(minValue)
        maxPrice = Int(maxValue)
    }
}

protocol FilterViewControllerDelegate {
    func filterViewController(_ filterVC: FilterViewController, didApply searchParameters: SearchParameters)
}
