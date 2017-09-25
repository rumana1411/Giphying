//
//  LvlViewController.swift
//  SwappingCollectionView
//
//  Created by Rumana Nazmul on 24/6/17.
//  Copyright © 2017 Paweł Łopusiński. All rights reserved.
//

import UIKit

class LvlViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    // Set the button type as Custom in storyborad MUST
    @IBOutlet weak var backButton: UIButton!
    var lvlArray = ["Beginner","Intermediate","Advanced"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  let button = UIButton.init(type: .custom)
      //  button.setImage(UIImage.init(named: "Back.png"), for: UIControlState.normal)
        
        
      //  button.addTarget(revealViewController(), action:#selector(SWRevealViewController.revealToggle(_:)), for:      UIControlEvents.touchUpInside)
      //  button.addTarget(self, action:#selector(back), for: UIControlEvents.touchUpInside)
        
        
      //  button.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30) //CGRectMake(0, 0, 30, 30)
       
      //  let backButton = UIBarButtonItem.init(customView: button)
        
       //  self.navigationItem.leftBarButtonItem = backButton
        
     //    leftBackButton.addTarget(self, action:#selector(back), for: UIControlEvents.touchUpInside)
       
     //    leftBackButton.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30) //CGRectMake(0, 0, 30, 30)

        
        self.navigationController?.isNavigationBarHidden = true
        

      
        backButton.frame = CGRect.init(x: 10, y: 20, width: 30, height: 30) //CGRectMake(0, 0, 30, 30)
        backButton.setImage(UIImage.init(named: "Back.png"), for: UIControlState.normal)
        backButton.addTarget(self, action:#selector(back), for: UIControlEvents.touchUpInside)
        

        
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return lvlArray.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LvlCell", for: indexPath)
        cell.textLabel?.text = lvlArray[indexPath.row]
        
        return cell
    }
    
   
   

   
   func back() {
    
 print("BAckBack")
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
