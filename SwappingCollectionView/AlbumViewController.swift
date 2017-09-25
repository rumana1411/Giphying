//
//  AlbumViewController.swift
//  SwappingCollectionView
//
//  Created by Rumana Nazmul on 24/5/17.
//  Copyright © 2017 Paweł Łopusiński. All rights reserved.
//

import UIKit


    var myGifArray = [String]()
  //var myGifArray = ["b_001","b_002","i_001","i_002","a_001","a_002"]

    class AlbumViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
        
        // Set the button type as Custom in storyborad MUST
        @IBOutlet weak var backButton: UIButton!
      
        // @IBOutlet weak var menuButton: UIBarButtonItem!
        
        var collectionView: UICollectionView!
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            
            
//            let button = UIButton.init(type: .custom)
//            button.setImage(UIImage.init(named: "Back.png"), for: UIControlState.normal)
//         //   button.addTarget(revealViewController(), action:#selector(SWRevealViewController.revealToggle(_:)), for: UIControlEvents.touchUpInside) // To return to BackTableView (Menu)
//            button.addTarget(self, action:#selector(back), for: UIControlEvents.touchUpInside)
//            button.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30) //CGRectMake(0, 0, 30, 30)
//            let backButton = UIBarButtonItem.init(customView: button) // Adding bar button to barButton
//            self.navigationItem.leftBarButtonItem = backButton
         
            
            
            backButton.frame = CGRect.init(x: 10, y: 20, width: 30, height: 30) //CGRectMake(0, 0, 30, 30)
            backButton.setImage(UIImage.init(named: "Back.png"), for: UIControlState.normal)
            backButton.addTarget(self, action:#selector(back), for: UIControlEvents.touchUpInside)


            
            print("The Game Level is : \(myGameLevel)")
            myGifArray = imageLibrary.getImageList()
            //for i in myGifArray{
              //  print(i)
            //}
            
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            
            
            //   layout.itemSize = CGSize(width: 90, height: 120)
            layout.itemSize = CGSize(width: 150, height: 150)
            
           // collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout) // Covers the whole screen
            
        //    collectionView = UICollectionView(frame: CGRect(x:0, y: 100, width: self.view.frame.width, height: self.view.frame.height),collectionViewLayout: layout) // Detail
            
            
        collectionView = UICollectionView(frame: CGRect(x:0, y: 85, width: self.view.frame.width, height: self.view.frame.height - 80),collectionViewLayout: layout)
            collectionView.dataSource = self
            collectionView.delegate = self
            //collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell") // Without Custom Cell
            collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "Cell")
            collectionView.backgroundColor = UIColor.white
            self.view.addSubview(collectionView)
            
            
            
        }
        
        func back() {
            
            //  print("BAckBack")
            let nc = revealViewController().rearViewController as? UINavigationController
            let frontNVC = (nc?.topViewController as? RearViewController)?.frontNVC
            _ = frontNVC?.popViewController(animated: true)
            
            
        }

        
        
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return myGifArray.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            //  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) // Without Custom cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCell
            cell.backgroundColor = UIColor.orange
            let tempImg = myGifArray[indexPath.row]
            let imgWithoutExt = tempImg.replacingOccurrences(of: ".gif", with: "")
            cell.myImgView.loadGif(name: imgWithoutExt)
            cell.myLbl.text = String(indexPath.row)
           
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
            performSegue(withIdentifier: "ShowLargeView", sender: indexPath.row)
        }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            if segue.identifier == "ShowLargeView" {
                
                if let dest = segue.destination as? DeatilViewController{
                    
                  // dest.passedVal = sender as String!
             //       dest.myIndex = sender as! Int
                    dest.myIndex = sender as! Int
                    print("Liza")
                }
            }
        }
        
        
}


