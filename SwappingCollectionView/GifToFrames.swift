//
//  GifToFrames.swift
//  SwappingCollectionView
//
//  Created by Rumana Nazmul on 12/6/17.
//  Copyright © 2017 Paweł Łopusiński. All rights reserved.
//

import Foundation
import UIKit
import ImageIO
import MobileCoreServices

var allowedNumberofFrames: [Int]  = [8, 12, 16]

class GifToFrames{
    var actualGif: String
    var myImgArray: [UIImage] = []
    var imgCount: Int = 0
   
    init(selectedGif: String) {
        self.actualGif = selectedGif
        GifToFramesSplitter()
    }
    
    func GifToFramesSplitter()
    {
        let bundle = Bundle.main
        let tempImg = self.actualGif
        let imgWithoutExt = tempImg.replacingOccurrences(of: ".gif", with: "")
        
        let path = bundle.path(forResource: imgWithoutExt, ofType: "gif")
        
        guard let data = NSData(contentsOf: NSURL.fileURL(withPath: path!)) else {
            return
        }
        
        let cgImgSource = CGImageSourceCreateWithData(data, nil)
        self.imgCount = CGImageSourceGetCount(cgImgSource!)
        print("img count: \(imgCount)")
        
        
        for i in 0..<imgCount {
            if let image = CGImageSourceCreateImageAtIndex(cgImgSource!, i, nil) {
                myImgArray.append(UIImage(cgImage: image)) // converting a CGImage to Image and append it to ImageArray
            }
        }
    }
    func FrameSelectionLogic() -> Int {
        print (imgCount)
        print(myGameLevel)
        // add check for myGameLevel
        
        let temp =  imgCount/allowedNumberofFrames[myGameLevel-1]
        return temp
    }
    
    func SelectedFrames() -> [UIImage] {
        var selectedFrames: [UIImage] = []
        let takeFrame = FrameSelectionLogic()
        var counter:Int = 0
        
        for i in 1..<(imgCount-1) {
            
            if i%takeFrame == 0 {
                print(i)
                selectedFrames.append(myImgArray[i])
                counter = counter + 1
            }
        }
        print (counter)
        return selectedFrames
    }
    

    
}
