//
//  CornerRadius.swift
//  GameScore
//
//  Created by Berke Alabalik on 6.03.2022.
//

//  rounder.swift
//  onboardingTemplate-Lottie
//
//  Created by Berke Alabalik on 28.02.2022.
//

import UIKit

//
// Inspectable - Design and layout for View
// cornerRadius, borderWidth, borderColor
//
extension UIView {
   
 // WARNİNG !!!!!!!! ONLY 1 Value It Can Take . IF YOU WRITE NUMBER BOTH RİGHT OR LEFT CORNER IT WONT WORK.
    // ONLY WRİTE NUMBER ONE ONLY !!
  
    @IBInspectable var RightCorners : CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner]
        }
    }
    
    @IBInspectable var LeftCorners : CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMinXMinYCorner]
        }
        
    }
        
        @IBInspectable var AllCorners : CGFloat {
            get {
                return self.layer.cornerRadius
            }
            set {
                self.layer.cornerRadius = newValue
                
            }
    }
    
    @IBInspectable var TopCorners : CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        }
}
    
    @IBInspectable var BottomCorners : CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        }
}
    
    
    
    
  
    
}

