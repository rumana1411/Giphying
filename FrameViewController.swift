//
//  FrameViewController.swift
//  SwappingCollectionView
//
//  Created by Rumana Nazmul on 9/6/17.
//  Copyright © 2017 Paweł Łopusiński. All rights reserved.
//



import UIKit
import ImageIO
import MobileCoreServices

var from: Int = -1
var to: Int = -1
var result: [Int] = []
var flag:[Bool] = []
    
    class FrameViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
        
        var timer = Timer()
        
        
        func generateResult()->Int{
            var counter:Int = 0
            for i in 0..<myImgArray.count{
                print("\(result[i])")
                
                if result[i] == i{
                    counter = counter + 1
                }
            }
            return counter
        }
        
        @IBOutlet weak var collectionView: UICollectionView!
        
        @IBOutlet weak var backButton: UIButton!
        
        func Checking() {
            
            /*for farhan in collectionView.visibleCells as! [TestCell]{
                //print("\(farhan.position)")
                  print("\(farhan.orderLabel.text)")
            }


            
            //for liza in collectionView.visibleCells as [TestCell]{
              //  print("\(liza.position)")
            //}
          */
            if result.count != myImgArray.count{
                    print("No all images are rendered!!!")
            }
            else{
                let finalResult = generateResult()
                if finalResult == myImgArray.count{
                    print("Congratulations, 100% Match")
                }
                else{
                    let fraction = Float(finalResult)/(Float(myImgArray.count))
                    print("Well Done,. but \(fraction*100)% match")
                }
            }
        }
        var myIndex: Int!
        var myImgArray: [UIImage] = []
        var uiButton1 = UIButton()
        var time = 60

        var longPressGesture : UILongPressGestureRecognizer!
        
        func getARandomValue()->Int{
            var aRndNumber: Int = Int(arc4random_uniform(UInt32(myImgArray.count)))
         

            while flag[aRndNumber] == true{
                aRndNumber = Int(arc4random_uniform(UInt32(myImgArray.count)))
            }
            flag[aRndNumber] = true
            return aRndNumber
        }
        
        func initializeFlagAndResultArray(arraySize: Int){
            flag = []
            result = []
            for _ in 0..<arraySize{
                flag.append(false)
            }
            
            for _ in 0..<arraySize{
                let k = getARandomValue()
                result.append(k)
            }
        }
        func invalidateTimer(){
            timer.invalidate()
        }
        func processTimer(){
            let remaining = "Remaining: " + String(time)  + "s"

            uiButton1.setTitle(remaining, for: .normal)
            time -= 1
            
            if(time<0){
                invalidateTimer()
                // Move to next modal to show the summary
            }
            
        }
        func CreateTimer(){
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(processTimer), userInfo: nil, repeats: true)
        }
        override func viewDidLoad() {
            super.viewDidLoad()
            
            CreateTimer()
            
            print("myIndex from ViewController \(myIndex)")
            
            backButton.frame = CGRect.init(x: 10, y: 20, width: 30, height: 30) //CGRectMake(0, 0, 30, 30)
            backButton.setImage(UIImage.init(named: "Back.png"), for: UIControlState.normal)
            backButton.addTarget(self, action:#selector(back), for: UIControlEvents.touchUpInside)
            

            
            let gifController = GifToFrames(selectedGif: myGifArray[myIndex])
            myImgArray = gifController.SelectedFrames()
            initializeFlagAndResultArray(arraySize: myImgArray.count)
            
            
            self.collectionView?.backgroundColor = UIColor.white
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
            self.collectionView.register(UINib(nibName: "TestCell", bundle: Bundle.main), forCellWithReuseIdentifier: "cell")
            
            //  collectionView.register(TestCell.self, forCellWithReuseIdentifier: "cell")
            longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(FrameViewController.handleLongGesture(_:)))
            self.collectionView?.addGestureRecognizer(longPressGesture)
            
            
            /*  
                    Adding an UI element
            */
            
            let theHeight = view.frame.size.height //grabs the height of your view
            let theWidth = view.frame.size.width //grabs the height of your view
            
            let fixedBar = UIView()
            
          //  fixedBar.backgroundColor = UIColor(red: 7/255, green: 152/255, blue: 253/255, alpha: 0.5)
            fixedBar.frame = CGRect(x: 0, y: theHeight - 50 , width: self.view.frame.width, height: 50)
            
            
            uiButton1.frame = CGRect(x: 10, y: 0, width: theWidth/2-10, height: 50)
            uiButton1.backgroundColor = UIColor(red: 200/255, green: 30/255, blue: 60/255, alpha: 1)

            
            uiButton1.setTitle("Remaining: " + String(time)  + "s", for: .normal)
            uiButton1.tag = 1
            uiButton1.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            
            var uiButton2 = UIButton()
            uiButton2.frame = CGRect(x: theWidth/2+10, y: 0, width: theWidth/2-20, height: 50)
            uiButton2.backgroundColor = UIColor.green
            uiButton2.setTitle("Finish", for: .normal)
            uiButton2.tag = 2
            uiButton2.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            
            fixedBar.addSubview(uiButton1)
            fixedBar.addSubview(uiButton2)
            
            self.view.addSubview(fixedBar)
            
        }
        
        func buttonAction(sender: UIButton!) {
            let btnsendtag: UIButton = sender
            if btnsendtag.tag == 1 {
                self.view.alpha = 0.2
            }
            else if btnsendtag.tag == 2 {
                print("2")
                Checking()
                self.view.alpha = 1
            }
        }
        
        func handleLongGesture(_ gesture: UILongPressGestureRecognizer) {
            
            switch(gesture.state) {
                
            case UIGestureRecognizerState.began:
                guard let selectedIndexPath = self.collectionView?.indexPathForItem(at: gesture.location(in: self.collectionView)) else {
                    break
                }
                collectionView?.beginInteractiveMovementForItem(at: selectedIndexPath)
            case UIGestureRecognizerState.changed:
                collectionView?.updateInteractiveMovementTargetPosition(gesture.location(in: gesture.view!))
            case UIGestureRecognizerState.ended:
                collectionView?.endInteractiveMovement()
            default:
                collectionView?.cancelInteractiveMovement()
            }
        }
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return myImgArray.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let tCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TestCell
           
            let i: Int = result[indexPath.row]
            tCell.orderLabel.text = "Hello \(i)"
            tCell.myImgView.image = myImgArray[i]
            tCell.position = i //* indexPath.row
            
            
            print("Farhan\(i)\n")
            return tCell
        }
        
        func collectionView(_ collectionView: UICollectionView,
                            moveItemAt sourceIndexPath: IndexPath,
                            to destinationIndexPath: IndexPath) {
       //     let item = self.order[sourceIndexPath.item]
       //     self.order.remove(at: sourceIndexPath.item)
       //     self.order.insert(item, at: destinationIndexPath.item)
            
            
            let item = self.myImgArray[sourceIndexPath.item]
            self.myImgArray.remove(at: sourceIndexPath.item)
            self.myImgArray.insert(item, at: destinationIndexPath.item)
        }
        
        func back() {
            
            //  print("BAckBack")
            let nc = revealViewController().rearViewController as? UINavigationController
            let frontNVC = (nc?.topViewController as? RearViewController)?.frontNVC
            _ = frontNVC?.popViewController(animated: true)
            
            
        }

        
}


