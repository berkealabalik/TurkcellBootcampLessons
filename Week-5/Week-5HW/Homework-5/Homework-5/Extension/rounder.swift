//
//  rounder.swift
//  Homework-5
//
//  Created by Berke Alabalik on 10.02.2022.
//

import UIKit
    extension UIView {
       @IBInspectable var cornerRadius : CGFloat {
           get { return self.cornerRadius}
           set {
               self.layer.cornerRadius = newValue
           }
        }
    }


