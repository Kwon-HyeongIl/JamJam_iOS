//
//  CertificateFormModel.swift
//  Jamjam
//
//  Created by 권형일 on 7/5/25.
//

import Foundation

struct CertificateFormModel: Identifiable {
    var certificateName = ""
    var fileData = ""
    
    let id = UUID() // Identifiable
}
