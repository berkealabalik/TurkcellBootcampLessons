//
//  UITableViewCell.swift
//  Userhost
//
//  Created by Berke Alabalik on 4.04.2022.
//

import Foundation
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
