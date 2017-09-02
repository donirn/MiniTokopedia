//
//  SearchParameters.swift
//  MiniTokopedia
//
//  Created by Doni on 2017-09-02.
//  Copyright © 2017 Doni. All rights reserved.
//

import UIKit

class SearchParameters: NSObject, NSCopying {
    var page: Int
    var minPrice: Int
    var maxPrice: Int
    var wholesale: Bool
    var official: Bool
    var gold: Bool
    
    init(page: Int, minPrice: Int, maxPrice: Int, wholesale: Bool, official: Bool, gold: Bool) {
        self.page = page
        self.minPrice = minPrice
        self.maxPrice = maxPrice
        self.wholesale = wholesale
        self.official = official
        self.gold = gold
    }
    
    override init(){
        self.page = 0
        self.minPrice = 100
        self.maxPrice = 8000000
        self.wholesale = true
        self.official = true
        self.gold = true
    }
    
    func nextPage() -> SearchParameters{
        return SearchParameters(page: page + 1, minPrice: minPrice, maxPrice: maxPrice, wholesale: wholesale, official: official, gold: gold)
    }
    
    func nextPageLoaded(){
        self.page += 1
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = SearchParameters(page: page, minPrice: minPrice, maxPrice: maxPrice, wholesale: wholesale, official: official, gold: gold)
        return copy
    }
}
