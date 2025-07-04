//
//  ProviderProfileEditViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 7/4/25.
//

import Foundation

@Observable
class ProviderProfileEditViewModel {
    var pageIndex = 3
    
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
    
    var isAllValidatedInPageIndex0: Bool {
        !inputIntroduction.isEmpty &&
        selectedRegion != nil &&
        selectedSkill != nil
    }
    
    // MARK: Page Index 1
    var selectedDetailSkillIds: [Int] = []
    var tappedSkill: Skill?
    var isSheetVisible = false
    
    var isAllValidatedInPageIndex1: Bool {
        !selectedDetailSkillIds.isEmpty
    }
    
    // MARK: Page Index 2
    var careerFormList: [CareerFormModel] = []
    
    // MARK: Page Index 3
    var degreeFormList: [DegreeFormModel] = []
    var certificateFormList: [CertificateFormModel] = []
    
    func detailSkillText(id: Int) -> String? {
        ProfileInfoManager.extractDetailSkillTextWithId(id: id)
    }
    
    func removeCurrentCareerForm(_ form: CareerFormModel) {
        if let index = careerFormList.firstIndex(where: { $0.id == form.id }) {
            DispatchQueue.main.async {
                self.careerFormList.remove(at: index)
            }
        }
    }
    
    func removeCurrentDegreeForm(_ form: DegreeFormModel) {
        if let index = degreeFormList.firstIndex(where: { $0.id == form.id }) {
            DispatchQueue.main.async {
                self.degreeFormList.remove(at: index)
            }
        }
    }
    
    func removeCurrentCertificateForm(_ form: CertificateFormModel) {
        if let index = certificateFormList.firstIndex(where: { $0.id == form.id }) {
            DispatchQueue.main.async {
                self.certificateFormList.remove(at: index)
            }
        }
    }
}
