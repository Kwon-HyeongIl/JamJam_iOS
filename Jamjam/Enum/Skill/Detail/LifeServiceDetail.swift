//
//  LifeServiceDetail.swift
//  Jamjam
//
//  Created by 권형일 on 7/4/25.
//

import Foundation

enum LifeServiceDetail: Int, CaseIterable, Codable {
    case cleaningService = 182
    case organizingService = 183
    case penthouseManagement = 184
    case petCare = 185
    case plantCare = 186
    case drivingService = 187
    case errandService = 188
    case movingHelp = 189
    case housekeepingService = 190
    case childcareService = 191
    case waterFilterReplacement = 192
    case applianceRepair = 193
    case laundryService = 194
    case homeCareService = 195
    case seniorCareService = 196

    var text: String {
        switch self {
        case .cleaningService: return "청소 서비스"
        case .organizingService: return "정리정돈"
        case .penthouseManagement: return "펜트하우스 관리"
        case .petCare: return "반려동물 돌봄"
        case .plantCare: return "식물 관리"
        case .drivingService: return "운전대행"
        case .errandService: return "심부름"
        case .movingHelp: return "이사 도움"
        case .housekeepingService: return "가사도우미"
        case .childcareService: return "육아도우미"
        case .waterFilterReplacement: return "정수기 필터 교체"
        case .applianceRepair: return "가전제품 수리"
        case .laundryService: return "세탁 대행"
        case .homeCareService: return "홈케어 서비스"
        case .seniorCareService: return "실버케어 서비스"
        }
    }
}
