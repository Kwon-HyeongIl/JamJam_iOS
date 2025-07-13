//
//  CertificateFormModel.swift
//  Jamjam
//
//  Created by 권형일 on 7/5/25.
//

import SwiftUI

struct CertificateForm: Identifiable {
    var certificateName = ""
    var fileData: [UIImage]?
    
    let id = UUID() // Identifiable
}
