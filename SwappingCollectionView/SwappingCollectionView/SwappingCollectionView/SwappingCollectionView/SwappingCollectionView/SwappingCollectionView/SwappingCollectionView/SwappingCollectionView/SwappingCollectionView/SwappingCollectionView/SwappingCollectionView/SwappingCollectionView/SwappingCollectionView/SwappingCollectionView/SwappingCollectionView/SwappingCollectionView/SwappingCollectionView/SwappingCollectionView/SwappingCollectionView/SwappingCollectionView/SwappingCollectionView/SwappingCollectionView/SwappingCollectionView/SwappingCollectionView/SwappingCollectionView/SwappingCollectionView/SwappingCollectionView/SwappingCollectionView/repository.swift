//
//  repository.swift
//  SwappingCollectionView
//
//  Created by Rumana Nazmul on 26/5/17.
//  Copyright © 2017 Paweł Łopusiński. All rights reserved.
//

import UIKit

class repository{

    var currentLevel: Int = 1
    var allImages = [String]()
    var beginner =  [String]()
    var intermediate  =  [String]()
    var advanced =  [String]()
    
    init(gameLevel: Int) {
        self.currentLevel = gameLevel
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
    
    func splitToCorrespondingArrays(){
        for i in 0..<allImages.count{
            print("Image Name : \(allImages[i])")
        }
    }
    func loadAllImages(){
        allImages.append("1.gif")
        allImages.append("2.gif")
        allImages.append("3.gif")
        allImages.append("4.gif")
        allImages.append("5.gif")
        allImages.append("6.gif")
        allImages.append("7.gif")
        allImages.append("8.gif")
        
        splitToCorrespondingArrays()
        
    }

}
