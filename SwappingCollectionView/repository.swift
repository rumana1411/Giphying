//
//  repository.swift
//  SwappingCollectionView
//
//  Created by Rumana Nazmul on 26/5/17.
//  Copyright © 2017 Paweł Łopusiński. All rights reserved.
//

import UIKit

class repository{

    var currentLevel: Int = myGameLevel
    var allImages = [String]()
    var beginner =  [String]()
    var intermediate  =  [String]()
    var advanced =  [String]()
    
    init(gameLevel: Int) {
        self.currentLevel = gameLevel
    }
    
    func getARandomImage()->String
    {
        if(allImages.count==0)
        {
            return ""
        }
        let aRndNumber: Int = Int(arc4random_uniform(UInt32(allImages.count)))
        return allImages[aRndNumber]
        
    }
    func getImageList() -> [String] {
        if currentLevel == 1 {
            return beginner
        }
        else if currentLevel == 2{
            return intermediate
        }
        else{
            return advanced
        }
        
    }
    // https://stackoverflow.com/questions/24092884/get-nth-character-of-a-string-in-swift-programming-language
    
    
    func splitToCorrespondingArrays(){
         for i in 0..<allImages.count{
            
            //print("Image Name : \(allImages[i])")
            let firstCharacter = allImages[i].characters.first;
            print("Image Name : \(firstCharacter)")
           
            if firstCharacter == "B" || firstCharacter == "b"{
                beginner.append(allImages[i])
             }
            else if firstCharacter == "I" || firstCharacter == "i"{
                intermediate.append(allImages[i])
            }
            else if firstCharacter == "A" || firstCharacter == "a"{
                advanced.append(allImages[i])
            }
        }
    }
    func loadAllImages(){
        allImages.append("b_001.gif")
        allImages.append("b_002.gif")
        allImages.append("b_003.gif")
        allImages.append("b_004.gif")
        allImages.append("i_001.gif")
        allImages.append("i_002.gif")
        allImages.append("a_001.gif")
        allImages.append("a_002.gif")
        
        splitToCorrespondingArrays()
        
    }

}
