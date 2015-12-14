//
//  JSONUtils.swift
//  LightBoxScreens
//
//  Created by Stuart Grimshaw on 14/12/15.
//  Copyright © 2015 Stuart Grimshaw. All rights reserved.
//

import Foundation

func getJSONObject(keys: [AnyObject], data: AnyObject) -> AnyObject?
{
    typealias jsonDict = [String: AnyObject]
    typealias jsonArray = [AnyObject]
    
    switch data
    {
    case is String:
        return data
    case is Int:
        return data
    case is Double:
        return data
    case is Bool:
        return data
    case is jsonDict:
        if let
            firstKeyString = keys[0] as? String,
            topObject = data[firstKeyString] where topObject != nil
        {
            return keys.count == 1 ? topObject : getJSONObject(Array(keys[1..<keys.count]), data: topObject!)
        }
    case is jsonArray:
        if let
            data = data as? jsonArray,
            index = keys[0] as? Int where index < data.count
        {
            let topObject = data[index]
            return keys.count == 1 ? topObject : getJSONObject(Array(keys[1..<keys.count]), data: topObject)
        }
    default:
        return nil
    }
    return nil
}