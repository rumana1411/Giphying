//
//  AboutViewController.swift
//  SwappingCollectionView
//
//  Created by Rumana Nazmul on 27/6/17.
//  Copyright © 2017 Paweł Łopusiński. All rights reserved.
//

import UIKit

//To add back button delete the left bar button from the navigation item in scene controller. Then Add the code written here.

class AboutViewController: UIViewController {

    // Set the button type as Custom in storyborad MUST
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Code for back button
       // let button = UIButton.init(type: .custom)
        backButton.setImage(UIImage.init(named: "Back.png"), for: UIControlState.normal)
  //    button.addTarget(revealViewController(), action:#selector(SWRevealViewController.revealToggle(_:)), for:   UIControlEvents.touchUpInside)
        backButton.addTarget(self, action:#selector(back), for: UIControlEvents.touchUpInside)
        backButton.frame = CGRect.init(x: 10, y: 20, width: 30, height: 30) //CGRectMake(0, 0, 30, 30)
        
//        let backButton = UIBarButtonItem.init(customView: button)
//        self.navigationItem.leftBarButtonItem = backButton
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
