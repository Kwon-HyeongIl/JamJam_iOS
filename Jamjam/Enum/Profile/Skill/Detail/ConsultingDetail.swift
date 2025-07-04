//
//  ConsultingDetail.swift
//  Jamjam
//
//  Created by 권형일 on 7/4/25.
//

import Foundation

enum ConsultingDetail: Int, Codable {
    case managementConsulting = 16
    case strategyConsulting = 17
    case organizationConsulting = 18
    case hrConsulting = 19
    case itConsulting = 20
    case startupMentoring = 21
    case careerMentoring = 22
    case careerCoaching = 23
    case lifeCoaching = 24
    case businessCoaching = 25
    case taxAccountingConsulting = 26
    case brandConsulting = 27
    case digitalTransformationConsulting = 28
    case processImprovementMentoring = 29
    case globalExpansionStrategy = 30

    var displayName: String {
        switch self {
        case .managementConsulting: return "경영컨설팅"
        case .strategyConsulting: return "전략컨설팅"
        case .organizationConsulting: return "조직컨설팅"
        case .hrConsulting: return "인사컨설팅"
        case .itConsulting: return "IT컨설팅"
        case .startupMentoring: return "창업멘토링"
        case .careerMentoring: return "취업멘토링"
        case .careerCoaching: return "커리어 코칭"
        case .lifeCoaching: return "라이프 코칭"
        case .businessCoaching: return "비즈니스 코칭"
        case .taxAccountingConsulting: return "세무/회계 컨설팅"
        case .brandConsulting: return "브랜드 컨설팅"
        case .digitalTransformationConsulting: return "디지털 전환(DX) 컨설팅"
        case .processImprovementMentoring: return "프로세스 개선 멘토링"
        case .globalExpansionStrategy: return "해외 진출 전략"
        }
    }
}
