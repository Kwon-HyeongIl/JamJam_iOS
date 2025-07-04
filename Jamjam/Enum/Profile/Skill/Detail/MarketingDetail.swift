//
//  MarketingDetail.swift
//  Jamjam
//
//  Created by 권형일 on 7/4/25.
//

import Foundation

enum MarketingDetail: Int, CaseIterable, Codable {
    case digitalMarketing = 31
    case snsMarketing = 32
    case contentMarketing = 33
    case viralMarketing = 34
    case seoSem = 35
    case branding = 36
    case advertisingPlanning = 37
    case publicRelations = 38
    case marketingAnalytics = 39
    case customerManagement = 40
    case crmCampaign = 41
    case emailMarketing = 42
    case influencerMarketing = 43
    case retargetingAds = 44
    case marketingAutomation = 45

    var text: String {
        switch self {
        case .digitalMarketing: return "디지털 마케팅"
        case .snsMarketing: return "SNS 마케팅"
        case .contentMarketing: return "콘텐츠 마케팅"
        case .viralMarketing: return "바이럴 마케팅"
        case .seoSem: return "SEO/SEM"
        case .branding: return "브랜딩"
        case .advertisingPlanning: return "광고기획"
        case .publicRelations: return "PR"
        case .marketingAnalytics: return "마케팅 분석"
        case .customerManagement: return "고객관리"
        case .crmCampaign: return "CRM 캠페인 운영"
        case .emailMarketing: return "이메일 마케팅"
        case .influencerMarketing: return "인플루언서 마케팅"
        case .retargetingAds: return "리타게팅 광고"
        case .marketingAutomation: return "마케팅 자동화"
        }
    }
}
