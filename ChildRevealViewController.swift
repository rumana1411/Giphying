//
//  ChildRevealViewController.swift
//  SwappingCollectionView
//
//  Created by Rumana Nazmul on 13/7/17.
//  Copyright © 2017 Paweł Łopusiński. All rights reserved.
//

import UIKit

class ChildRevealViewController: SWRevealViewController, SWRevealViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        self.rearViewRevealWidth = 180  // Controls the width of the sec menu
        self.rearViewRevealOverdraw = 20
        self.bounceBackOnOverdraw = false
        self.stableDragOnOverdraw = true
        self.rearViewRevealDisplacement = 0
        
        self.tapGestureRecognizer()
        self.panGestureRecognizer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
