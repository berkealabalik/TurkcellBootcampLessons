//
//  Base.swift
//  
//
//  Created by Berke Alabalik on 12.03.2022.
//

import Foundation
import Alamofire

protocol BaseRequestProtocol : AnyObject {
    var host : String { get }
    var route : String { get }
    var httpMethod : HTTPMethod { get }
    var headers : HTTPHeaders { get }
    var timeout : TimeInterval { get }
    var showAlertWhenError : Bool { get }
    var isMultiPart : Bool { get }
}

open class BaseRequest : BaseRequestProtocol {
    public init() {}
    
    open var host : String {
        return ""
    }
    open var route : 
}
