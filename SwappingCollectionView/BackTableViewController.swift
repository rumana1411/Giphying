//
//  BackTableViewController.swift
//  swRevealSlidingMenu
//
//  Created by Rumana Nazmul on 20/6/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import UIKit

class BackTableViewController: UITableViewController {
    
    var menuArray = ["Home","Level","Album","Score","About", "Help"]
    var controllers = ["ViewController","LvlViewController","AlbumViewController","ScrViewController","AboutViewController","HelpViewController"]
    var menuIcon = ["iconsHome","iconsLevel","iconsAbout","iconsScore","iconsAbout","iconsHelp"]
    
    var frontNVC: UINavigationController?
    var frontVC: ViewController?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        
        let logo = UIImage(named: "Logo.png")
        let logoImgView = UIImageView(image: logo)
        logoImgView.frame = CGRect(x: 100, y: 10, width: 10, height: 40 )
        self.navigationItem.titleView = logoImgView
        
    }

  

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        
        return menuArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        var imgName = menuIcon[indexPath.row] + ".png"
        cell.myImgView.image = UIImage(named: imgName)
        cell.myLbl.text = menuArray[indexPath.row]

        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        let revealViewController: SWRevealViewController = self.revealViewController()
//        
//        let cell:CustomTableViewCell = tableView.cellForRow(at: indexPath) as! CustomTableViewCell
//        
//        
//
//        
//     if cell.myLbl.text == "Home"{
//        
//            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let destVC = mainStoryBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//            let newFrontViewController = UINavigationController.init(rootViewController: destVC)
//            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
//        
//        }
//        
//        if cell.myLbl.text == "Level"{
//            
//            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let destVC = mainStoryBoard.instantiateViewController(withIdentifier: "LvlViewController") as! LvlViewController
//            let newFrontViewController = UINavigationController.init(rootViewController: destVC)
//            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
//            
//        }
//                if cell.myLbl.text == "Album"{
//        
//            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let destVC = mainStoryBoard.instantiateViewController(withIdentifier: "AlbumViewController") as! AlbumViewController
//            let newFrontViewController = UINavigationController.init(rootViewController: destVC)
//           revealViewController.pushFrontViewController(newFrontViewController, animated: true)
//          
//         }
//      
//         if cell.myLbl.text == "Score"{
//           
//                let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                let destVC = mainStoryBoard.instantiateViewController(withIdentifier: "ScrViewController") as! ScrViewController
//                let newFrontViewController = UINavigationController.init(rootViewController: destVC)
//                revealViewController.pushFrontViewController(newFrontViewController, animated: true)
//         
//      }
//     
//       if cell.myLbl.text == "About"{
//        
//          let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//          let destVC = mainStoryBoard.instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
//          let newFrontViewController = UINavigationController.init(rootViewController: destVC)
//           revealViewController.pushFrontViewController(newFrontViewController, animated: true)
//                }
//       
//   }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //tableView.deselectRow(at: indexPath, animated: true)
        
        var controller: UIViewController? = nil
        
        switch indexPath.row
        {
        case 0:
            controller = frontVC
            
        default:
            // Instantiate the controller to present
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            controller = storyboard.instantiateViewController(withIdentifier: controllers[indexPath.row])
            
            break
        }
        
        if controller != nil
        {
            // Prevent stacking the same controller multiple times
            _ = frontNVC?.popViewController(animated: false)
            
            // Prevent pushing twice FrontTableViewController
            if !(controller is ViewController) {
                // Show the controller with the front view controller's navigation controller
                frontNVC!.pushViewController(controller!, animated: false)
            }
            
            // Set front view controller's position to left
            revealViewController().setFrontViewPosition(.left, animated: true)
        }
    }


 //   override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
 //
 //       var headerTitle: String!
 //       headerTitle = "Giphying"
  //      return headerTitle
   // }
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        
//        
//        let headerView = UIView()
//        
//    //    headerView.backgroundColor = UIColor.white
//        let viewImg = UIImage(named: "Logo.png")
//        let headerImgView = UIImageView(image: viewImg)
//        headerImgView.frame = CGRect(x: 60, y: 10, width: 120, height: 100)
//        headerView.addSubview(headerImgView)
//        
//        return headerView
//        
//        
//    }
//    
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        
//    
//        return 110
//    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 112
    }
}
