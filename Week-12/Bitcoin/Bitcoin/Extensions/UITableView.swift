//
//  UITableView.swift
//  Bitcoin
//
//  Created by Berke Alabalik on 24.03.2022.
//



import Foundation
import UIKit

extension UITableView{
    
    func register(cellType: UITableViewCell.Type) {
        register(cellType.nib, forCellReuseIdentifier: cellType.identifier)
    }
    
    func dequeCell<T: UITableViewCell>(cellType: T.Type, indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: cellType.identifier, for: indexPath) as? T else {
            fatalError("Hata meydana geldi")
        }
        
        return cell
    }
}
