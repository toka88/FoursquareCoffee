//
//	ECVenue.swift
//
//	Create by Goran Tokovic on 19/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ECVenue : NSObject, NSCoding{

	var categories : [ECCategory]?
	var hasPerk : Bool?
	var id : String?
	var location : ECLocation?
	var name : String?
	var referralId : String?
	var venuePage : ECVenuePage?
    var bestPhoto : ECBestPhoto?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		categories = [ECCategory]()
		if let categoriesArray = dictionary["categories"] as? [[String:Any]]{
			for dic in categoriesArray{
				let value = ECCategory(fromDictionary: dic)
				categories?.append(value)
			}
		}
		hasPerk = dictionary["hasPerk"] as? Bool
		id = dictionary["id"] as? String
		if let locationData = dictionary["location"] as? [String:Any]{
			location = ECLocation(fromDictionary: locationData)
		}
		name = dictionary["name"] as? String
		referralId = dictionary["referralId"] as? String
		if let venuePageData = dictionary["venuePage"] as? [String:Any]{
			venuePage = ECVenuePage(fromDictionary: venuePageData)
		}
        
        if let bestPhotoData = dictionary["bestPhoto"] as? [String:Any]{
            bestPhoto = ECBestPhoto(fromDictionary: bestPhotoData)
        }
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if let categories = categories{
			var dictionaryElements = [[String:Any]]()
			for categoriesElement in categories {
				dictionaryElements.append(categoriesElement.toDictionary())
			}
			dictionary["categories"] = dictionaryElements
		}
		if hasPerk != nil{
			dictionary["hasPerk"] = hasPerk
		}
		if id != nil{
			dictionary["id"] = id
		}
		if location != nil{
            dictionary["location"] = location?.toDictionary()
		}
		if name != nil{
			dictionary["name"] = name
		}
		if referralId != nil{
			dictionary["referralId"] = referralId
		}
		if venuePage != nil{
            dictionary["venuePage"] = venuePage?.toDictionary()
		}
        
        if bestPhoto != nil{
            dictionary["bestPhoto"] = bestPhoto?.toDictionary()
        }
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         categories = aDecoder.decodeObject(forKey :"categories") as? [ECCategory]
         hasPerk = aDecoder.decodeObject(forKey: "hasPerk") as? Bool
         id = aDecoder.decodeObject(forKey: "id") as? String
         location = aDecoder.decodeObject(forKey: "location") as? ECLocation
         name = aDecoder.decodeObject(forKey: "name") as? String
         referralId = aDecoder.decodeObject(forKey: "referralId") as? String
         venuePage = aDecoder.decodeObject(forKey: "venuePage") as? ECVenuePage
        bestPhoto = aDecoder.decodeObject(forKey: "bestPhoto") as? ECBestPhoto

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if categories != nil{
			aCoder.encode(categories, forKey: "categories")
		}
		if hasPerk != nil{
			aCoder.encode(hasPerk, forKey: "hasPerk")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if location != nil{
			aCoder.encode(location, forKey: "location")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if referralId != nil{
			aCoder.encode(referralId, forKey: "referralId")
		}
		if venuePage != nil{
			aCoder.encode(venuePage, forKey: "venuePage")
		}
        if bestPhoto != nil{
            aCoder.encode(bestPhoto, forKey: "bestPhoto")
        }
	}

}
