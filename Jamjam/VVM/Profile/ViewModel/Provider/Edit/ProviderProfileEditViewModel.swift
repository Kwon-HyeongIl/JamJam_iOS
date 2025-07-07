//
//  ProviderProfileEditViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 7/4/25.
//

import Foundation

@Observable
class ProviderProfileEditViewModel {
    var pageIndex = 4
    
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
    var careerFormList: [CareerFormDomainModel] = []
    
    // MARK: Page Index 3
    var degreeFormList: [DegreeFormDomainModel] = []
    var certificateFormList: [CertificateFormDomainModel] = []
    
    // MARK: Page Index 4
    var startTime = 6.0 / 24.0
    var endTime = 18.0 / 24.0
    let hourStep = 1.0 / 24.0
    
    func detailSkillText(id: Int) -> String? {
        ProfileInfoManager.extractDetailSkillTextWithId(id: id)
    }
    
    func removeCurrentCareerForm(_ form: CareerFormDomainModel) {
        if let index = careerFormList.firstIndex(where: { $0.id == form.id }) {
            DispatchQueue.main.async {
                self.careerFormList.remove(at: index)
            }
        }
    }
    
    func removeCurrentDegreeForm(_ form: DegreeFormDomainModel) {
        if let index = degreeFormList.firstIndex(where: { $0.id == form.id }) {
            DispatchQueue.main.async {
                self.degreeFormList.remove(at: index)
            }
        }
    }
    
    func removeCurrentCertificateForm(_ form: CertificateFormDomainModel) {
        if let index = certificateFormList.firstIndex(where: { $0.id == form.id }) {
            DispatchQueue.main.async {
                self.certificateFormList.remove(at: index)
            }
        }
    }
    
    func convertTimeTo24(_ sliderValue: Double) -> String {
        let hour = Int((sliderValue * 24).rounded())
        return String(format: "%02d:00", hour)
    }
}
