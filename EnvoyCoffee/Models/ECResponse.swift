//
//	ECResponse.swift
//
//	Create by Goran Tokovic on 19/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ECResponse : NSObject, NSCoding{

	var venues : [ECVenue]?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		venues = [ECVenue]()
		if let venuesArray = dictionary["venues"] as? [[String:Any]]{
			for dic in venuesArray{
				let value = ECVenue(fromDictionary: dic)
				venues?.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if let venues = venues{
			var dictionaryElements = [[String:Any]]()
			for venuesElement in venues {
				dictionaryElements.append(venuesElement.toDictionary())
			}
			dictionary["venues"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         venues = aDecoder.decodeObject(forKey :"venues") as? [ECVenue]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if venues != nil{
			aCoder.encode(venues, forKey: "venues")
		}

	}

}
