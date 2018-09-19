//
//  UIView+Extensions.swift
//  Assignment
//
//  Created by Umair Ali on 4/9/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat{
        get{
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue;
            layer.masksToBounds = newValue > 0
        }
    }
}
