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
    
    var pageIndex = 0
    var title: String {
        switch pageIndex {
        case 0:
            return "전문가 소개"
        case 1:
            return "보유 기술"
        case 2:
            return "경력 사항"
        case 3:
            return "학력 및 자격증"
        case 4:
            return "연락 가능 시간"
        default:
            return ""
        }
    }
    
    // MARK: Page Index 0
    var inputIntroduction = ""
    var selectedRegion: Region?
    var selectedSkill: Skill?
    
    // MARK: Page Index 1
    var selectedSkillIds: [Int] = []
    var tappedSkill: Skill?
    var isSheetVisible = false
    
    
    // MARK: Hashable, Equatable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: ProviderProfileEditViewModel, rhs: ProviderProfileEditViewModel) -> Bool {
        return lhs.id == rhs.id
    }
}
