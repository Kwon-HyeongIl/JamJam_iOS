//
//  VerifySmsRequest.swift
//  Jamjam
//
//  Created by 권형일 on 6/25/25.
//

import Foundation

struct VerifySmsRequestDto: Encodable {
    let phoneNumber: String
    let code: String
}
