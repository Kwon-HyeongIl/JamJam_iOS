//
//  CareerFormModel.swift
//  Jamjam
//
//  Created by 권형일 on 7/5/25.
//

import Foundation

struct CareerFormModel: Identifiable {
    var groupName = ""
    var role = ""
    var fileData = ""
    
    let id = UUID() // Identifiable
}
