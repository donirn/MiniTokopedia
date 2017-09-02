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
    @IBOutlet weak var wholesaleSwitch: UISwitch!
    @IBOutlet weak var goldMerchantButton: UIButton!
    @IBOutlet weak var officialStoreButton: UIButton!
    @IBOutlet weak var shopTypeButton: UIButton!
    @IBOutlet weak var shopTypeButtonLeadingConstraint: NSLayoutConstraint!
    
    var delegate: FilterViewControllerDelegate?
    var searchParameters: SearchParameters!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        priceSlider.delegate = self
        
        let shopTypeButtonHorizontalPaddings = 2 * shopTypeButtonLeadingConstraint.constant
        let shopTypeButtonLeftInset = view.frame.size.width - shopTypeButtonHorizontalPaddings - #imageLiteral(resourceName: "NextButton").size.width
        shopTypeButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: shopTypeButtonLeftInset, bottom: 0, right: 0)
        
        setupUI(searchParameters: searchParameters)
    }
    
    func setupUI(searchParameters: SearchParameters){
        priceSlider.selectedMinValue = CGFloat(searchParameters.minPrice)
        priceSlider.selectedMaxValue = CGFloat(searchParameters.maxPrice)
        minPriceLabel.text = "Rp \(searchParameters.minPrice)"
        maxPriceLabel.text = "Rp \(searchParameters.maxPrice)"
        
        wholesaleSwitch.isOn = searchParameters.wholesale
        goldMerchantButton.isHidden = !searchParameters.gold
        officialStoreButton.isHidden = !searchParameters.official
    }
    
    @IBAction func closeButtonDidTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func applyButtonDidTapped(_ sender: Any) {
        searchParameters.page = 0
        delegate?.filterViewController(self, didApply: searchParameters)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func wholesaleDidSwitched(_ sender: Any) {
        searchParameters.wholesale = wholesaleSwitch.isOn
    }
    
    @IBAction func goldMerchantButtonDidTapped(_ sender: Any) {
        goldMerchantButton.isHidden = true
        searchParameters.gold = false
    }
    
    @IBAction func officialStoreButtonDidTapped(_ sender: Any) {
        officialStoreButton.isHidden = true
        searchParameters.official = false
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
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
