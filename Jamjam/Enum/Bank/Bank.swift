//
//  Bank.swift
//  Jamjam
//
//  Created by 권형일 on 7/10/25.
//

import Foundation

enum Bank: String, CaseIterable, Codable {
    case bankOfKorea = "001"
    case koreaDevelopmentBank = "002"
    case industrialBankOfKorea = "003"
    case kbKookminBank = "004"
    case suhyupBank = "007"
    case exportImportBank = "008"
    case nonghyupBank = "011"
    case scJeilBank = "023"
    case citibankKorea = "027"
    case daeguBank = "031"
    case busanBank = "032"
    case gwangjuBank = "034"
    case jejuBank = "035"
    case jeonbukBank = "037"
    case gyeongnamBank = "039"
    case postOffice = "071"
    case hanaBank = "080"
    case shinhanBank = "088"
    case kBank = "089"
    case kakaoBank = "090"
    case tossBank = "092"

    var text: String {
        switch self {
        case .bankOfKorea: return "한국은행"
        case .koreaDevelopmentBank: return "산업은행"
        case .industrialBankOfKorea: return "기업은행"
        case .kbKookminBank: return "국민은행"
        case .suhyupBank: return "수협은행"
        case .exportImportBank: return "수출입은행"
        case .nonghyupBank: return "농협은행"
        case .scJeilBank: return "SC제일은행"
        case .citibankKorea: return "한국씨티은행"
        case .daeguBank: return "대구은행"
        case .busanBank: return "부산은행"
        case .gwangjuBank: return "광주은행"
        case .jejuBank: return "제주은행"
        case .jeonbukBank: return "전북은행"
        case .gyeongnamBank: return "경남은행"
        case .postOffice: return "우체국"
        case .hanaBank: return "하나은행"
        case .shinhanBank: return "신한은행"
        case .kBank: return "K뱅크"
        case .kakaoBank: return "카카오뱅크"
        case .tossBank: return "토스뱅크"
        }
    }
}


