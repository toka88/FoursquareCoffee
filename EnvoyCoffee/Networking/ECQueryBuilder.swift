//
//  ECQuesryBuilder.swift
//  EnvoyCoffee
//
//  Created by Goran Tokovic on 11/19/18.
//  Copyright © 2018 Goran Tokovic. All rights reserved.
//

import Foundation
import UIKit

fileprivate let foursquareBaseURL = "https://api.foursquare.com/v2/venues/"
fileprivate let clientID = "LTHKH0VWY0CTEAMY4DJYNRAE5UNXEZQ5OWZ5YET2GK21QHEW"
fileprivate let clientSecret = "D01GIO3UC3PMHOK4ZANHNPPHYWJIGPXZTM0ZA4RXZAP0P0PD"
fileprivate let kVersion = "20181119"

class ECQueryBuilder: NSObject {
    
    class func foursquareSearchURL() -> String{
        return String.init(format: "%@search", foursquareBaseURL)
    }
    
    class func authorizedQuery()->String{
        return String.init(format: "client_id=%@&client_secret=%@&v=%@", clientID, clientSecret, kVersion)
    }
    
    class func getEnvoyCoffeeShopsCompleteQuery() -> String{
        return ECQueryBuilder.foursquareSearchURL() + "?" + ECQueryBuilder.authorizedQuery() + "&ll=37.775176,-122.397800" + "&limit=15" + "&query=coffee"
    }
    
    class func detailsQuery(_ id:String) -> String{
        return String.init(format: "%@%@?", foursquareBaseURL,id) + ECQueryBuilder.authorizedQuery()
    }
}
