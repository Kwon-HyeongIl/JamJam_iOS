//
//  ManagementDetail.swift
//  Jamjam
//
//  Created by 권형일 on 7/4/25.
//

import Foundation

enum ManagementDetail: Int, CaseIterable, Codable {
    case businessPlan = 1
    case marketResearch = 2
    case strategyPlanning = 3
    case organizationManagement = 4
    case projectManagement = 5
    case swotAnalysis = 6
    case financialPlanning = 7
    case investmentPlanning = 8
    case riskManagement = 9
    case performanceManagement = 10
    case businessModelDevelopment = 11
    case okrKpiDesign = 12
    case executiveReport = 13
    case processDiagnosis = 14
    case pmoOperation = 15

    var displayName: String {
        switch self {
        case .businessPlan: return "사업계획서 작성"
        case .marketResearch: return "시장조사"
        case .strategyPlanning: return "경영전략 수립"
        case .organizationManagement: return "조직관리"
        case .projectManagement: return "프로젝트 관리"
        case .swotAnalysis: return "SWOT 분석"
        case .financialPlanning: return "재무계획"
        case .investmentPlanning: return "투자계획"
        case .riskManagement: return "리스크 관리"
        case .performanceManagement: return "성과관리"
        case .businessModelDevelopment: return "비즈니스 모델 개발"
        case .okrKpiDesign: return "OKR/KPI 설계"
        case .executiveReport: return "경영진 보고서 작성"
        case .processDiagnosis: return "내부 프로세스 진단"
        case .pmoOperation: return "PMO 운영"
        }
    }
}
