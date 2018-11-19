//
//	ECLocation.swift
//
//	Create by Goran Tokovic on 19/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ECLocation : NSObject, NSCoding{

	var address : String?
	var cc : String?
	var city : String?
	var country : String?
	var crossStreet : String?
	var distance : Int?
	var formattedAddress : [String]?
	var labeledLatLngs : [ECLabeledLatLng]?
	var lat : Float?
	var lng : Float?
	var neighborhood : String?
	var postalCode : String?
	var state : String?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		address = dictionary["address"] as? String
		cc = dictionary["cc"] as? String
		city = dictionary["city"] as? String
		country = dictionary["country"] as? String
		crossStreet = dictionary["crossStreet"] as? String
		distance = dictionary["distance"] as? Int
		formattedAddress = dictionary["formattedAddress"] as? [String]
		labeledLatLngs = [ECLabeledLatLng]()
		if let labeledLatLngsArray = dictionary["labeledLatLngs"] as? [[String:Any]]{
			for dic in labeledLatLngsArray{
				let value = ECLabeledLatLng(fromDictionary: dic)
				labeledLatLngs?.append(value)
			}
		}
		lat = dictionary["lat"] as? Float
		lng = dictionary["lng"] as? Float
		neighborhood = dictionary["neighborhood"] as? String
		postalCode = dictionary["postalCode"] as? String
		state = dictionary["state"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if address != nil{
			dictionary["address"] = address
		}
		if cc != nil{
			dictionary["cc"] = cc
		}
		if city != nil{
			dictionary["city"] = city
		}
		if country != nil{
			dictionary["country"] = country
		}
		if crossStreet != nil{
			dictionary["crossStreet"] = crossStreet
		}
		if distance != nil{
			dictionary["distance"] = distance
		}
		if formattedAddress != nil{
			dictionary["formattedAddress"] = formattedAddress
		}
		if labeledLatLngs != nil{
			var dictionaryElements = [[String:Any]]()
            if let labeledLatLngs = labeledLatLngs{
                for labeledLatLngsElement in labeledLatLngs {
                    dictionaryElements.append(labeledLatLngsElement.toDictionary())
                }
            }
			dictionary["labeledLatLngs"] = dictionaryElements
		}
		if lat != nil{
			dictionary["lat"] = lat
		}
		if lng != nil{
			dictionary["lng"] = lng
		}
		if neighborhood != nil{
			dictionary["neighborhood"] = neighborhood
		}
		if postalCode != nil{
			dictionary["postalCode"] = postalCode
		}
		if state != nil{
			dictionary["state"] = state
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         address = aDecoder.decodeObject(forKey: "address") as? String
         cc = aDecoder.decodeObject(forKey: "cc") as? String
         city = aDecoder.decodeObject(forKey: "city") as? String
         country = aDecoder.decodeObject(forKey: "country") as? String
         crossStreet = aDecoder.decodeObject(forKey: "crossStreet") as? String
         distance = aDecoder.decodeObject(forKey: "distance") as? Int
         formattedAddress = aDecoder.decodeObject(forKey: "formattedAddress") as? [String]
         labeledLatLngs = aDecoder.decodeObject(forKey :"labeledLatLngs") as? [ECLabeledLatLng]
         lat = aDecoder.decodeObject(forKey: "lat") as? Float
         lng = aDecoder.decodeObject(forKey: "lng") as? Float
         neighborhood = aDecoder.decodeObject(forKey: "neighborhood") as? String
         postalCode = aDecoder.decodeObject(forKey: "postalCode") as? String
         state = aDecoder.decodeObject(forKey: "state") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if address != nil{
			aCoder.encode(address, forKey: "address")
		}
		if cc != nil{
			aCoder.encode(cc, forKey: "cc")
		}
		if city != nil{
			aCoder.encode(city, forKey: "city")
		}
		if country != nil{
			aCoder.encode(country, forKey: "country")
		}
		if crossStreet != nil{
			aCoder.encode(crossStreet, forKey: "crossStreet")
		}
		if distance != nil{
			aCoder.encode(distance, forKey: "distance")
		}
		if formattedAddress != nil{
			aCoder.encode(formattedAddress, forKey: "formattedAddress")
		}
		if labeledLatLngs != nil{
			aCoder.encode(labeledLatLngs, forKey: "labeledLatLngs")
		}
		if lat != nil{
			aCoder.encode(lat, forKey: "lat")
		}
		if lng != nil{
			aCoder.encode(lng, forKey: "lng")
		}
		if neighborhood != nil{
			aCoder.encode(neighborhood, forKey: "neighborhood")
		}
		if postalCode != nil{
			aCoder.encode(postalCode, forKey: "postalCode")
		}
		if state != nil{
			aCoder.encode(state, forKey: "state")
		}

	}

}
