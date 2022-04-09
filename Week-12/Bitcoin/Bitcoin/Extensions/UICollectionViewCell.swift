//
//  UICollectionViewCell.swift
//  Bitcoin
//
//  Created by Berke Alabalik on 20.03.2022.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
       return UINib(nibName: identifier, bundle: nil)
    }

}
