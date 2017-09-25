//
//  DeatilViewController.swift
//  SwappingCollectionView
//
//  Created by Rumana Nazmul on 24/5/17.
//  Copyright © 2017 Paweł Łopusiński. All rights reserved.
//

import UIKit


class DeatilViewController: UIViewController {

    @IBOutlet weak var detailImgView: UIImageView!
        var myIndex: Int!
       // var passedVal: String!
   // var passedVal: String!
    
    @IBAction func startButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "ShowPlayView", sender: myIndex)
        print("pressed")
        
    }
    @IBOutlet weak var backButton: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.frame = CGRect.init(x: 10, y: 20, width: 30, height: 30) //CGRectMake(0, 0, 30, 30)
        backButton.setImage(UIImage.init(named: "Back.png"), for: UIControlState.normal)
        backButton.addTarget(self, action:#selector(back), for: UIControlEvents.touchUpInside)
        

        
  //      myIndex = Int(passedVal)
        print(myIndex)
       
        let tempImg = myGifArray[myIndex]
        let imgWithoutExt = tempImg.replacingOccurrences(of: ".gif", with: "")
        detailImgView.loadGif(name: imgWithoutExt)

       
    }
    
    func back() {
        
        //  print("BAckBack")
        let nc = revealViewController().rearViewController as? UINavigationController
        let frontNVC = (nc?.topViewController as? RearViewController)?.frontNVC
        _ = frontNVC?.popViewController(animated: true)
        
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowPlayView"{
            
          if let dest = segue.destination as? FrameViewController{
                
           dest.myIndex = sender as! Int
            print("Adeepta")
            
            }
    }
    
    
  }

}

