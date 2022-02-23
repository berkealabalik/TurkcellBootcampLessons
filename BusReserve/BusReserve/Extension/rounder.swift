//
//  rounder.swift
//  BusReserve
//
//  Created by Berke Alabalik on 13.02.2022.
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
