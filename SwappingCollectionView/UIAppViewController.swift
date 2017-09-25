//
//  UIAppViewController.swift
//  SwappingCollectionView
//
//  Created by Rumana Nazmul on 29/6/17.
//  Copyright © 2017 Paweł Łopusiński. All rights reserved.
//

import UIKit

class UIAppViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func addCustomNavigationBarToView()
    {
        // Create the navigation bar
        let navigationBar = UINavigationBar()
        navigationBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 150)
      //  navigationBar.tintColor = UIColor.blue  //text color
        navigationBar.barTintColor = UIColor.red  //bar colour
        
        
        // 4
        let img = UIImage(named: "Logo.png")
        let imageView = UIImageView(image: img)
        imageView.frame =  CGRect(x: 50, y: 10, width: 40, height: 40)
        imageView.contentMode = .scaleAspectFit
        
        // 5
        
        
        // Create a navigation item with a title
        let navigationItem = UINavigationItem()
        //   navigationItem.title = "Welcome"
        navigationItem.titleView = imageView
        
      //  navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.orange]
        
        // Create left and right button for navigation item
     //   let leftButton =  UIBarButtonItem(title: "Save", style: UIBarButtonItemStyle.plain, target: self, action: "saveButtonClicked:")
     //   let rightButton = UIBarButtonItem(title: "Right", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        
        // Create two buttons for the navigation item
     //   navigationItem.leftBarButtonItem = leftButton
      //  navigationItem.rightBarButtonItem = rightButton
        
        
        // navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(back))
        // navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named:"Back"), style: .plain, target: self, action: #selector(back))
        //  navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage.init(named: "Back.png"), for: UIControlState.normal)
        // *The following code is used to add a button to take it back to the BackTableViewController (Menu)*
        button.addTarget(revealViewController(), action:#selector(SWRevealViewController.revealToggle(_:)), for: UIControlEvents.touchUpInside)
       
        
        button.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30) //CGRectMake(0, 0, 30, 30)
        let backButton = UIBarButtonItem.init(customView: button)  // button is added to barbutton
        self.navigationItem.leftBarButtonItem = backButton  // Added to navigation item
        

        
        
        // Assign the navigation item to the navigation bar
        navigationBar.items = [navigationItem]
        
        // Make the navigation bar a subview of the current view controller
        self.view.addSubview(navigationBar)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
