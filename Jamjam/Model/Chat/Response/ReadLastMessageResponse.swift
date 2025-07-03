//
//  ReadLastMessageResponse.swift
//  Jamjam
//
//  Created by 권형일 on 7/3/25.
//

import Foundation

struct ReadLastMessageResponse: Decodable {
    let code: String
    let message: String
    let content: Content?
    
    struct Content: Decodable {
        
    }
}
