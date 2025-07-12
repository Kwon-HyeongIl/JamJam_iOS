//
//  DegreeFormModel.swift
//  Jamjam
//
//  Created by 권형일 on 7/5/25.
//

import Foundation

struct DegreeForm: Identifiable {
    var schoolName = ""
    var major = ""
    var degree = ""
    var fileData = ""
    
    let id = UUID() // Identifiable
}
