//
//  HomeViewController.swift
//  SwappingCollectionView
//
//  Created by Rumana Nazmul on 24/5/17.
//  Copyright © 2017 Paweł Łopusiński. All rights reserved.
//

import UIKit
//var areImageLoaded = false
//var myGameLevel = 2
//var imageLibrary = repository(gameLevel: myGameLevel)

class HomeViewController: UIViewController {
    
    var menuShowing = false
    
    
    @IBOutlet weak var LeadConsTopMenu: NSLayoutConstraint!
  
    @IBOutlet weak var trailConsTopMenu: NSLayoutConstraint!
    
    @IBOutlet weak var topMenuView: GradView!
    
   
    @IBAction func menuLineButton(_ sender: UIButton) {
        
        if menuShowing == false{
            
            self.LeadConsTopMenu.constant = 180
            self.trailConsTopMenu.constant = 0
            
        }
            
        else{
            
            self.LeadConsTopMenu.constant = 0
            self.trailConsTopMenu.constant = 0
            
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        
        menuShowing = !menuShowing

        
    }
    @IBAction func albumButton(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowAlbum", sender: nil)
    }
   
       
    
    @IBAction func scoreButton(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   //    if(areImageLoaded == false){
     //       imageLibrary.loadAllImages()
     //       areImageLoaded = true
      // }
        
        
        topMenuView.layer.shadowOpacity = 1
        topMenuView.layer.shadowRadius = 3
        
    }
    
    
}

