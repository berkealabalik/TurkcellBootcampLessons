//
//  UITableViewCell.swift
//  Bitcoin
//
//  Created by Berke Alabalik on 24.03.2022.
//

import Foundation

import UIKit

extension UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
       return UINib(nibName: identifier, bundle: nil)
    }

}
