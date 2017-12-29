//
//  Structs.swift
//  EnumDemo
//
//  Created by Admin on 12/28/17.
//  Copyright © 2017 MAC. All rights reserved.
//

import Foundation

struct Person:Codable{
    var name:String
    var height:String
    var mass:String
    var hair_color:String
    var skin_color:String
    var eye_color:String
    var birth_year:String
    var gender:String
    var homeworld:String
    var films:[String]
    var species:[String]
    var vehicles:[String]
    var starships:[String]
    var created:String
    var edited:String
    var url:String
}

struct Starship:Codable{
    var name:String
    var model:String
    var manufacturer:String
    var cost_in_credits:String
    var length:String
    var max_atmosphering_speed:String
    var crew:String
    var passengers:String
    var cargo_capacity:String
    var consumables:String
    var hyperdrive_rating:String
    var MGLT:String
    var starship_class:String
    var pilots:[String]
    var films:[String]
    var created:String
    var edited:String
    var url:String
}

struct Specie:Codable{
    var name:String
    var classification:String
    var designation:String
    var average_height:String
    var skin_colors:String
    var hair_colors:String
    var eye_colors:String
    var average_lifespan:String
    var homeworld:String? //LOL sneaky bastard
    var language:String
    var people: [String]
    var films:[String]
    var created:String
    var edited:String
    var url:String
}
