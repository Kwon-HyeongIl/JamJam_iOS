//
//  ProviderProfileEditViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 7/4/25.
//

import Foundation
import Combine
import os

@Observable
class EditProviderProfileViewModel {
    var pageIndex = 0
    
    var isProfileInfoCompleted = false
    
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
    var selectedRegion = ""
    var selectedSkill: SkillCategory?
    
    var isAllValidatedInPageIndex0: Bool {
        !inputIntroduction.isEmpty &&
        !selectedRegion.isEmpty &&
        selectedSkill != nil
    }
    
    // MARK: Page Index 1
    var selectedDetailSkillIds: [Int] = []
    var tappedSkillForSheet: SkillCategory?
    var isSheetVisible = false
    
    var isAllValidatedInPageIndex1: Bool {
        !selectedDetailSkillIds.isEmpty
    }
    
    // MARK: Page Index 2
    var careerFormList: [CareerForm] = []
    
    // MARK: Page Index 3
    var degreeFormList: [DegreeForm] = []
    var certificateFormList: [CertificateForm] = []
    
    // MARK: Page Index 4
    var startTime = 6.0 / 24.0
    var endTime = 18.0 / 24.0
    let hourStep = 1.0 / 24.0
    
    var isUpdatePrividerCompleted = false
    
    @ObservationIgnored var cancellables = Set<AnyCancellable>()
    @ObservationIgnored let logger = Logger(subsystem: "com.khi.jamjam", category: "EditProviderProfileViewModel")
    
    init() {
        checkProfileInfoCompletion()
    }
    
    func checkProfileInfoCompletion() {
        UserManager.fetchProvider()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[fetchProvider] completion finished")
                case .failure(let error):
                    self?.logger.error("[fetchProvider] completion failed: \(error)")
                }
                
            } receiveValue: { [weak self] response in
                if response.code == "SUCCESS" {
                    self?.logger.info("[fetchProvider] SUCCESS")
                    
                    if let content = response.content  {
                        self?.isProfileInfoCompleted = true
                        self?.inputIntroduction = content.introduction
                        self?.selectedRegion = content.location
                        self?.selectedSkill = SkillCategory(rawValue: content.categoryId)
                        self?.selectedDetailSkillIds = (content.skills ?? []).compactMap(\.id)
                    }
             
                } else {
                    self?.logger.error("[fetchProvider] 응답 처리 실패: \(response.message)")
                }
            }
            .store(in: &self.cancellables)
    }
    
    func detailSkillText(id: Int) -> String? {
        ProfileInfoManager.extractDetailSkillTextWithId(id: id)
    }
    
    func removeCurrentCareerForm(_ form: CareerForm) {
        if let index = careerFormList.firstIndex(where: { $0.id == form.id }) {
            DispatchQueue.main.async {
                self.careerFormList.remove(at: index)
            }
        }
    }
    
    func removeCurrentDegreeForm(_ form: DegreeForm) {
        if let index = degreeFormList.firstIndex(where: { $0.id == form.id }) {
            DispatchQueue.main.async {
                self.degreeFormList.remove(at: index)
            }
        }
    }
    
    func removeCurrentCertificateForm(_ form: CertificateForm) {
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
    
    func registerProviderInfo() {
        guard let categoryId = selectedSkill?.rawValue else { return }
        
        let request = UpdateProviderInfoRequestDto(
            deletedSkillIds: nil,
            deletedCareerIds: nil,
            skills: selectedDetailSkillIds.map {
                .init(id: $0, name: "")
            },
            deletedEducationIds: nil,
            educations: nil,
            contactHours: .init(startHour: "03", endHour: "23"),
            deletedLicenseIds: nil,
            licenses: nil,
            careers: nil,
            location: selectedRegion,
            categoryId: categoryId,
            introduction: inputIntroduction)
        
        UserManager.registerProviderInfo(request)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[updateProviderInfo] finished")
                case .failure(let error):
                    self?.logger.error("[updateProviderInfo] failed: \(error)")
                }
            } receiveValue: { [weak self] response in
                if response.code == "SUCCESS" {
                    self?.logger.info("[updateProviderInfo] SUCCESS")
                    self?.isUpdatePrividerCompleted = true
                    
                } else {
                    self?.logger.error("[updateProviderInfo] 응답 실패: \(response.message)")
                }
            }
            .store(in: &self.cancellables)
    }
    
    func updateProviderInfo() {
        guard let categoryId = selectedSkill?.rawValue else { return }
        
        let request = UpdateProviderInfoRequestDto(
            deletedSkillIds: nil,
            deletedCareerIds: nil,
            skills: selectedDetailSkillIds.map {
                .init(id: $0, name: "")
            },
            deletedEducationIds: nil,
            educations: nil,
            contactHours: .init(startHour: "03", endHour: "23"),
            deletedLicenseIds: nil,
            licenses: nil,
            careers: nil,
            location: selectedRegion,
            categoryId: categoryId,
            introduction: inputIntroduction)
        
        UserManager.updateProviderInfo(request)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[updateProviderInfo] finished")
                case .failure(let error):
                    self?.logger.error("[updateProviderInfo] failed: \(error)")
                }
            } receiveValue: { [weak self] response in
                if response.code == "SUCCESS" {
                    self?.logger.info("[updateProviderInfo] SUCCESS")
                    self?.isUpdatePrividerCompleted = true
                    
                } else {
                    self?.logger.error("[updateProviderInfo] 응답 실패: \(response.message)")
                }
            }
            .store(in: &self.cancellables)
    }
}
