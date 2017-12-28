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
     
     Hello there! Please jump down to func viewDidLoad() function to follow along. Explanations are provided sequentially!
     
     -you can assign "associated value of type" for your enum case. Associated values may vary depending on instance of your case (think 1:many relationship)
     --Champion.Kalista is an Int, Champion.Caitlyn is a Double, Akali is a String, and Sona is a tuple of (Int, String, String, String)
     -multiple enum cases may appear in same line, separated by a comma

     -syntax for referencing the enum.
     -syntax for assigning the enumType via associated value
     
     -enums have an alternative to associated value types -> raw value types
     -rawChampion has raw value type of String with default(implicit) values of its property name.
     -you can override the default raw values like so

     ->>Implicitly Assigned raw values
     -enums of a default value will default to a starting value of 0 and increment each subsequent entry
     -NOTE: if you assign a case with an already-implicitly-assigned value, Swift will not compile
     -enum.case should only have one raw value for every (think 1:1 relationship)
     
     
     -tempChampion is inferred to be of type Champion so we can reassign its value without prefix

     -you can match functions to enums with a switch Statement.
     
     -to shorten enum Champion and func championPosition, you can use computed properties in enums. Please look at enum ChampionAlternative
     
     */
    
    enum Champion{
        case Akali(String)
        case Kalista(Int), Vayne, Caitlyn(Double), Khazix, Lee_Sin, Darius
        case Sona(Int, String, String, String)
        case Janna
        
        static let allValues:[Any] = [Akali, Kalista, Vayne, Caitlyn, Khazix, Lee_Sin, Darius, Sona, Janna]
    }

    enum RawChampionString: String{
        case Ezreal
        case Xayah, Ornn
        case Shen = "Custom String for Shen"
    }
    
    enum RawChampionInt:Int{
        case Zac, Jax, Tahm_Kench, Miss_Fortune, Sejuani
        case Alistar = 99, Vladimir, Leona
    }
    
    func printAllChampion(){
        let _ = Champion.allValues.map{print($0)}
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
        case .Shen:
            print(".\(input) has explicit rawValue of: \"\(input.rawValue)\"")
        default:
            print(".\(input) has default rawValue of: \"\(input.rawValue)\"")
        }
    }

    func rawChampionInt(for input: RawChampionInt){
        switch input{
        case .Zac, .Jax, .Tahm_Kench, .Miss_Fortune, .Sejuani:
            print(".\(input) has default rawValue of: \(input.rawValue)")
        default:
            print(".\(input) has explicit rawValue of: \(input.rawValue)")
        }
    }
    
    //Alternative to Champion + championPosition
    enum ChampionAlternative{
        case Akali(String)
        case Kalista(Int), Vayne, Caitlyn(Double), Khazix, Lee_Sin, Darius
        case Sona(Int, String, String, String)
        case Janna
        
        static let allValues:[Any] = [Akali, Kalista, Vayne, Caitlyn, Khazix, Lee_Sin, Darius, Sona, Janna]
        
        var championPosition: String {
            switch self{
            case .Darius:
                return "Top"
            case .Akali:
                return "Mid"
            case .Kalista, .Vayne, .Caitlyn:
                return "Attack Damage Carry"
            default:
                return "Support"
            }
        }
        
    }


    
    override func viewDidLoad() {
        print(Champion.Akali)
        print(Champion.Akali("someString"))

        var tempChampion = Champion.Kalista(3)
        print(tempChampion)
        
        tempChampion = .Sona(3, "String1", "String2", "lastStringOfTuple")
        let tempChampion1 = Champion.Sona(4, "DifferentSona", "2", "last")
        print(tempChampion)
        print(tempChampion1)

        print("---------------------\nprintAllChampion Call:\n---------------------")
        printAllChampion()

        print("---------------------\nchampionPosition Call:\n---------------------")
        championPositions(for: .Vayne)
        championPositions(for: .Janna)
        championPositions(for: .Darius)

        print("---------------------\nrawChampionString Call:\n---------------------")
        rawChampionString(for: .Ezreal)
        rawChampionString(for: .Shen)
        rawChampionString(for: .Ornn)
        
        print("---------------------\nrawChampionInt Call:\n---------------------")
        rawChampionInt(for: .Zac)
        rawChampionInt(for: .Jax)
        rawChampionInt(for: .Tahm_Kench)
        rawChampionInt(for: .Miss_Fortune)
        rawChampionInt(for: .Sejuani)
        rawChampionInt(for: .Alistar)
        rawChampionInt(for: .Vladimir)
        rawChampionInt(for: .Leona)
        
        print("\nYou may get your enum.propertyName via rawValue like so:")
        guard let tempEnum = RawChampionInt(rawValue: 4) else {return}
        print("RawChampionInt(rawValue: 4) is \(tempEnum)")
        
        print("\nyou can get assign your championPosition as a computed property so that it can dynamically obtain a value like so:")
        print("ChampionAlternative.Caitlyn(4.0).championPosition is \( ChampionAlternative.Caitlyn(4.0).championPosition)")
        print("ChampionAlternative.Daruys.championPosition is \( ChampionAlternative.Darius.championPosition)")

        
        
        
    }
    
}

