//
//  AlbumViewController.swift
//  SwappingCollectionView
//
//  Created by Rumana Nazmul on 24/5/17.
//  Copyright © 2017 Paweł Łopusiński. All rights reserved.
//

import UIKit

    var myGifArray = ["1","2","3","4","5","6","7","8"]

    class AlbumViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
        
        
        
        
        var collectionView: UICollectionView!
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            print("The Game Level is : \(gameLevel)")
            
            
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
            
            
            //   layout.itemSize = CGSize(width: 90, height: 120)
            layout.itemSize = CGSize(width: 150, height: 150)
            
            collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
            collectionView.dataSource = self
            collectionView.delegate = self
            //     collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell") // Without Custom Cell
            collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "Cell")
            collectionView.backgroundColor = UIColor.white
            self.view.addSubview(collectionView)
            
            
            
        }
        
        
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return myGifArray.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            //  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) // Without Custom cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCell
            cell.backgroundColor = UIColor.orange
            //   cell.myImgView.image = UIImage(named: "bd1.jpg")
            cell.myImgView.loadGif(name: myGifArray[indexPath.row])
            cell.myLbl.text = String(indexPath.row)
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
            performSegue(withIdentifier: "ShowLargeView", sender: myGifArray[indexPath.row])
        }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            if segue.identifier == "ShowLargeView" {
                
                if let dest = segue.destination as? DeatilViewController{
                    
                  // dest.passedVal = sender as String!
                    dest.passedVal = sender as! String
                }
            }
        }
        
        
}


