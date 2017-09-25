//
//  SplashScreenViewController.swift
//  SwappingCollectionView
//
//  Created by Rumana Nazmul on 24/5/17.
//  Copyright © 2017 Paweł Łopusiński. All rights reserved.
//

import UIKit

var myGameLevel:Int = 1
var imageLibrary = repository(gameLevel: myGameLevel)


class SplashScreenViewController: UIViewController {

  //  @IBOutlet weak var openingImg: UIImageView!
  
   // @IBOutlet weak var openingTitleLbl: UILabel!
    @IBOutlet weak var openingImage: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
   
    @IBOutlet weak var myImgView: UIImageView!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            Helper.GetGameLevel()
            
    
             
            UIView.animate(withDuration: 1, delay:0, animations: {
                //top
                self.openingImage.alpha = 1
            }, completion: {completion in
                UIView.animate(withDuration: 1, delay:0, animations: {
                    //left
                    self.titleLbl.alpha = 1
                },  completion: {completion in
                            
                            
                        })
                    })
            
            
            perform(#selector(SplashScreenViewController.showNavFunc), with: nil, afterDelay: 3)
        }
    
        func showNavFunc(){
            performSegue(withIdentifier: "showSWView", sender: nil)
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
        
}
