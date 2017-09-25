//
//  CustomNavBar.swift
//  SwappingCollectionView
//
//  Created by Rumana Nazmul on 29/6/17.
//  Copyright © 2017 Paweł Łopusiński. All rights reserved.
//

import UIKit

class CustomNavBar: UINavigationBar {

        override func sizeThatFits(_ size: CGSize) -> CGSize {
            let newSize :CGSize = CGSize(width: self.frame.size.width, height: 300)
            return newSize
        }
    }

