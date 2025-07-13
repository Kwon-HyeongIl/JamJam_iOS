//
//  CareerFormModel.swift
//  Jamjam
//
//  Created by 권형일 on 7/5/25.
//

import SwiftUI

struct CareerForm: Identifiable {
    var groupName = ""
    var role = ""
    var fileData: [UIImage]?
    
    let id = UUID() // Identifiable
}
