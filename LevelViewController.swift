//
//  LevelViewController.swift
//  SwappingCollectionView
//
//  Created by Rumana Nazmul on 14/7/17.
//  Copyright © 2017 Paweł Łopusiński. All rights reserved.
//

import UIKit

class LevelViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var LevelTable: UITableView!
    @IBOutlet weak var menuButton: UIButton!
    
 //   var popup:UIView!

    var levelArray = ["Beginner","Intermediate","Advanced"]
    
    /*static func ShowAlert() {
        // customise your view
        popup = UIView(frame: CGRect(x: 100, y: 200, width: 200, height: 200))
        popup.backgroundColor = UIColor.redColor
        
        // show on screen
        self.view.addSubview(popup)
        
        // set the timer
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.dismissAlert), userInfo: nil, repeats: false)
    }
    
    func dismissAlert(){
        if popup != nil { // Dismiss the view from here
            popup.removeFromSuperview()
        }
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        LevelTable.delegate = self
        LevelTable.dataSource = self
        
        self.navigationController?.isNavigationBarHidden = true
        
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 3
    }
    
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell()
        cell.textLabel?.text = levelArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myGameLevel = indexPath.row+1;
        print("The current value of gameLevel is \(myGameLevel)")
        
        Helper.SetGameLevel()
    //    ShowAlert()
        
    }

   

}
