//
//  EDevletCellProtocol.swift
//  week6-Lesson
//
//  Created by Berke Alabalik on 12.02.2022.
//

import Foundation

protocol EDevletCellProtocol {
    static var reuseIdentifier : String { get }
    func configure(with edevlet : EDevlet?) // bu protokola uyan her cellEDevlet model alcak
}
