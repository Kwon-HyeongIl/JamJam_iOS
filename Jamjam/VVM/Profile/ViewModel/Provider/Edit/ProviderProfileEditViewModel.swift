//
//  ProviderProfileEditViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 7/4/25.
//

import Foundation

@Observable
class ProviderProfileEditViewModel: Hashable, Equatable {
    let id = UUID() // temp
    
    // MARK: 자기소개 필드
    var inputIntroduction = ""
    var selectedRegion: Region = .none
    var selectedSkill: Skill = .none
    
    // MARK: Hashable, Equatable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: ProviderProfileEditViewModel, rhs: ProviderProfileEditViewModel) -> Bool {
        return lhs.id == rhs.id
    }
}
