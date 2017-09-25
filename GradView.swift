//
//  GradView.swift
//  SwappingCollectionView
//
//  Created by Rumana Nazmul on 24/5/17.
//  Copyright © 2017 Paweł Łopusiński. All rights reserved.
//

import UIKit


    
@IBDesignable class GradView: UIView {

        
        
        @IBInspectable var FirstColor: UIColor = UIColor.blue{
            
            didSet{
                updateView()
            }
            
        }
        
        
        @IBInspectable var SecondColor: UIColor = UIColor.red{
            
            didSet{
                updateView()
            }
            
        }
        
        
        override class var layerClass: AnyClass {
            
            get{
                return CAGradientLayer.self
                
            }
            
            
        }
        
        func updateView(){
            
            var newLayer = layer as! CAGradientLayer
            newLayer.colors = [FirstColor.cgColor,SecondColor.cgColor]
            
        }
        
}

