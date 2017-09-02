//
//  ShopTypeViewController.swift
//  MiniTokopedia
//
//  Created by Doni on 2017-09-02.
//  Copyright © 2017 Doni. All rights reserved.
//

import UIKit

class ShopTypeViewController: UIViewController {
    @IBOutlet weak var goldRadioButton: UIButton!
    @IBOutlet weak var officialRadioButton: UIButton!
    
    var delegate: ShopTypeViewControllerDelegate?
    var gold: Bool!
    var official: Bool!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        goldRadioButton.setImage(#imageLiteral(resourceName: "SelectedButton"), for: .selected)
        officialRadioButton.setImage(#imageLiteral(resourceName: "SelectedButton"), for: .selected)
        
        goldRadioButton.isSelected = gold
        officialRadioButton.isSelected = official
    }
    
    @IBAction func closeButtonDidTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resetButtonDidTapped(_ sender: Any) {
        gold = true
        official = true
        goldRadioButton.isSelected = gold
        officialRadioButton.isSelected = official
    }
    
    @IBAction func goldRadioButtonDidTapped(_ sender: Any) {
        goldRadioButton.isSelected = !goldRadioButton.isSelected
        gold = goldRadioButton.isSelected
    }
    
    @IBAction func officialRadioButtonDidTapped(_ sender: Any) {
        officialRadioButton.isSelected = !officialRadioButton.isSelected
        official = officialRadioButton.isSelected
    }
    
    @IBAction func applyButtonDidTapped(_ sender: Any) {
        delegate?.showTypeViewController(self, didApplyGold: gold, official: official)
        dismiss(animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
}

protocol ShopTypeViewControllerDelegate{
    func showTypeViewController(_ shopTypeVC: ShopTypeViewController, didApplyGold gold: Bool, official: Bool)
}
