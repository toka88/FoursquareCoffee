//
//  ECBestPhoto.swift
//  EnvoyCoffee
//
//  Created by Goran Tokovic on 11/19/18.
//  Copyright © 2018 Goran Tokovic. All rights reserved.
//

import Foundation

class ECBestPhoto : NSObject, NSCoding{
    
    var createdAt : Int?
    var height : Int?
    var id : String?
    var prefix : String?
    var suffix : String?
    var visibility : String?
    var width : Int?
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        createdAt = dictionary["createdAt"] as? Int
        height = dictionary["height"] as? Int
        id = dictionary["id"] as? String
        prefix = dictionary["prefix"] as? String
        suffix = dictionary["suffix"] as? String
        visibility = dictionary["visibility"] as? String
        width = dictionary["width"] as? Int
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if createdAt != nil{
            dictionary["createdAt"] = createdAt
        }
        if height != nil{
            dictionary["height"] = height
        }
        if id != nil{
            dictionary["id"] = id
        }
        if prefix != nil{
            dictionary["prefix"] = prefix
        }
        if suffix != nil{
            dictionary["suffix"] = suffix
        }
        if visibility != nil{
            dictionary["visibility"] = visibility
        }
        if width != nil{
            dictionary["width"] = width
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        createdAt = aDecoder.decodeObject(forKey: "createdAt") as? Int
        height = aDecoder.decodeObject(forKey: "height") as? Int
        id = aDecoder.decodeObject(forKey: "id") as? String
        prefix = aDecoder.decodeObject(forKey: "prefix") as? String
        suffix = aDecoder.decodeObject(forKey: "suffix") as? String
        visibility = aDecoder.decodeObject(forKey: "visibility") as? String
        width = aDecoder.decodeObject(forKey: "width") as? Int
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "createdAt")
        }
        if height != nil{
            aCoder.encode(height, forKey: "height")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if prefix != nil{
            aCoder.encode(prefix, forKey: "prefix")
        }
        if suffix != nil{
            aCoder.encode(suffix, forKey: "suffix")
        }
        if visibility != nil{
            aCoder.encode(visibility, forKey: "visibility")
        }
        if width != nil{
            aCoder.encode(width, forKey: "width")
        }
        
    }
    
}
