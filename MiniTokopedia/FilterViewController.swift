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
    var searchParameters: SearchParameters!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        priceSlider.delegate = self
    }
    
    @IBAction func closeButtonDidTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func applyButtonDidTapped(_ sender: Any) {
        searchParameters.page = 0
        delegate?.filterViewController(self, didApply: searchParameters)
        dismiss(animated: true, completion: nil)
    }
}

extension FilterViewController: RangeSeekSliderDelegate{
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
        minPriceLabel.text = "Rp \(Int(minValue))"
        maxPriceLabel.text = "Rp \(Int(maxValue))"
        searchParameters.minPrice = Int(minValue)
        searchParameters.maxPrice = Int(maxValue)
    }
}

protocol FilterViewControllerDelegate {
    func filterViewController(_ filterVC: FilterViewController, didApply searchParameters: SearchParameters)
}
