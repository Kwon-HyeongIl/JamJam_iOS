//
//  EducationDetail.swift
//  Jamjam
//
//  Created by 권형일 on 7/4/25.
//

import Foundation

enum EducationDetail: Int, CaseIterable, Codable {
    case onlineLecture = 137
    case corporateTraining = 138
    case oneToOneTutoring = 139
    case groupClass = 140
    case workshop = 141
    case seminarHosting = 142
    case eLearningContent = 143
    case curriculumDevelopment = 144
    case lectureMaterial = 145
    case examCreation = 146
    case mentoringProgram = 147
    case literacyEducation = 148
    case digitalLiteracy = 149
    case teachingMethodConsulting = 150
    case instructorCoaching = 151

    var text: String {
        switch self {
        case .onlineLecture: return "온라인 강의"
        case .corporateTraining: return "기업교육"
        case .oneToOneTutoring: return "1:1 과외"
        case .groupClass: return "그룹 수업"
        case .workshop: return "워크샵"
        case .seminarHosting: return "세미나 진행"
        case .eLearningContent: return "e-러닝 콘텐츠"
        case .curriculumDevelopment: return "교육과정 개발"
        case .lectureMaterial: return "강의자료 제작"
        case .examCreation: return "시험출제"
        case .mentoringProgram: return "멘토링 프로그램 기획"
        case .literacyEducation: return "문해력 교육"
        case .digitalLiteracy: return "디지털 리터러시"
        case .teachingMethodConsulting: return "교수법 컨설팅"
        case .instructorCoaching: return "강사 코칭"
        }
    }
}
