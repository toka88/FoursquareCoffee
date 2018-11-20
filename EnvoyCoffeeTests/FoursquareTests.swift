//
//  FoursquareTests.swift
//  EnvoyCoffeeTests
//
//  Created by Goran Tokovic on 11/19/18.
//  Copyright © 2018 Goran Tokovic. All rights reserved.
//

import XCTest

class FoursquareTests: XCTestCase {
    var foursquareJSON: [String: Any]!
    
    override func setUp() {
        super.setUp()
        let foursquarePath = Bundle.init(for: type(of: self)).path(forResource: "FoursquareCoffee", ofType: "json")!
        let data = try! Data.init(contentsOf: URL.init(fileURLWithPath: foursquarePath))
        foursquareJSON = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String : Any]
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testParsing() {
        
        let foursquareModel = ECFoursquare.init(fromDictionary: foursquareJSON)
        
        XCTAssertEqual(foursquareModel.meta?.code, 200)
        XCTAssertEqual(foursquareModel.meta?.requestId, "5bf303f79fb6b75dc6fcdfbd")
        
        XCTAssertEqual(foursquareModel.response?.venues?.count, 1)
        
        guard let venue = foursquareModel.response?.venues?[0] else {
            XCTFail("No venue parsed")
            return
        }
        XCTAssertEqual(venue.id, "4a844f01f964a5203bfc1fe3")
        XCTAssertEqual(venue.name, "Philz Coffee")
        XCTAssertEqual(venue.location?.address, "201 Berry St")
        XCTAssertEqual(venue.location?.crossStreet, "at 4th St")
        XCTAssertEqual(venue.location?.lat, 37.775835)
        XCTAssertEqual(venue.location?.lng, -122.393461)
        XCTAssertEqual(venue.location?.distance, 388)
        XCTAssertEqual(venue.location?.postalCode, "94158")
        XCTAssertEqual(venue.location?.cc, "US")
        XCTAssertEqual(venue.location?.neighborhood, "Mission Bay")
        XCTAssertEqual(venue.location?.city, "San Francisco")
        XCTAssertEqual(venue.location?.state, "CA")
        XCTAssertEqual(venue.location?.country, "United States")
        XCTAssertEqual(venue.location?.formattedAddress?.count, 3)
        guard  let category = venue.categories?[0] else {
            XCTFail("No categories parsed")
            return
        }
        XCTAssertEqual(category.id, "4bf58dd8d48988d1e0931735")
        XCTAssertEqual(category.name, "Coffee Shop")
        XCTAssertEqual(category.shortName, "Coffee Shop")
        XCTAssertEqual(category.pluralName, "Coffee Shops")
        XCTAssertEqual(category.icon?.prefix, "https://ss3.4sqi.net/img/categories_v2/food/coffeeshop_")
        XCTAssertEqual(category.icon?.suffix, ".png")
        XCTAssertEqual(category.primary, true)
        XCTAssertEqual(venue.referralId, "v-1542652919")
        XCTAssertEqual(venue.hasPerk, false)
    }

}
