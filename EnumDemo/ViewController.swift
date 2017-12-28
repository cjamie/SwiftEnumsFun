//
//  ViewController.swift
//  EnumDemo
//
//  Created by Admin on 12/28/17.
//  Copyright © 2017 MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /*  Enumeration Syntax:
     
     -to assign associated type of String to your Champion.Akali case
     -to declare multiple cases can appear in same line, they must be of the same associated type. These are all Int types.
     -syntax for referencing the enum.
     
     -enums have an alternative to associated value types -> raw value types
     -rawChampion has raw value type of String with default(implicit) values of its property name.
     -you can override the default raw values like so

     -tempChampion is inferred to be of type Champion so we can reassign its value without prefix

     -you can match functions to enums with a switch Statement.
     */
    
    enum Champion{
        case Akali(String)
        case Kalista(Int), Vayne, Caitlyn, Khazix, Lee_Sin, Darius
        case Sona, Janna
    }

    enum RawChampionString: String{
        case Ezreal
        case Xayah, Ornn
        case Shen = "Custom String for Shen"
    }
    
    enum RawChampionInt:Int{
        case Zac, Jax, Tahm_Kench
        case Alistar = 99
    }
    
    
    func championPositions(for input:Champion){
        switch input{
        case .Darius:
            print("Top")
        case .Akali:
            print("Mid")
        case .Kalista, .Vayne, .Caitlyn:
            print("Attack Damage Carry")
        default:
            print("Support")
        }
    }
    
    
    func rawChampionString(for input: RawChampionString){
        switch input{
        case .Ezreal:
            print("case 1: \(input.rawValue)")
        case .Shen:
            print("case 2: \(input.rawValue)")
        default:
            print ("default: \(input.rawValue)" )
        }
    }

    func rawChampionInt(for input: RawChampionInt){
        
        
    }

    
    override func viewDidLoad() {
        print(Champion.Akali)
        print(Champion.Akali("someString"))

        var tempChampion = Champion.Kalista(3)
        print(tempChampion)
        
        tempChampion = .Janna
        print(tempChampion)
        

        print("---------------------\nchampionCalls:\n---------------------")
        championPositions(for: .Vayne)
        championPositions(for: .Janna)
        championPositions(for: .Darius)

        print("---------------------\nrawChampionStringCalls:\n---------------------")
        rawChampionString(for: .Ezreal)
        rawChampionString(for: .Shen)
        rawChampionString(for: .Ornn)
        
        
    }
    
}

