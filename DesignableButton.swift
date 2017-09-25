//
//  DesignableButton.swift
//  SwappingCollectionView
//
//  Created by Rumana Nazmul on 24/5/17.
//  Copyright © 2017 Paweł Łopusiński. All rights reserved.
//

import UIKit



@IBDesignable class DesignableButton: UIButton {
    
    @IBInspectable var borderwidth: CGFloat = 0.0{
        
        didSet{
            
            self.layer.borderWidth = borderwidth
        }
        
    }
    
    
    @IBInspectable var bordercolor: UIColor = UIColor.white{
        
        didSet{
            
            self.layer.borderColor  = bordercolor.cgColor
        }
        
    }
    
    @IBInspectable var cornerradius: CGFloat = 0.0{
        
        didSet{
            
            self.layer.cornerRadius = cornerradius
        }
        
    }
    
    
}
