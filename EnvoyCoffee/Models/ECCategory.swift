//
//	ECCategory.swift
//
//	Create by Goran Tokovic on 19/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ECCategory : NSObject, NSCoding{

	var icon : ECIcon?
	var id : String?
	var name : String?
	var pluralName : String?
	var primary : Bool?
	var shortName : String?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let iconData = dictionary["icon"] as? [String:Any]{
			icon = ECIcon(fromDictionary: iconData)
		}
		id = dictionary["id"] as? String
		name = dictionary["name"] as? String
		pluralName = dictionary["pluralName"] as? String
		primary = dictionary["primary"] as? Bool
		shortName = dictionary["shortName"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if icon != nil{
            dictionary["icon"] = icon?.toDictionary()
		}
		if id != nil{
			dictionary["id"] = id
		}
		if name != nil{
			dictionary["name"] = name
		}
		if pluralName != nil{
			dictionary["pluralName"] = pluralName
		}
		if primary != nil{
			dictionary["primary"] = primary
		}
		if shortName != nil{
			dictionary["shortName"] = shortName
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         icon = aDecoder.decodeObject(forKey: "icon") as? ECIcon
         id = aDecoder.decodeObject(forKey: "id") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         pluralName = aDecoder.decodeObject(forKey: "pluralName") as? String
         primary = aDecoder.decodeObject(forKey: "primary") as? Bool
         shortName = aDecoder.decodeObject(forKey: "shortName") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if icon != nil{
			aCoder.encode(icon, forKey: "icon")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if pluralName != nil{
			aCoder.encode(pluralName, forKey: "pluralName")
		}
		if primary != nil{
			aCoder.encode(primary, forKey: "primary")
		}
		if shortName != nil{
			aCoder.encode(shortName, forKey: "shortName")
		}

	}

}
