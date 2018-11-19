//
//	ECIcon.swift
//
//	Create by Goran Tokovic on 19/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ECIcon : NSObject, NSCoding{

	var prefix : String?
	var suffix : String?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		prefix = dictionary["prefix"] as? String
		suffix = dictionary["suffix"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if prefix != nil{
			dictionary["prefix"] = prefix
		}
		if suffix != nil{
			dictionary["suffix"] = suffix
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         prefix = aDecoder.decodeObject(forKey: "prefix") as? String
         suffix = aDecoder.decodeObject(forKey: "suffix") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if prefix != nil{
			aCoder.encode(prefix, forKey: "prefix")
		}
		if suffix != nil{
			aCoder.encode(suffix, forKey: "suffix")
		}

	}

}
