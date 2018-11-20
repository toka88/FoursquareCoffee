//
//  ECCofeeListViewModel.swift
//  EnvoyCoffeeTests
//
//  Created by Goran Tokovic on 11/19/18.
//  Copyright © 2018 Goran Tokovic. All rights reserved.
//

import XCTest

class ECCoffeeListViewModelTests: XCTestCase {
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

    func testCoffeeShopNumber() {
        let viewModel = ECCoffeeListViewModel()
        viewModel.foursquare = ECFoursquare.init(fromDictionary: foursquareJSON)
        XCTAssertEqual(viewModel.coffeeShopsNumber(), 1)
    }
}
