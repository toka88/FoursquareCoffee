//
//  ECCoffeeListViewModel.swift
//  EnvoyCoffee
//
//  Created by Goran Tokovic on 11/19/18.
//  Copyright © 2018 Goran Tokovic. All rights reserved.
//

import Foundation

class ECCoffeeListViewModel: NSObject {
    var foursquare: ECFoursquare?
    
    func fetchDataFromServer(_ completionBlock:((_ success: Bool) -> Void)?){
        ECBaseService.shared.baseGetService(url: ECQueryBuilder.getEnvoyCoffeeShopsCompleteQuery()) { (error, response) in
            if error == nil{
                if let response = response as? [String: Any]{
                    self.foursquare = ECFoursquare.init(fromDictionary: response)
                }
                DispatchQueue.main.async {
                        completionBlock?(true)
                }
            }else{
                DispatchQueue.main.async {
                    completionBlock?(true)
                }
            }
        }
    }
    
    func coffeeShopsNumber()->Int{
        guard let venues = foursquare?.response?.venues else {
            return 0
        }
        return venues.count
    }
    
    func dataModelForCell(atIndex index: Int) -> ECCoffeeShopCellViewModel{
        if let venues = foursquare?.response?.venues, venues.count > index{
            return ECCoffeeShopCellViewModel.init(venue: venues[index])
        }
        return ECCoffeeShopCellViewModel.init(venue: nil)
    }
}
