//
//  Helper.swift
//  SwappingCollectionView
//
//  Created by Rumana Nazmul on 14/7/17.
//  Copyright © 2017 Paweł Łopusiński. All rights reserved.
//

import Foundation

class Helper{
    
 
    
     static func SetGameLevel(){
        UserDefaults.standard.set(myGameLevel, forKey: "gameLevel") // here myList is an array of String
    }
    
    static func GetGameLevel()
    {
        let retrievedObject = UserDefaults.standard.object(forKey: "gameLevel")
        if let retrievedStringObject = retrievedObject as? Int
        {
            myGameLevel = retrievedStringObject
        }
        else{
            myGameLevel = 1
        }
    }

    
    
}
