//
//  SplashScreenViewController.swift
//  SwappingCollectionView
//
//  Created by Rumana Nazmul on 24/5/17.
//  Copyright © 2017 Paweł Łopusiński. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {

  
    
    @IBOutlet weak var titleLbl: UILabel!
    
   
    @IBOutlet weak var myImgView: UIImageView!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            myImgView.loadGif(name: "4")
            
            UIView.animate(withDuration: 4) {
            self.titleLbl.alpha = 1
           }
            
            perform(#selector(SplashScreenViewController.showNavFunc), with: nil, afterDelay: 6)
        }
        
        func showNavFunc(){
            print("Ahsan")
            performSegue(withIdentifier: "ShowNavView", sender: nil)
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
        
}
