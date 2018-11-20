//
//  ECCoffeeShopCellViewModel.swift
//  EnvoyCoffee
//
//  Created by Goran Tokovic on 11/19/18.
//  Copyright © 2018 Goran Tokovic. All rights reserved.
//

import Foundation

class ECCoffeeShopCellViewModel {
    private var venue : ECVenue?
    
    init(venue: ECVenue?) {
        self.venue = venue
    }
    
    func imageURLString(imageHeight height: Int, completionBlock:((_ url: String?) -> Void)?){
        if let venueID = venue?.id{
            ECBaseService.shared.baseGetService(url: ECQueryBuilder.detailsQuery(venueID)) { (error, response) in
                if error == nil{
                    if let dict = response as? [String: Any], let response = dict["response"] as? [String:Any]{
                        if let venueDict = response["venue"] as? [String:Any]{
                            let venue = ECVenue.init(fromDictionary: venueDict)
                            if let prefix = venue.bestPhoto?.prefix, let suffix = venue.bestPhoto?.suffix{
                                let imageURL =  prefix + "\(height)x\(height)" + suffix
                                
                                DispatchQueue.main.async {
                                    return completionBlock?(imageURL)
                                }
                            }
                        }
                    }
                    DispatchQueue.main.async {
                        return completionBlock?(nil)
                    }
                }else{
                    DispatchQueue.main.async {
                        return completionBlock?(nil)
                    }

                }
                
            }
        }
    }
    
    func name() -> String{
        if let name = venue?.name{
            return name
        }
        return ""
    }
    
    func formattedAddress() -> String{
        if let formattedAddress = venue?.location?.formattedAddress{
            var result = ""
            for temp in formattedAddress{
                result += (temp + ", ")
            }
            return result
        }
        return ""
    }
}
