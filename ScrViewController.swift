//
//  ScrViewController.swift
//  SwappingCollectionView
//
//  Created by Rumana Nazmul on 24/6/17.
//  Copyright © 2017 Paweł Łopusiński. All rights reserved.
//

import UIKit

class ScrViewController: UIViewController {

    // Set the button type as Custom in storyborad MUST
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // The following code add a button with Back.png as barbutton
        
        // let button = UIButton.init(type: .custom)
         backButton.frame = CGRect.init(x: 10, y: 20, width: 30, height: 30) //CGRectMake(0, 0, 30, 30)
         backButton.setImage(UIImage.init(named: "Back.png"), for: UIControlState.normal)
         backButton.addTarget(self, action:#selector(back), for: UIControlEvents.touchUpInside)
        
        // *The following code is used to add a button to take it back to the BackTableViewController (Menu)*
        // button.addTarget(revealViewController(), action:#selector(SWRevealViewController.revealToggle(_:)), for: UIControlEvents.touchUpInside)
        // button.addTarget(revealViewController(), action:#selector(back), for: UIControlEvents.touchUpInside)
        
//         button.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30) //CGRectMake(0, 0, 30, 30)
//         let backButton = UIBarButtonItem.init(customView: button)  // button is added to barbutton
//         self.navigationItem.leftBarButtonItem = backButton  // Added to navigation item
      
      
       
        //* the following code can be used to add barbutton directly (Without adding a custom button), but cannot customize the image*
       // navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(back))
       // navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named:"Back"), style: .plain, target: self, action: #selector(back))
      //  navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        
        
 
     
    }
    
    func back() {
        
      //  print("BAckBack")
        let nc = revealViewController().rearViewController as? UINavigationController
        let frontNVC = (nc?.topViewController as? RearViewController)?.frontNVC
        _ = frontNVC?.popViewController(animated: true)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
