//
//  LoginResponse.swift
//  Jamjam
//
//  Created by 권형일 on 6/27/25.
//

import Foundation

struct LoginResponse: Decodable {
    let tokenType: String
    let accessToken: String
}
