//
//  Networking.swift
//  EnumDemo
//
//  Created by Admin on 12/28/17.
//  Copyright © 2017 MAC. All rights reserved.
//

import Foundation
import Alamofire

// MARK: protocol extensions, enum's application in networking
/*
Enums have amazing utility for separation of concerns.
 
 
 
 */

protocol NetworkProtocol {
    func getImage(byName url:String, withType type:StructType, completion: @escaping(UIImage?, Error?) -> ())
}

enum NetworkingError:Error{
    case noResponse
    case responseError(Int) //HTTP response codes
    case noData
    case couldNotParseData //TODO: add extra for implementation for invalid json/invalid codable struct
}

enum StructType{
    case Person(Person)
    case Starship(Starship)
    case Specie(Specie)
}

//TODO: change Networking into an enum for .getImage, .getJson, .post examples
class Networking: NetworkProtocol{
    
    //guard for error, response, and data
    func getImage(byName url:String, withType type:StructType, completion: @escaping(UIImage?, Error?) -> ()){
        var myUrl = String()
        
        switch type{
        case .Person:
            myUrl = "https://raw.githubusercontent.com/sbassett1/swImages/master/\(url.replacingOccurrences(of: "/", with: "")).png"
        case .Starship:
            myUrl = "https://raw.githubusercontent.com/Zephzz/sada/master/temp/Starships/\(url.replacingOccurrences(of: "/", with: "")).png"
        case .Specie:
            myUrl = "https://raw.githubusercontent.com/Zephzz/StarwarsSpeciesImages/master/Species/\(url.replacingOccurrences(of: "/", with: "")).png"
        }
        
        guard let uurl = URL(string:myUrl) else {return}
        Alamofire.request(uurl).response { (dataResponse) in
            guard dataResponse.error == nil else {  //error
                guard let resp = dataResponse.response else {
                    //no response.
                    completion(nil, NetworkingError.noResponse)
                    return
                }
                //there is error but still has a response code
                completion(nil, NetworkingError.responseError(resp.statusCode))
                return
            }
            guard let data = dataResponse.data else {
                //no data
                completion(nil, NetworkingError.noData)
                return
            }
            //data payload
            guard let image = UIImage(data:data) else {return}
            completion(image, nil)
        }
    }
}
