//
//	ECFoursquare.swift
//
//	Create by Goran Tokovic on 19/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ECFoursquare : NSObject, NSCoding{

	var meta : ECMeta?
	var response : ECResponse?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let metaData = dictionary["meta"] as? [String:Any]{
			meta = ECMeta(fromDictionary: metaData)
		}
		if let responseData = dictionary["response"] as? [String:Any]{
			response = ECResponse(fromDictionary: responseData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if meta != nil{
            dictionary["meta"] = meta?.toDictionary()
		}
		if response != nil{
            dictionary["response"] = response?.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         meta = aDecoder.decodeObject(forKey: "meta") as? ECMeta
         response = aDecoder.decodeObject(forKey: "response") as? ECResponse

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if meta != nil{
			aCoder.encode(meta, forKey: "meta")
		}
		if response != nil{
			aCoder.encode(response, forKey: "response")
		}

	}

}
