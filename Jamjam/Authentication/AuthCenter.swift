//
//  AuthCenter.swift
//  Jamjam
//
//  Created by 권형일 on 6/23/25.
//

import Foundation
import Combine
import Alamofire

@Observable
class AuthCenter {
    static let shared = AuthCenter()
    
    var jwtToken: String?
    
    
}
