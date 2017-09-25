//
//  RevealViewController.swift
//  SwappingCollectionView
//
//  Created by Rumana Nazmul on 13/7/17.
//  Copyright © 2017 Paweł Łopusiński. All rights reserved.
//

import UIKit


class RevealViewController: SWRevealViewController, SWRevealViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        // To keep the menu always open with the front one
        
       self.rearViewRevealWidth = 100
       self.rearViewRevealOverdraw = 20
       self.bounceBackOnOverdraw = false
        self.stableDragOnOverdraw = true
      
        // To keep the menu always open with the front one
      //self.frontViewPosition = .right
        
        //self.tapGestureRecognizer()
        self.panGestureRecognizer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - SWRevealViewController delegate
    
    // Stops closing the menu by panning

//      func revealController(_ revealController: SWRevealViewController!, willMoveTo position: FrontViewPosition) {
//            if position == FrontViewPosition.right {
//                self.frontViewController.view.isUserInteractionEnabled = false
//            }
//            else {
//                self.frontViewController.view.isUserInteractionEnabled = true
//            }
//        }
    
}
