//
//  ViewController.swift
//  swRevealSlidingMenu
//
//  Created by Rumana Nazmul on 20/6/17.
//  Copyright © 2017 ALFA. All rights reserved.
// https://www.youtube.com/watch?v=8EFfPT3UeWs
//https://github.com/John-Lluch/SWRevealViewController
//https://icons8.com/icon/new-icons/ios7

import UIKit
var areImageLoaded = false



//class ViewController: UIAppViewController, UITextFieldDelegate  {

class ViewController: UIViewController  {
    
    
    // Set the button type as Custom in storyborad MUST

    @IBOutlet weak var menuButton: UIButton!
    
    @IBOutlet weak var homeViewGifImage: UIImageView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("The current value of gameLevel is \(myGameLevel)")
        // Do any additional setup after loading the view, typically from a nib.
        
//        
//        let button = UIButton.init(type: .custom)
//        button.setImage(UIImage.init(named: "menuIcon.png"), for: UIControlState.normal)
//        // button.addTarget(self, action:#selector(back), for: UIControlEvents.touchUpInside)
//        
//        // *The following code is used to add a button to take it back to the BackTableViewController (Menu)*
     menuButton.addTarget(revealViewController(), action:#selector(SWRevealViewController.revealToggle(_:)), for: UIControlEvents.touchUpInside)
//   
//        
//        button.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30) //CGRectMake(0, 0, 30, 30)
//        let backButton = UIBarButtonItem.init(customView: button)  // button is added to barbutton
//        self.navigationItem.leftBarButtonItem = backButton  // Added to navigation item
//
//
//        UINavigationBar.appearance().barTintColor = UIColor(red: 180, green: 32, blue: 68, alpha: 1)
////
//        let logo = UIImage(named: "Logo.png")
//        let logoImgView = UIImageView(image: logo)
//        logoImgView.frame = CGRect(x: 100, y: 10, width: 50, height: 50 )
//        self.navigationItem.titleView = logoImgView
        
        
       self.navigationController?.isNavigationBarHidden = true // Hiding navigation bar to show customized bar
        
        
        if(areImageLoaded == false){
            imageLibrary.loadAllImages()
            areImageLoaded = true
            
            
            let nc = revealViewController().rearViewController as? UINavigationController
            
            (nc?.topViewController as? RearViewController)?.frontNVC = self.navigationController
            (nc?.topViewController as? RearViewController)?.frontVC = self
            
        }
        
        

       var tempImg = imageLibrary.getARandomImage()
       let imgWithoutExt = tempImg.replacingOccurrences(of: ".gif", with: "")
       homeViewGifImage.loadGif(name: imgWithoutExt)
      
//      menuButton.target = revealViewController()
//      menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        
        
       view.addGestureRecognizer(revealViewController().panGestureRecognizer()) // Do slide by swiping without clicking
        
 //       self.revealViewController().panGestureRecognizer()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        
//        self.navigationController?.isNavigationBarHidden =  false
//        self.addCustomNavigationBarToView()
//        
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

