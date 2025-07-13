//
//  WriteViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 7/7/25.
//

import Foundation

@Observable
class RegisterServiceViewModel: Hashable, Equatable {
    var pageIndex = 1
    
    // MARK: Page Index 0
    var inputContent = ""
    
    
    
    // MARK: Hashble, Equatable
    let id = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: RegisterServiceViewModel, rhs: RegisterServiceViewModel) -> Bool {
        lhs.id == rhs.id
    }
}
