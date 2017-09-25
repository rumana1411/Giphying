//
//  CustomCell.swift
//  SwappingCollectionView
//
//  Created by Rumana Nazmul on 24/5/17.
//  Copyright © 2017 Paweł Łopusiński. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    var myImgView: UIImageView!
    var myLbl: UILabel!
    var myView: UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        myView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height*2/3))
        myView.backgroundColor = UIColor.brown
        
        myImgView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height*3/4))
        
        myImgView.contentMode = UIViewContentMode.scaleAspectFit
        // contentView.addSubview(myImgView)
        
        myView.addSubview(myImgView)
        contentView.addSubview(myView)
        
        
        
        myLbl = UILabel(frame: CGRect(x: 0, y: myImgView.frame.size.height, width: frame.size.width, height: frame.size.height/3))
        myLbl.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
        myLbl.textAlignment = .center
        contentView.addSubview(myLbl)
    }
    
    required init?(coder aDecoder: NSCoder) {  // Comes Auto
        fatalError("init(coder:) has not been implemented")
    }
}
